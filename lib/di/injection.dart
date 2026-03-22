import 'package:get_it/get_it.dart';
import 'package:smart_home/services/logging/app_logger.dart';
import 'package:smart_home/services/logging/logging_service.dart';
import 'package:smart_home/utils/widgets/dropdown_search/cubit/cubit/async_search_cubit_factory.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  if (!getIt.isRegistered<LoggingService>()) {
    getIt.registerLazySingleton<LoggingService>(() => LoggingService.instance);
  }
  if (!getIt.isRegistered<AppLogger>()) {
    getIt.registerLazySingleton<AppLogger>(() => getIt<LoggingService>());
  }
  if (!getIt.isRegistered<AsyncSearchCubitFactory>()) {
    getIt.registerLazySingleton<AsyncSearchCubitFactory>(
      () => AsyncSearchCubitFactory(logger: getIt<AppLogger>()),
    );
  }
}
