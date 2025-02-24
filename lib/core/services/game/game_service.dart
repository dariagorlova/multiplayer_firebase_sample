import '../../index.dart';

abstract class GameService {
  Future<void> createGame(GameModel game);
  Future<void> addMeToGame(String gameId, UserModel user);
  Stream<GameModel> gameListener(String gameId);
  Future<void> quitGame(String gameId, String userId, bool isLastOne);
  String get currentUserId;
  String get currentUserName;
  Future<void> changePlayer(String gameId, int fromIndex, String toId);
  Future<String> findNearestOnlinePlayerFromList(List<String> playersIds, String startFromId);
  Future<void> addWordAndChangeUser(String gameId, WordModel word, int wordIndex, String toId);
}
