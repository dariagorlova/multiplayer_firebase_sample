import 'package:firebase_auth/firebase_auth.dart';

import '../index.dart';

class FirebaseAuthStatusService implements AuthStatusService {
  final FirebaseAuth _auth;
  FirebaseAuthStatusService({
    FirebaseAuth? firebaseAuth,
  }) : _auth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<UserStatus> get authStatus {
    return _auth.userChanges().map((user) {
      // this "user" is a auth user. So, just id is ok. Everything else can be null.
      // also, we can check "user?.emailVerified" here, if we need it
      return UserStatus(
        userId: user?.uid,
      );
    });
  }

  @override
  String? get userId => _auth.currentUser?.uid;
}
