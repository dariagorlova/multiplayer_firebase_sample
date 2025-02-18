part of 'join_game_cubit.dart';

enum JoinGameStatus { initial, loading, success }

@freezed
class JoinGameState with _$JoinGameState {
  const factory JoinGameState({
    required JoinGameStatus status,
    required List<ActiveGameModel> activeGames,
    ActiveGameModel? selectedGame,
  }) = _JoinGameState;
}
