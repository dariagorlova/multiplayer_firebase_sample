import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../../core_features/toast_notifications/di/di.dart';
import '../../features/auth/di/di.dart';
import '../../features/game/di/di.dart';
import '../../features/game_host/di/di.dart';
import '../../features/game_join/di/di.dart';
import '../../features/game_waiting/di/di.dart';
import '../../features/navigation/di/di.dart';
import '../../firebase_options.dart';
import '../services/di/di.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ServicesDI.init();
  await NotificationFeatureDI.init();
  await NavigationDI.init();
  await AuthFeatureDI.init();
  await HostGameFeatureDI.init();
  await JoinGameFeatureDI.init();
  await WaitingGameFeatureDI.init();
  await GameFeatureDI.init();
}
