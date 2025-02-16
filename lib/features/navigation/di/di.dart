import 'package:get_it/get_it.dart';

import '../index.dart';

class NavigationDI {
  static Future<void> init() async {
    final sl = GetIt.instance;
    sl.registerLazySingleton(() => AuthStatusBloc(sl()));
    sl.registerFactory<AppAuthRepository>(() => AppNavigationRepositoryImpl(sl(), sl()));
    sl.registerFactory<AuthStatusService>(() => FirebaseAuthStatusService());
    sl.registerFactory<OnlineStatusService>(() => FirebaseOnlineStatusService());
  }
}
