part of 'game_cubit.dart';

enum GameStatus { initial, myTurn, notMyTurn, lose, win }

@freezed
class GameState with _$GameState {
  const factory GameState({
    required GameStatus status,
    required GameModel board,
    required String myName,
  }) = _GameState;

  factory GameState.initial() => GameState(status: GameStatus.initial, board: GameModel.empty(), myName: '');
}
