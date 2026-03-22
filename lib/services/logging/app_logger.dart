abstract class AppLogger {
  void debug(String message);
  void info(String message);
  void warning(String message);
  void error(String message, dynamic error, [StackTrace? stackTrace]);
  void verbose(String message);
}
