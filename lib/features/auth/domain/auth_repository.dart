import '../index.dart';

class AuthRepository {
  final AuthService _auth;

  AuthRepository(AuthService auth) : _auth = auth;

  Future<void> signIn(String name) => _auth.signIn(name);
  Future<void> signOut() => _auth.signOut();
}
