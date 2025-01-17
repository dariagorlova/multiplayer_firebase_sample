import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../index.dart';

class ServicesDI {
  static Future<void> init() async {
    final sl = GetIt.instance;

    final logger = await LoggerServiceImpl.create(
      logger: Logger(
          printer: PrettyPrinter(methodCount: 2, lineLength: 80),
          output: MultiOutput([
            Platform.isIOS ? IosConsoleOutput() : ConsoleOutput(),
          ])),
    );
    sl.registerLazySingleton<LoggerService>(() => logger);
  }
}
