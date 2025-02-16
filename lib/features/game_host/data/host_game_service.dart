abstract class HostGameService {
  Future<String?> createGame({
    required String gameName,
    required int playersCount,
    required int gameDuration,
  });

  String? get currentUserId;
}
