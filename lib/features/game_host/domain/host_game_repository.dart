abstract class HostGameRepository {
  Future<String?> createGame({required String gameName, required int playersCount, required int gameDuration});
}
