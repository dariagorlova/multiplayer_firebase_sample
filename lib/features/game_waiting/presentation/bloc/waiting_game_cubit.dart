import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/index.dart';
import '../../../../core_features/toast_notifications/index.dart';
import '../../index.dart';

part 'waiting_game_state.dart';
part 'waiting_game_cubit.freezed.dart';

class WaitingGameCubit extends Cubit<WaitingGameState> {
  final WaitingGameRepository _repository;
  final NotificationMediator _notificationMediator;
  final LoggerService _logger;

  StreamSubscription<GameModel>? _gameSubscription;

  WaitingGameCubit(WaitingGameRepository repository, NotificationMediator notificationMediator, LoggerService logger)
      : _repository = repository,
        _notificationMediator = notificationMediator,
        _logger = logger,
        super(WaitingGameState.initial()) {
    _logger.simple('WaitingGameCubit is created');
  }

  Future<void> init(String id) async {
    emit(state.copyWith(status: WaitingStatus.waiting));
    try {
      // we have to tell server that we are in
      await _repository.addMeToGame(id);

      // start listen to changes in games.active_games.waiting_games.id
      _listenToChanges(id);
      emit(state.copyWith(id: id));
      // no emit here. all emits will be from listenToChanges
    } on LocalizedException catch (e) {
      _notificationMediator.notify(AppErrorNotification(e));
      emit(state.copyWith(status: WaitingStatus.quit));
    }
  }

  void _listenToChanges(String id) {
    _gameSubscription = _repository.listenToChanges(id).listen(
      (waitingRoomData) {
        if (waitingRoomData.id.isNotEmpty) {
          // just update playersIn and count fields of the state
          final count = waitingRoomData.playersCount;
          final playersIn = waitingRoomData.players.length;
          final host = waitingRoomData.players.first.id;
          emit(
            state.copyWith(
              status: playersIn == count ? WaitingStatus.timer : WaitingStatus.waiting,
              count: count,
              playersIn: playersIn,
              host: host,
            ),
          );
        }
      },
    );
  }

  Future<void> launchCountdownTimer() async {
    final conditions = {
      state.status != WaitingStatus.waiting: const AppInfoNotification(GameMessages(GameMessageKeys.weAreAlmostIn)),
      state.host != _repository.myUid: const AppErrorNotification(GameExceptions(GameExceptionKeys.youCantStartGame)),
      state.playersIn < 2: const AppInfoNotification(GameMessages(GameMessageKeys.needMorePlayers)),
    };

    final notification = conditions.entries.cast<MapEntry<bool, AppNotification>?>().firstWhere((entry) => entry!.key, orElse: () => null)?.value;
    if (notification != null) {
      _notificationMediator.notify(notification);
      return;
    }

    emit(state.copyWith(status: WaitingStatus.timer));
  }

  Future<void> startGame() async {
    // here we can simply delete data from firestore's "active_games", cuz room is full and we are going to start game
    // we don't need to wait for delete is done here.
    // and we want this function to be launched just once, not from all players
    if (state.host == _repository.myUid) {
      _logger.simple('erase ${state.id} from "active_games" document');
      _repository.forceDeleteGameFromFirestore(state.id);
    }
    // we dont need a subscription any more. so, we can cancel it here
    await _gameSubscription?.cancel();

    emit(state.copyWith(status: WaitingStatus.ready));
  }

  Future<void> quitGame() async {
    if (state.status != WaitingStatus.waiting) {
      _notificationMediator.notify(const AppInfoNotification(GameMessages(GameMessageKeys.cantQuitNow)));
      return;
    }

    // here we should delete current user id from active_games.id players_in field
    // and from subcollection waiting_games.id players_in field
    // if this user is the last user (players_in length before delete == 1),
    // we should totally delete all about this game from firestore
    try {
      _gameSubscription?.cancel();
      await _repository.quitGame(state.id, state.playersIn == 1);
      emit(state.copyWith(status: WaitingStatus.quit));
    } on LocalizedException catch (e) {
      _notificationMediator.notify(AppErrorNotification(e));
      emit(state.copyWith(status: WaitingStatus.quit));
    }
  }

  @override
  Future<void> close() async {
    // bloc is destroyed, we don't need it any more
    _logger.simple('WaitingGameCubit is destroyed');
    await _gameSubscription?.cancel();
    return super.close();
  }
}
