import '../../../core/index.dart';
import '../index.dart';

class WaitingGameRepositoryImpl implements WaitingGameRepository {
  final WaitingGameService _service;
  final GameService _gameService;
  const WaitingGameRepositoryImpl(WaitingGameService service, GameService gameService)
      : _service = service,
        _gameService = gameService;

  @override
  Future<void> addMeToGame(String id) async {
    await _service.addMeToGame(id);
    // and now the same for rtdb
    await _gameService.addMeToGame(id, makeModelForMe());
  }

  @override
  Future<void> quitGame(String id, bool isLastOne) async {
    await _service.quit(id, isLastOne);
    // and now the same for rtdb
    await _gameService.quitGame(id, _gameService.currentUserId, isLastOne);
  }

  @override
  Future<void> forceDeleteGameFromFirestore(String id) async {
    await _service.quit(id, true);
  }

  @override
  Stream<GameModel> listenToChanges(String id) => _gameService.gameListener(id);

  @override
  String get myUid => _gameService.currentUserId;

  UserModel makeModelForMe() => UserModel(id: _gameService.currentUserId, name: _gameService.currentUserName);
}
