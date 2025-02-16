import '../../index.dart';

abstract class GameService {
  Future<void> createGame(GameModel game);
  Future<void> addMeToGame(String gameId, UserModel user);
  Stream<GameModel> gameListener(String gameId);
  Future<void> quitGame(String gameId, String userId, bool isLastOne);
}
