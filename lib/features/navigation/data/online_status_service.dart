abstract class OnlineStatusService {
  bool get connected;
  Stream<bool> connectionStatus(String? userId);
}
