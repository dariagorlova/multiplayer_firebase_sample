abstract class AuthService {
  Future<bool> signIn(String name);
  Future<void> signOut();
}
