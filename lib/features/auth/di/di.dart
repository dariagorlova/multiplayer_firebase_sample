import 'package:get_it/get_it.dart';

import '../index.dart';

class AuthFeatureDI {
  static Future<void> init() async {
    final sl = GetIt.instance;

    sl.registerLazySingleton(() => AuthCubit(sl(), sl(), sl()));
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
    sl.registerLazySingleton<AuthService>(() => FirebaseAuthService(sl()));
  }
}
