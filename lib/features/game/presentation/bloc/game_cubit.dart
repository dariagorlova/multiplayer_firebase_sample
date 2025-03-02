import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/index.dart';
import '../../../../core_features/toast_notifications/index.dart';
import '../../index.dart';

part 'game_state.dart';
part 'game_cubit.freezed.dart';

class GameCubit extends Cubit<GameState> {
  final GameRepository _repository;
  final NotificationMediator _notificationMediator;
  final LoggerService _logger;

  Timer? _pingTimer;

  StreamSubscription<GameModel>? _gameSubscription;

  GameCubit(GameRepository repository, NotificationMediator notificationMediator, LoggerService logger)
      : _repository = repository,
        _notificationMediator = notificationMediator,
        _logger = logger,
        super(GameState.initial()) {
    _logger.simple('GameCubit is created');
  }

  Future<void> init(String id) async {
    emit(state.copyWith(myName: _repository.myName));
    _listenToChanges(id);

    // that's how we will tell server that we are alive every 3 seconds we will update user's "lastActive" field
    _pingTimer = Timer.periodic(const Duration(seconds: AppConst.pingDuration), (timer) {
      // each update - 8 bytes.
      _repository.ping();
    });
  }

  void _listenToChanges(String id) {
    // here is a core of the game. here we update the state, and screen's listener and builder reacts to changes
    _gameSubscription = _repository.listenToChanges(id).listen(
      (gameData) async {
        if (gameData.id.isNotEmpty) {
          var gameStatus = GameStatus.initial;
          final myUid = _repository.myUid;
          final itsMe = gameData.players.firstWhereOrNull((player) => player.id == myUid);

          if (gameData.players.length == 1) {
            // actualy, i can be here only if i'm the last one, but... who knows... offline players can reconnect even in a millisecond,
            // when we have just winner
            gameStatus = (itsMe != null) ? GameStatus.win : GameStatus.lose;
          } else if (itsMe == null || itsMe.errorCount == AppConst.maxErrors) {
            gameStatus = GameStatus.lose;
          } else {
            // normal mode, players are playing, sun is shining, and everything is ok. just find out who's turn
            gameStatus = (gameData.curPlayerId == myUid) ? GameStatus.myTurn : GameStatus.notMyTurn;
          }

          if (gameStatus == GameStatus.win || gameStatus == GameStatus.lose) {
            // remove current user from database before he is moved to gameover screen
            await _gameSubscription?.cancel();
            await quit(gameStatus == GameStatus.win);
          }

          emit(state.copyWith(status: gameStatus, board: gameData));
        } else {
          // if there is nothing to listen game is already over, but the player was offline. and now, he reconects and wants to play.
          // nope. lets kick him. it's too late
          _logger.simple('there is nothing to listen, game is already over an all players except current are finished. current was offline');
          _gameSubscription?.cancel();
          emit(state.copyWith(status: GameStatus.lose));
        }
      },
    );
  }

  Future<void> addWord(String word) async {
    if (_repository.myUid != state.board.curPlayerId) {
      _notificationMediator.notify(const AppErrorNotification(GameExceptions(GameExceptionKeys.notYourTurn)));
      return;
    }

    // here the user adds a word.
    final board = state.board;
    var correctWord = true;
    // we should check:
    //1. if the word starts from the letter that is the last letter of the last input word
    final firstChar = board.words.isEmpty ? '' : '${board.words.last.word[board.words.last.word.length - 1].toLowerCase()}';
    if (word[0] != firstChar && firstChar.isNotEmpty) {
      _notificationMediator.notify(const AppErrorNotification(GameExceptions(GameExceptionKeys.wordDoesNotStartFromLastLetter)));
      correctWord = false;
    }
    //2. if the word is already used
    if (board.words.any((wordModel) => wordModel.word == word)) {
      _notificationMediator.notify(const AppErrorNotification(GameExceptions(GameExceptionKeys.wordAlreadyExists)));
      correctWord = false;
    }

    //3. ask gemini if the word is exists in current language (for simplicity - just English)
    if (correctWord) {
      final res = await _repository.checkWordWithAI(word);
      if (res != null) {
        _notificationMediator.notify(AppErrorNotification(GameExceptions(res)));
        correctWord = false;
      }
    }

    try {
      final currentIndex = board.players.indexWhere((player) => player.id == board.curPlayerId);
      final nextPlayerId = _nextPlayer(currentIndex);
      if (correctWord) {
        // and if 1&2&3 are ok the word is correct and can be putted to dbase, and the next player can play
        await _repository.addWordAndChangeUser(
          board.id,
          WordModel(word: word, userName: state.myName),
          board.words.length,
          nextPlayerId,
        );
      } else {
        // if not, give current player +1 error, and the next player can play
        await _repository.changePlayer(
          board.id,
          currentIndex,
          nextPlayerId,
        );
      }
    } on LocalizedException catch (e) {
      _notificationMediator.notify(AppErrorNotification(e));
    }
  }

  Future<void> quit([bool? forceDelete]) async {
    try {
      // here the user wants to quit before game is over
      // so, user can just delete his credentials from the game node in rtdb. the rest will be done automatically by the listener
      await _repository.quitGame(state.board.id, forceDelete ?? state.board.players.length == 1);
    } on LocalizedException catch (e) {
      _notificationMediator.notify(AppErrorNotification(e));
    }
  }

  Future<void> forceChangePlayer() async {
    //! better to do it as a periodic function, cuz in a moment of launch, another users online status can be faked.

    // this function is launched in countdown timer comes to 0 and there is no reaction from the current user.
    // this function can be launched NOT only from current user, but from the next online player of current game
    try {
      final board = state.board;
      // first things first, we have to find out who is the next player. let's get it's index from the players list
      final currentIndex = board.players.indexWhere((player) => player.id == board.curPlayerId);

      // now, we have to find the nearest player from current (including current) who is online and can launch changePlayer
      final nearestId = await _repository.findNearestOnlinePlayerFromList(board.players.map((e) => e.id).toList(), board.curPlayerId);

      // player is found and it's me. so, i have to launch changePlayer
      if (nearestId == _repository.myUid) {
        final nextPlayerId = _nextPlayer(currentIndex);

        await _repository.changePlayer(board.id, currentIndex, nextPlayerId);
      }
    } on LocalizedException catch (e) {
      _notificationMediator.notify(AppErrorNotification(e));
    }
  }

  String _nextPlayer(int currentIndex) {
    final board = state.board;
    final nextPlayer = board.players
        .skip(currentIndex + 1)
        .followedBy(
          board.players.take(currentIndex + 1),
        )
        .firstWhereOrNull((player) => player.errorCount < AppConst.maxErrors);

    return nextPlayer?.id ?? board.curPlayerId;
  }

  @override
  Future<void> close() async {
    // bloc is destroyed, we don't need it any more
    _logger.simple('GameCubit is destroyed');
    await _gameSubscription?.cancel();
    _pingTimer?.cancel();
    _pingTimer = null;
    return super.close();
  }
}
