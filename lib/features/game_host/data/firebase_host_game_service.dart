import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/index.dart';
import '../index.dart';

class FirebaseHostGameService with FirebaseExceptionHandlerMixin implements HostGameService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final LoggerService _loggerService;

  FirebaseHostGameService(LoggerService loggerService, [FirebaseAuth? firebaseAuth, FirebaseFirestore? firestore])
      : _auth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _loggerService = loggerService;

  @override
  LoggerService get logService => _loggerService;

  DocumentReference<Map<String, dynamic>> get _getActiveGamesDocRef =>
      _firestore.collection(FirebaseConsts.gamesCollection).doc(FirebaseConsts.activeGamesDoc);

  String get generateNewId => _firestore.collection(FirebaseConsts.gamesCollection).doc().id;

  @override
  String? get currentUserId => _auth.currentUser?.uid;

  @override
  Future<String?> createGame({required String gameName, required int playersCount, required int gameDuration}) async {
    try {
      //let's generate game id for future usage
      final gameId = generateNewId;

      Map<String, dynamic> newGameData = {
        FirebaseConsts.gameNameField: gameName,
        FirebaseConsts.playersField: playersCount,
        FirebaseConsts.playersInField: <String>[],
        FirebaseConsts.ownerIdField: _auth.currentUser?.uid,
        FirebaseConsts.ownerNameField: _auth.currentUser?.displayName,
        FirebaseConsts.durationField: gameDuration,
      };

      await _getActiveGamesDocRef.set(
        // put mapped data
        {gameId: newGameData},
        // this option will create doc if it doesn't exist or add "{gameId: newGameData}" to existing one
        SetOptions(merge: true),
      );

      return gameId;
    } on FirebaseException catch (e, stack) {
      handleFirebaseException(e, stack);
      return null;
    }
  }
}
