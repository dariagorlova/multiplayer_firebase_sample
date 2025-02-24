import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../index.dart';

class RtdbGameService with FirebaseExceptionHandlerMixin implements GameService {
  final LoggerService _logger;
  final FirebaseDatabase _db;
  final FirebaseAuth _auth;
  RtdbGameService(LoggerService logger, [FirebaseDatabase? db, FirebaseAuth? auth])
      : _logger = logger,
        _db = db ?? FirebaseDatabase.instance,
        _auth = auth ?? FirebaseAuth.instance;

  @override
  LoggerService get logService => _logger;

  @override
  String get currentUserId => _auth.currentUser?.uid ?? "";

  @override
  String get currentUserName => _auth.currentUser?.displayName ?? "";

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
      if (snapshot.exists) {
        final players = (snapshot.value as List<dynamic>?) ?? [];

        // Check if user already exists in the list
        bool userExists = players.any((player) => player[FirebaseConsts.idField] == user.id);

        if (!userExists) {
          // Add new user to the list
          await playersRef.update({
            '${players.length}': {
              FirebaseConsts.idField: user.id,
              FirebaseConsts.userNameField: user.name,
              FirebaseConsts.errorCount: user.errorCount,
            },
          });
        }
      } else {
        // If no players exist, create the list and add the first user
        await playersRef.set({
          '0': {
            FirebaseConsts.idField: user.id,
            FirebaseConsts.userNameField: user.name,
            FirebaseConsts.errorCount: user.errorCount,
          },
        });
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
      final snapshot = await gameRef.get();
      if (!snapshot.exists) return;

      List<dynamic> currentPlayers = (snapshot.value as Map<Object?, Object?>)[FirebaseConsts.playersField] as List<dynamic>;

      List<Map<String, dynamic>> updatedPlayers = currentPlayers
          .whereType<Map<dynamic, dynamic>>()
          .map((player) => Map<String, dynamic>.from(player))
          .where((player) => player[FirebaseConsts.idField] != userId)
          .toList();

      await playersRef.set(updatedPlayers); // update the players list
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
            words: (gameData[FirebaseConsts.words] as List<dynamic>?)
                    ?.map((word) => word is Map ? WordModel.fromJson(Map<String, dynamic>.from(word)) : const WordModel(word: '', userName: ''))
                    .toList() ??
                [],
            players: (gameData[FirebaseConsts.playersField] as List<dynamic>?)
                    ?.map((user) => user is Map ? UserModel.fromJson(Map<String, dynamic>.from(user)) : const UserModel(id: '', name: ''))
                    .toList() ??
                [],
          );
        } else {
          return GameModel.empty();
        }
      },
    );
  }

  @override
  Future<void> changePlayer(String gameId, int fromIndex, String toId) async {
    final ref = _db.ref('${FirebaseConsts.gamesCollection}/$gameId');

    await ref.update({
      FirebaseConsts.curPlayerId: toId,
      '${FirebaseConsts.playersField}/$fromIndex/${FirebaseConsts.errorCount}': ServerValue.increment(1),
    });
  }

  @override
  Future<String> findNearestOnlinePlayerFromList(List<String> playersIds, String startFromId) async {
    if (playersIds.isEmpty) return ''; // suddenly, list is empty.
    final startIndex = playersIds.indexOf(startFromId);
    if (startIndex == -1) return ''; // startFromId is not in the list, may be it was deleted, cuz of offline

    // lets reorder list, so startFromId will be first
    final orderedPlayers = playersIds.skip(startIndex).followedBy(playersIds.take(startIndex));
    for (final id in orderedPlayers) {
      if (await _isOnline(id)) return id;
    }

    return ''; // actualy we can't be here, cuz someone is launched this function, but...
  }

  Future<bool> _isOnline(String playerId) async {
    // just check if player is online in "status" node
    final snapshot = await _db.ref().child(FirebaseConsts.rtdbStatusNode).child(playerId).get();
    if (!snapshot.exists) return false;

    final data = Map<String, dynamic>.from(snapshot.value as Map);
    final isOnline = data[FirebaseConsts.online] as bool?;
    final lastActive = data[FirebaseConsts.lastActive] as int?;

    if (isOnline == null || lastActive == null) return false;
    if (!isOnline) return false;

    //! BTW, onDisconnect function (firebase_online_status_service) will automatically update connection status... but time is money)))
    //! it will update, but sometimes it takes up to a minute (yeap, expected behavior). For now, it's fine. For production, this is a way
    //! to be kicked out from the office if you leave it as is. So, just an advice. During the game (in bloc, not from UI))) ), you should update
    //! the field FirebaseConsts.lastActive by periodic timer for example every 2-5-7-10 seconds. And here you should analyze not only
    //! isOnline field value, but also lastActive field value difference with now(). If the difference is greater then 2-5-7-10 seconds,
    //! the user is already dead, but we did not realise it. and in this condition, we can just return false for such user.
    //
    //*** use something like this, for more strict conditions
    // final lastActiveTime = DateTime.fromMillisecondsSinceEpoch(lastActive).toLocal();
    // final difference = DateTime.now().difference(lastActiveTime).inSeconds.abs();
    // if (difference > ...){
    //   return false;
    // }

    return true;
  }

  Future<void> addWordAndChangeUser(String gameId, WordModel word, int wordIndex, String toId) async {
    final ref = _db.ref('${FirebaseConsts.gamesCollection}/$gameId');

    await ref.update({
      FirebaseConsts.curPlayerId: toId,
      '${FirebaseConsts.words}/$wordIndex': word.toJson(),
    });
  }
}
