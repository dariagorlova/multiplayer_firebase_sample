abstract class AuthStatusService {
  Stream<Map<String, String?>> get authStatus;
  String? get userId;
}
