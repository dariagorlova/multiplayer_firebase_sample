import 'package:get_it/get_it.dart';

import '../index.dart';

class HostGameFeatureDI {
  static Future<void> init() async {
    final sl = GetIt.instance;

    sl.registerFactory(() => HostGameCubit(sl(), sl(), sl()));
    sl.registerFactory<HostGameRepository>(() => HostGameRepositoryImpl(sl(), sl()));
    sl.registerFactory<HostGameService>(() => FirebaseHostGameService(sl()));
  }
}
