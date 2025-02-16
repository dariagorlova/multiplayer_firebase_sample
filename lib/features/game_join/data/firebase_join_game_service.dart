import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/index.dart';
import '../index.dart';

class FirebaseJoinGameService with FirebaseExceptionHandlerMixin implements JoinGameService {
  final FirebaseFirestore _firestore;
  final LoggerService _loggerService;

  FirebaseJoinGameService(LoggerService loggerService, [FirebaseFirestore? firestore])
      : _firestore = firestore ?? FirebaseFirestore.instance,
        _loggerService = loggerService;

  @override
  LoggerService get logService => _loggerService;

  DocumentReference<Map<String, dynamic>> get _getActiveGamesDocRef =>
      _firestore.collection(FirebaseConsts.gamesCollection).doc(FirebaseConsts.activeGamesDoc);

  @override
  Stream<Map<String, dynamic>> listenToActiveGames() {
    return _getActiveGamesDocRef.snapshots().map((snapshot) {
      if (!snapshot.exists || snapshot.data() == null) return {};

      return snapshot.data() ?? {};
    });
  }
}
