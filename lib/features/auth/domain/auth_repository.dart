import '../index.dart';

class AuthRepository {
  final AuthService _auth;

  AuthRepository(AuthService auth) : _auth = auth;

  Future<void> signIn() => _auth.signIn();
  Future<void> setName(String name) => _auth.createUserRecord(name);
  Future<void> signOut() => _auth.signOut();
}
