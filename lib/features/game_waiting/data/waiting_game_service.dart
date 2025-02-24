abstract class WaitingGameService {
  Future<void> addMeToGame(String id);
  Future<void> quit(String id, bool deleteAll);
}
