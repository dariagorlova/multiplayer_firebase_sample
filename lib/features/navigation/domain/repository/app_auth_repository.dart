import '../../index.dart';

abstract class AppAuthRepository {
  Stream<UserStatus> get authorizationStatus;
  Stream<bool> get connectionStream;
}
