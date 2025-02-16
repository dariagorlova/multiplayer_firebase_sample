import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/index.dart';
import '../index.dart';

class FirebaseWaitingGameService with FirebaseExceptionHandlerMixin implements WaitingGameService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final LoggerService _loggerService;

  FirebaseWaitingGameService(LoggerService loggerService, [FirebaseAuth? auth, FirebaseFirestore? firestore])
      : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _loggerService = loggerService;

  @override
  LoggerService get logService => _loggerService;

  @override
  String get currentUserId => _auth.currentUser?.uid ?? "";

  @override
  String get currentUserName => _auth.currentUser?.displayName ?? "";

  DocumentReference<Map<String, dynamic>> get _getActiveGamesDocRef =>
      _firestore.collection(FirebaseConsts.gamesCollection).doc(FirebaseConsts.activeGamesDoc);

  @override
  Future<void> addMeToGame(String id) async {
    try {
      // update common doc, that users can listen from "join" screen
      await _getActiveGamesDocRef.update(
        {
          '$id.${FirebaseConsts.playersInField}': FieldValue.arrayUnion([_auth.currentUser?.uid]),
        },
      );
    } on FirebaseException catch (e, stack) {
      handleFirebaseException(e, stack);
    }
  }

  @override
  Future<void> quit(String id, bool deleteAll) async {
    try {
      if (deleteAll) {
        // from active_games
        await _getActiveGamesDocRef.update({id: FieldValue.delete()});
      } else {
        // from active_games. just remove id from list
        await _getActiveGamesDocRef.update(
          {
            '$id.${FirebaseConsts.playersInField}': FieldValue.arrayRemove([_auth.currentUser?.uid]),
          },
        );
      }
    } on FirebaseException catch (e, stack) {
      handleFirebaseException(e, stack);
    }
  }
}
