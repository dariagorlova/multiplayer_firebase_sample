import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/index.dart';
import '../../index.dart';
import 'user_notification_manager.dart';

class UserNotificationCubit extends Cubit<AppNotification?> {
  UserNotificationCubit(
    this._notificationManager,
    this._notificationMediator,
  ) : super(null) {
    _notificationSubscription = _notificationMediator.notifications.listen(_onNotify);
  }

  final UserNotificationManager _notificationManager;
  final NotificationMediator _notificationMediator;
  late final StreamSubscription<AppNotification> _notificationSubscription;
  Timer? _debounceTimer;
  DateTime? _lastNotificationTime;
  bool _isNotificationVisible = false;
  static const _debounceDuration = Duration(milliseconds: 500);
  static const _cooldownPeriod = Duration(milliseconds: 800);

  void _onNotify(AppNotification notification) {
    final now = DateTime.now();
    final timeSinceLastNotification = _lastNotificationTime != null ? now.difference(_lastNotificationTime!) : Duration.zero;

    if (state != notification) {
      _showNotificationImmediately(notification);
    } else if (!_isNotificationVisible && timeSinceLastNotification >= _cooldownPeriod) {
      _debounceNotification(notification);
    }
  }

  void _showNotificationBasedOnType(AppNotification notification) {
    emit(notification);
    _notificationManager.showAppNotification(notification);
  }

  void _showNotificationImmediately(AppNotification notification) {
    _cancelDebounceTimer();
    _lastNotificationTime = DateTime.now();
    _isNotificationVisible = true;
    _showNotificationBasedOnType(notification);
    _scheduleNotificationHide();
  }

  void _debounceNotification(AppNotification notification) {
    _cancelDebounceTimer();
    _debounceTimer = Timer(_debounceDuration, () {
      _showNotificationImmediately(notification);
    });
  }

  void _scheduleNotificationHide() {
    Timer(AppConst.notificationDuration, () {
      _isNotificationVisible = false;
    });
  }

  void _cancelDebounceTimer() {
    _debounceTimer?.cancel();
    _debounceTimer = null;
  }

  @override
  Future<void> close() async {
    _cancelDebounceTimer();
    await _notificationSubscription.cancel();
    await super.close();
  }
}
