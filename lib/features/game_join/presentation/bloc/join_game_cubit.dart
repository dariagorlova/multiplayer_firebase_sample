import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/index.dart';
import '../../../../core_features/toast_notifications/index.dart';
import '../../index.dart';

part 'join_game_state.dart';
part 'join_game_cubit.freezed.dart';

class JoinGameCubit extends Cubit<JoinGameState> {
  final JoinGameRepository _repository;
  final NotificationMediator _notificationMediator;
  final LoggerService _logger;

  StreamSubscription<Map<String, dynamic>>? _gamesSubscription;

  JoinGameCubit(JoinGameRepository repository, NotificationMediator notificationMediator, LoggerService logger)
      : _repository = repository,
        _notificationMediator = notificationMediator,
        _logger = logger,
        super(const JoinGameState(activeGames: [], status: JoinGameStatus.initial)) {
    _listenToActiveGames();
  }

  void _listenToActiveGames() {
    _gamesSubscription = _repository.listenToActiveGames().listen(
      (gamesData) {
        final res = gamesData.entries.map((entry) => ActiveGameModel.fromJson(entry.value as Map<String, dynamic>).copyWith(id: entry.key)).toList();
        emit(state.copyWith(activeGames: res));
      },
    );
  }

  void selectGame(ActiveGameModel game) => emit(state.copyWith(selectedGame: game));

  Future<void> joinGame() async {
    // don't forget about nervous users firewall
    if (state.status == JoinGameStatus.loading) return;

    if (state.selectedGame == null) {
      _notificationMediator.notify(const AppErrorNotification(GameExceptions(GameExceptionKeys.selectGameToJoin)));
      return;
    }
    emit(state.copyWith(status: JoinGameStatus.loading));
    // just for spinner animation
    await Future.delayed(const Duration(milliseconds: 750), () {});
    emit(state.copyWith(status: JoinGameStatus.success));
  }

  @override
  Future<void> close() {
    // bloc is destroyed, we don't need it any more
    _logger.simple('JoinGameCubit is destroyed');
    _gamesSubscription?.cancel();
    return super.close();
  }
}
