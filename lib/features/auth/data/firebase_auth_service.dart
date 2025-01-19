import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/index.dart';
import '../index.dart';

class FirebaseAuthService with FirebaseExceptionHandlerMixin implements AuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final LoggerService _loggerService;

  FirebaseAuthService(LoggerService loggerService, [FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore])
      : _auth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _loggerService = loggerService;

  @override
  LoggerService get logService => _loggerService;

  CollectionReference<Map<String, dynamic>> get _getUsersCollectionRef => _firestore.collection(FirebaseConsts.usersCollection);

  @override
  Future<void> signIn() async {
    try {
      // documentation says, that if there is already an anonymous user signed in, that user will be returned instead
      // so, we just can use it to get an access to firebase databases
      await _auth.signInAnonymously();
    } on FirebaseException catch (e, stack) {
      handleFirebaseException(e, stack);
    }
  }

  @override
  Future<bool> createUserRecord(String name) async {
    try {
      if (name.isEmpty) {
        throw const FirebaseServicesException(FirebaseExceptionKeys.nameCantBeEmpty);
      }
      final snapshot = await _getUsersCollectionRef.where(FirebaseConsts.userNameField, isEqualTo: name).get();
      if (snapshot.docs.isNotEmpty) {
        // this name is already taken
        throw const FirebaseServicesException(FirebaseExceptionKeys.nameIsAlreadyInUse);
      } else {
        final uid = _auth.currentUser?.uid;

        if (uid != null) {
          try {
            await _auth.currentUser?.updateDisplayName(name);
          } on FirebaseAuthException catch (e, stack) {
            handleFirebaseException(e, stack);
            return false;
          }
          await _getUsersCollectionRef.doc(uid).set(
            {FirebaseConsts.userNameField: name},
          );
          return true;
        }
      }
    } on FirebaseException catch (e, stack) {
      handleFirebaseException(e, stack);
    }
    return false;
  }

  @override
  Future<void> signOut() async {
    try {
      final user = _auth.currentUser;
      // delete record from users collection
      if (user != null) {
        await _getUsersCollectionRef.doc(user.uid).delete();
        // delete user from auth
        user.delete();
      }
    } on FirebaseException catch (e, stack) {
      handleFirebaseException(e, stack);
    }
  }
}
