abstract class WaitingGameService {
  Future<void> addMeToGame(String id);
  Future<void> quit(String id, bool deleteAll);
  String get currentUserId;
  String get currentUserName;
}
