import 'dart:async';

import '../../index.dart';

class NotificationMediator {
  final _notificationController = StreamController<AppNotification>.broadcast();

  Stream<AppNotification> get notifications => _notificationController.stream;

  void notify(AppNotification notification) => _notificationController.sink.add(notification);
}
