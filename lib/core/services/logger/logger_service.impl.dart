import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../index.dart';

/// as far as logger has a bug with colors: https://github.com/flutter/flutter/issues/64491
/// here is a workaround... mb forever, cuz this bug is known from august 2020.
class IosConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    developer.log(event.lines.join('\n'));
  }
}

class LoggerServiceImpl implements LoggerService {
  final Logger _logger;

  LoggerServiceImpl({required Logger logger}) : _logger = logger {
    FlutterError.onError = (errorDetails) {
      this.error(errorDetails.exceptionAsString(), errorDetails.stack);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      this.error(error.toString(), stack);
      return true;
    };
  }

  static LoggerServiceImpl create({required Logger logger}) => LoggerServiceImpl(logger: logger);

  @override
  void simple(String message) => developer.log(message);

  @override
  void warning(String message, {String? title}) => _logger.w(message, error: title);

  @override
  void debug(String message, {String? title}) => _logger.d(message, error: title);

  @override
  void info(String message, {String? title}) => _logger.i(message, error: title);

  @override
  void error(String exception, [StackTrace? stack]) => _logger.e(exception.toString(), stackTrace: stack);
}
