part of 'host_game_cubit.dart';

@freezed
class HostGameState with _$HostGameState {
  const factory HostGameState.initial() = _Initial;
  const factory HostGameState.loading() = _Loading;
  const factory HostGameState.success(String id) = _Success;
}
