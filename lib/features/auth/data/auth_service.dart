abstract class AuthService {
  Future<void> signIn();
  Future<bool> createUserRecord(String name);
  Future<void> signOut();
}
