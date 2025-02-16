import 'package:get_it/get_it.dart';

import '../index.dart';

class JoinGameFeatureDI {
  static Future<void> init() async {
    final sl = GetIt.instance;

    sl.registerFactory(() => JoinGameCubit(sl(), sl(), sl()));
    sl.registerFactory<JoinGameRepository>(() => JoinGameRepositoryImpl(sl()));
    sl.registerFactory<JoinGameService>(() => FirebaseJoinGameService(sl()));
  }
}
