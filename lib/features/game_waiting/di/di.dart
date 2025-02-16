import 'package:get_it/get_it.dart';

import '../index.dart';

class WaitingGameFeatureDI {
  static Future<void> init() async {
    final sl = GetIt.instance;

    sl.registerFactory(() => WaitingGameCubit(sl(), sl(), sl()));
    sl.registerFactory<WaitingGameRepository>(() => WaitingGameRepositoryImpl(sl(), sl()));
    sl.registerFactory<WaitingGameService>(() => FirebaseWaitingGameService(sl()));
  }
}
