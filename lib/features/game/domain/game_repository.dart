import '../../../core/index.dart';

abstract class GameRepository {
  String get myUid;
  String get myName;
  Stream<GameModel> listenToChanges(String id);
  Future<void> quitGame(String id, bool isLastOne);
  Future<void> changePlayer(String gameId, int fromIndex, String toId);
  Future<String> findNearestOnlinePlayerFromList(List<String> playersIds, String startFromId);
  Future<void> addWordAndChangeUser(String gameId, WordModel word, int wordIndex, String nextPlayerId);
  Future<String?> checkWordWithAI(String word);
  Future<void> ping();
}
