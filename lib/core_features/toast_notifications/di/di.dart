import 'package:get_it/get_it.dart';

import '../../../core/index.dart';
import '../index.dart';
import '../presentation/bloc/user_notification_manager.dart';

class NotificationFeatureDI {
  static Future<void> init() async {
    final sl = GetIt.instance;

    sl.registerLazySingleton<NotificationMediator>(() => NotificationMediator());
    sl.registerLazySingleton(() => UserNotificationCubit(sl(), sl()));
    sl.registerFactory<UserNotificationManager>(() => UserNotificationManager(scaffoldMessengerKey));
  }
}
