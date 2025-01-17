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
  Future<bool> signIn(String name) async {
    // here we want unic name. so, firstly we have to check users collection
    // but... we are not logged in yet. so, normal rules must cancel out request
    // we have two ways to do it:
    // 1. just ignore rules and let anyone to access to user's collection
    // 2. add credit card to firebase console project))) and use cloud function
    // hm... interesting idea, but for sample project we'll ignore normal rules
    try {
      if (name.isEmpty) {
        throw const FirebaseServicesException(FirebaseExceptionKeys.nameCantBeEmpty);
      }
      final snapshot = await _getUsersCollectionRef.where(FirebaseConsts.userNameField, isEqualTo: name).get();
      if (snapshot.docs.isNotEmpty) {
        // this name is already taken
        throw const FirebaseServicesException(FirebaseExceptionKeys.nameIsAlreadyInUse);
      } else {
        final response = await _auth.signInAnonymously();
        final uid = response.user?.uid;
        if (uid != null) {
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
