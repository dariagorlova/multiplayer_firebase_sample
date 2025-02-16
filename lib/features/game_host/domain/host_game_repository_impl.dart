import '../../../core/index.dart';
import '../index.dart';

class HostGameRepositoryImpl implements HostGameRepository {
  final HostGameService _hostGameService;
  final GameService _rtdbGameService;
  const HostGameRepositoryImpl(HostGameService hostGameService, GameService rtdbGameService)
      : _hostGameService = hostGameService,
        _rtdbGameService = rtdbGameService;

  Future<String?> createGame({
    required String gameName,
    required int playersCount,
    required int gameDuration,
  }) async {
    // put data to "active_games" doc
    final id = await _hostGameService.createGame(
      gameName: gameName,
      playersCount: playersCount,
      gameDuration: gameDuration,
    );
    final userId = _hostGameService.currentUserId;
    if (userId != null && id != null) {
      // create game model in rtdb
      await _rtdbGameService.createGame(
        GameModel(
          id: id,
          name: gameName,
          playersCount: playersCount,
          duration: gameDuration,
          curPlayerId: userId,
        ),
      );

      return id;
    }
    return null;
  }
}
