import '../../../core/index.dart';

abstract class WaitingGameRepository {
  Future<void> addMeToGame(String id);
  Future<void> quitGame(String id, bool isLastOne);
  Stream<GameModel> listenToChanges(String id);
}
