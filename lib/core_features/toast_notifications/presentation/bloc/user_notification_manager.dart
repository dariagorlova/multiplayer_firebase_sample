import 'package:flutter/material.dart';

import '../../../../core/index.dart';
import '../../index.dart';

class UserNotificationManager {
  UserNotificationManager(this.scaffoldMessengerKey);
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  void showAppNotification(AppNotification notification) {
    final context = scaffoldMessengerKey.currentContext;
    if (context != null) {
      showToastMessage(notification.getMessage(context), notification.color);
    }
  }

  void showToastMessage(String message, Color color) {
    final context = scaffoldMessengerKey.currentContext;
    if (context == null) return;

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        duration: AppConst.notificationDuration,
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8.0,
      ),
    );
  }
}
