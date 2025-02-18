abstract class AuthRepository {
  Future<void> signIn();
  Future<void> setName(String name);
  Future<void> signOut();
}
