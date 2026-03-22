import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/services/logging/app_logger.dart';

part 'async_search_state.dart';
part 'async_search_cubit.freezed.dart';

class AsyncSearchCubit<T> extends Cubit<AsyncSearchState<T>> {
  Future<List<T>> Function() getInitalValues;
  final AppLogger logger;
  AsyncSearchCubit({required this.getInitalValues, required this.logger})
    : super(AsyncSearchState.initial());

  loadInitialValues() async {
    try {
      emit(AsyncSearchState.loading());
      final items = await getInitalValues();
      emit(AsyncSearchState.loaded(objects: items));
    } catch (e) {
      emit(AsyncSearchState.error(errorMsg: e.toString()));
      logger.error(
        "AsyncSearchCubit | loadInitialValues | error loading values",
        e,
      );
    }
  }

  onSearched(List<T> data) async {
    emit(AsyncSearchState.loaded(objects: data));
  }
}
