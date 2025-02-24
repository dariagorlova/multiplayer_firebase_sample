import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/index.dart';
import '../../../../core_features/toast_notifications/index.dart';
import '../../index.dart';

part 'host_game_state.dart';
part 'host_game_cubit.freezed.dart';

class HostGameCubit extends Cubit<HostGameState> {
  final HostGameRepository _repository;
  final NotificationMediator _notificationMediator;
  final LoggerService _logger;

  HostGameCubit(HostGameRepository repository, NotificationMediator notificationMediator, LoggerService logger)
      : _repository = repository,
        _notificationMediator = notificationMediator,
        _logger = logger,
        super(const HostGameState.initial()) {
    _logger.simple('HostGameCubit is created');
  }

  Future<void> createGame({required String gameName, required int playersCount, required int gameDuration}) async {
    // first of all, nervous users firewall
    if (state is _Loading) return;
    // and a simple validation
    if (!_validation(gameName, playersCount, gameDuration)) return;

    // if we are here, we can put game data to firebase
    emit(const HostGameState.loading());
    try {
      // let's try to create game in firebase
      final gameId = await _repository.createGame(gameName: gameName, playersCount: playersCount, gameDuration: gameDuration);
      // we will never get null, but that's how it works
      // if we got null we will move to "catch" bloc
      if (gameId != null) {
        emit(HostGameState.success(gameId));
      }
    } on LocalizedException catch (e) {
      _notificationMediator.notify(AppErrorNotification(e));
      emit(const HostGameState.initial());
    }
  }

  bool _validation(String gameName, int playersCount, int gameDuration) {
    // game name can't be empty
    if (gameName.isEmpty) {
      _notificationMediator.notify(const AppErrorNotification(GameExceptions(GameExceptionKeys.emptyGameName)));
      return false;
    }

    // game name can't be too long
    if (gameName.length > 15) {
      _notificationMediator.notify(const AppErrorNotification(GameExceptions(GameExceptionKeys.tooLongGameName)));
      return false;
    }

    // players count must be between 2 and 5
    if (playersCount < 2 || playersCount > 5) {
      _notificationMediator.notify(const AppErrorNotification(GameExceptions(GameExceptionKeys.playerCountError)));
      return false;
    }

    // game duration must be between 15 and 60 seconds
    if (gameDuration < 15 || gameDuration > 60) {
      _notificationMediator.notify(const AppErrorNotification(GameExceptions(GameExceptionKeys.gameDurationError)));
      return false;
    }

    // all is fine, we can proceed
    return true;
  }

  @override
  Future<void> close() {
    // bloc is destroyed, we don't need it any more
    _logger.simple('HostGameCubit is destroyed');
    return super.close();
  }
}
