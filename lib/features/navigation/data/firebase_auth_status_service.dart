import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/index.dart';
import '../index.dart';

class FirebaseAuthStatusService implements AuthStatusService {
  final FirebaseAuth _auth;
  FirebaseAuthStatusService({
    FirebaseAuth? firebaseAuth,
  }) : _auth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<Map<String, String?>> get authStatus {
    return _auth.userChanges().map((user) {
      // this "user" is a auth user. So, just id is ok. Everything else can be null.
      // also, we can check "user?.emailVerified" here, if we need it
      // for now, we use uid and displayName.
      // uid - we get from auth, displayName - we fill in createUserRecord method of the FirebaseAuthService class
      // and if displayName != null we can say, that user is logged in. otherwise - not
      return {
        FirebaseConsts.uidField: user?.uid,
        FirebaseConsts.userNameField: user?.displayName,
      };
    });
  }

  @override
  String? get userId => _auth.currentUser?.uid;
}
