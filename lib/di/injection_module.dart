import 'package:injectable/injectable.dart';
import 'package:smart_home/services/logging/app_logger.dart';
import 'package:smart_home/services/logging/logging_service.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  LoggingService get loggingService => LoggingService.instance;

  @lazySingleton
  AppLogger get appLogger => loggingService;
}
