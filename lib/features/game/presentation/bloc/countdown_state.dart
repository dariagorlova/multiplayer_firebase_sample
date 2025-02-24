part of 'countdown_cubit.dart';

enum CountdownStatus { initial, pause, counting, stop, done }

@freezed
class CountdownState with _$CountdownState {
  const factory CountdownState({
    required int secondsPerPlayerMove,
    required Duration time,
    required CountdownStatus status,
  }) = _CountdownState;

  factory CountdownState.initial() => const CountdownState(secondsPerPlayerMove: 2, time: Duration.zero, status: CountdownStatus.initial);
}
