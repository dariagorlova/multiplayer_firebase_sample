import '../../../core/index.dart';
import '../index.dart';

class GameRepositoryImpl implements GameRepository {
  final GameService _gameService;
  final AiService _aiService;

  GameRepositoryImpl(GameService gameService, AiService aiService)
      : _gameService = gameService,
        _aiService = aiService;

  @override
  Stream<GameModel> listenToChanges(String id) => _gameService.gameListener(id);

  @override
  String get myUid => _gameService.currentUserId;

  @override
  String get myName => _gameService.currentUserName;

  @override
  Future<void> quitGame(String id, bool isLastOne) => _gameService.quitGame(id, _gameService.currentUserId, isLastOne);

  @override
  Future<void> changePlayer(String gameId, int fromIndex, String toId) => _gameService.changePlayer(gameId, fromIndex, toId);

  @override
  Future<String> findNearestOnlinePlayerFromList(List<String> playersIds, String startFromId) =>
      _gameService.findNearestOnlinePlayerFromList(playersIds, startFromId);

  @override
  Future<void> addWordAndChangeUser(String gameId, WordModel word, int wordIndex, String nextPlayerId) =>
      _gameService.addWordAndChangeUser(gameId, word, wordIndex, nextPlayerId);

  @override
  Future<String?> checkWordWithAI(String word) => _aiService.getDataFromAI(word: word);
}
