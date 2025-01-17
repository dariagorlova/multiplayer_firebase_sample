abstract class LoggerService {
  void warning(String message, {String? title});
  void debug(String message, {String? title});
  void info(String message, {String? title});
  void error(String exception, [StackTrace? stack]);
}
