import '../../../core/index.dart';

abstract class WaitingGameRepository {
  String get myUid;
  Future<void> addMeToGame(String id);
  Future<void> quitGame(String id, bool isLastOne);
  Future<void> forceDeleteGameFromFirestore(String id);
  Stream<GameModel> listenToChanges(String id);
}
