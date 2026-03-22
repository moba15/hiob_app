import 'package:smart_home/services/logging/app_logger.dart';
import 'package:smart_home/utils/logger/logger_filter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class LoggingService implements AppLogger {
  static LoggingService instance = LoggingService();
  final Talker _talker = TalkerFlutter.init();

  @override
  void debug(String message) {
    _talker.debug(message);
  }

  @override
  void info(String message) {
    _talker.info(message);
  }

  @override
  void warning(String message) {
    _talker.warning(message);
  }

  @override
  void error(String message, dynamic error, [StackTrace? stackTrace]) {
    _talker.error(message, error, stackTrace);
  }

  @override
  void verbose(String message) {
    _talker.verbose(message);
  }

  void disable() {
    _talker.disable();
  }

  void enable() {
    _talker.enable();
  }

  void configure({required CustomLoggerFilter filter}) {
    _talker.configure(filter: filter);
  }
}
