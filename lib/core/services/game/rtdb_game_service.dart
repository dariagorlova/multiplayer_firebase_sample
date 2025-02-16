import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../index.dart';

class RtdbGameService with FirebaseExceptionHandlerMixin implements GameService {
  final LoggerService _logger;
  final FirebaseDatabase _db;
  RtdbGameService(LoggerService logger, [FirebaseDatabase? db])
      : _logger = logger,
        _db = db ?? FirebaseDatabase.instance;

  @override
  LoggerService get logService => _logger;

  @override
  Future<void> createGame(GameModel game) async {
    try {
      final gameRef = _db.ref().child(FirebaseConsts.gamesCollection).child(game.id);

      await gameRef.set({
        FirebaseConsts.uidField: game.id,
        FirebaseConsts.userNameField: game.name,
        FirebaseConsts.count: game.playersCount,
        FirebaseConsts.durationField: game.duration,
        FirebaseConsts.curPlayerId: game.curPlayerId,
        FirebaseConsts.words: game.words,
        FirebaseConsts.playersField: game.players.map((user) => user.toJson()).toList(),
      });
    } on FirebaseException catch (e, stack) {
      handleFirebaseException(e, stack);
    } catch (e, stack) {
      _logger.error(e.toString(), stack);
      throw const FirebaseServicesException(FirebaseExceptionKeys.rtdbCreateGameNode);
    }
  }

  @override
  Future<void> addMeToGame(String gameId, UserModel user) async {
    final playersRef = _db.ref().child(FirebaseConsts.gamesCollection).child(gameId).child(FirebaseConsts.playersField);

    try {
      // Get the current list of players
      final snapshot = await playersRef.get();

      List<dynamic> currentPlayers = snapshot.exists ? (snapshot.value as List<dynamic>) : [];

      // Convert to a List<Map<String, dynamic>> for Firebase
      List<Map<String, dynamic>> updatedPlayers = currentPlayers
          .whereType<Map<String, dynamic>>() // Ensure all elements are maps
          .map((player) => Map<String, dynamic>.from(player))
          .toList();

      // Add the new player if they are not already in the game
      if (!updatedPlayers.any((p) => p[FirebaseConsts.idField] == user.id)) {
        updatedPlayers.add(user.toJson());

        // Update the players list in Firebase
        await playersRef.set(updatedPlayers);
      }
    } on FirebaseException catch (e, stack) {
      handleFirebaseException(e, stack);
    } catch (e, stack) {
      _logger.error(e.toString(), stack);
      throw const FirebaseServicesException(FirebaseExceptionKeys.rtdbAddUser);
    }
  }

  @override
  Future<void> quitGame(String gameId, String userId, bool isLastOne) async {
    final gameRef = _db.ref().child(FirebaseConsts.gamesCollection).child(gameId);
    final playersRef = gameRef.child(FirebaseConsts.playersField);

    try {
      if (isLastOne) {
        await gameRef.remove();
        return;
      }

      // remove only the quitting player
      final snapshot = await playersRef.get();
      if (!snapshot.exists) return;

      List<dynamic> currentPlayers = snapshot.value as List<dynamic>;

      List<Map<String, dynamic>> updatedPlayers = currentPlayers
          .whereType<Map<String, dynamic>>()
          .map((player) => Map<String, dynamic>.from(player))
          .where((player) => player["id"] != userId)
          .toList();

      await playersRef.set(updatedPlayers);
    } on FirebaseException catch (e, stack) {
      handleFirebaseException(e, stack);
    } catch (e, stack) {
      _logger.error(e.toString(), stack);
      throw const FirebaseServicesException(FirebaseExceptionKeys.rtdbDelUser);
    }
  }

  @override
  Stream<GameModel> gameListener(String gameId) {
    return _db.ref().child(FirebaseConsts.gamesCollection).child(gameId).onValue.map(
      (event) {
        final data = event.snapshot.value;

        if (data != null && data is Map) {
          final gameData = Map<String, dynamic>.from(data);

          return GameModel(
            id: gameData[FirebaseConsts.uidField] as String? ?? "",
            name: gameData[FirebaseConsts.userNameField] as String? ?? "",
            playersCount: (gameData[FirebaseConsts.count] as int?) ?? 0,
            duration: (gameData[FirebaseConsts.durationField] as int?) ?? 0,
            curPlayerId: gameData[FirebaseConsts.curPlayerId] as String? ?? "",
            words: (gameData[FirebaseConsts.words] as List<dynamic>?)?.whereType<String>().toList() ?? [],
            players: (gameData[FirebaseConsts.playersField] as List<dynamic>?)
                    ?.map(
                      (user) => user is Map ? UserModel.fromJson(Map<String, dynamic>.from(user)) : const UserModel(id: "", name: ""),
                    )
                    .toList() ??
                [],
          );
        } else {
          return GameModel.empty();
        }
      },
    );
  }
}
