part of 'waiting_game_cubit.dart';

enum WaitingStatus { initial, waiting, timer, ready, quit }

@freezed
class WaitingGameState with _$WaitingGameState {
  const factory WaitingGameState({
    required WaitingStatus status,
    required String id,
    required int count,
    required int playersIn,
    required String host,
    required int duration,
  }) = _WaitingGameState;

  factory WaitingGameState.initial() => const WaitingGameState(status: WaitingStatus.initial, id: '', count: 0, playersIn: 0, host: '', duration: 0);
}
