import 'package:injectable/injectable.dart';
import 'package:smart_home/services/logging/app_logger.dart';
import 'package:smart_home/utils/widgets/dropdown_search/cubit/cubit/async_search_cubit.dart';

@lazySingleton
class AsyncSearchCubitFactory {
  final AppLogger logger;

  AsyncSearchCubitFactory({required this.logger});

  AsyncSearchCubit<T> create<T>({
    required Future<List<T>> Function() getInitalValues,
  }) {
    return AsyncSearchCubit<T>(
      getInitalValues: getInitalValues,
      logger: logger,
    );
  }
}
