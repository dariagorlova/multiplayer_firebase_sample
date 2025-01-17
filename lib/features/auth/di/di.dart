import 'package:get_it/get_it.dart';

import '../index.dart';

class AuthFeatureDI {
  static Future<void> init() async {
    final sl = GetIt.instance;

    sl.registerFactory(() => AuthCubit(sl(), sl()));
    sl.registerFactory(() => AuthRepository(sl()));
    sl.registerFactory<AuthService>(() => FirebaseAuthService(sl()));
  }
}
