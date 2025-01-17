import 'package:firebase_database/firebase_database.dart';

import '../index.dart';

class FirebaseOnlineStatusService implements OnlineStatusService {
  final FirebaseDatabase _rtdb;
  FirebaseOnlineStatusService({
    FirebaseDatabase? database,
  }) : _rtdb = database ?? FirebaseDatabase.instance;

  bool? _isConnected;

  @override
  bool get connected => _isConnected ?? false;

  @override
  Stream<bool> connectionStatus(String? userId) {
    try {
      // here we fill "status" node for current user.
      // onDisconnect or listener on some node helps to keep connection active
      // if none of these is used, cottection status will live just for 60 seconds
      // and to restore it we should rerun the app. rediculous, but that's how it works
      if (userId == null || userId.isEmpty) {
        return Stream.value(false);
      }
      final connectedRef = _rtdb.ref('.info/connected');
      final onlineStatusRef = _rtdb.ref('status/${userId}');
      return connectedRef.onValue.map((event) {
        _isConnected = event.snapshot.value as bool? ?? false;
        onlineStatusRef.set({
          'online': connected,
          'lastActive': ServerValue.timestamp,
        });

        if (connected) {
          onlineStatusRef.onDisconnect().set({
            'online': false,
            'lastActive': ServerValue.timestamp,
          });
        }

        return event.snapshot.value as bool? ?? false;
      });
    } catch (e) {
      return Stream.value(false);
    }
  }
}
