import 'package:get_it/get_it.dart';

import '../index.dart';

class GameFeatureDI {
  static Future<void> init() async {
    final sl = GetIt.instance;

    sl.registerFactory(() => GameCubit(sl(), sl(), sl()));
    sl.registerFactoryParam<CountdownCubit, int, void>((duration, _) => CountdownCubit(duration, sl()));
    sl.registerFactory<GameRepository>(() => GameRepositoryImpl(sl(), sl()));
    sl.registerLazySingleton<AiService>(() => GeminiAiService(sl()));
  }
}
