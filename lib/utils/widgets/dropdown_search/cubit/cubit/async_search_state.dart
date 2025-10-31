part of 'async_search_cubit.dart';

@freezed
class AsyncSearchState<T> with _$AsyncSearchState {
  const factory AsyncSearchState.initial() = InitalAsyncSearchState;
  const factory AsyncSearchState.loading() = LoadingAsyncSearchState;
  const factory AsyncSearchState.error({required String errorMsg}) =
      ErrorAsyncSearchState;

  const factory AsyncSearchState.loaded({required List<T> objects}) =
      LoadedAsyncSearchState;
}
