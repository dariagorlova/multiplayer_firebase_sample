import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import '../../core_features/toast_notifications/index.dart';
import '../../features/auth/index.dart';
import '../../features/navigation/index.dart';
import '../../firebase_options.dart';
import '../services/index.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ServicesDI.init();
  await NotificationFeatureDI.init();
  await NavigationDI.init();
  await AuthFeatureDI.init();
}
