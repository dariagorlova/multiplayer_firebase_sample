import '../index.dart';

class JoinGameRepositoryImpl implements JoinGameRepository {
  final JoinGameService _joinGameService;
  const JoinGameRepositoryImpl(JoinGameService joinGameService) : _joinGameService = joinGameService;

  @override
  Stream<Map<String, dynamic>> listenToActiveGames() => _joinGameService.listenToActiveGames();
}
