import '../index.dart';

abstract class AuthStatusService {
  Stream<UserStatus> get authStatus;
  String? get userId;
}
