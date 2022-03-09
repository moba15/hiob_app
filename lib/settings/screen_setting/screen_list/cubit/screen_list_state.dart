part of 'screen_list_cubit.dart';

enum ListStatus { loading, success, failure }

class ScreenListState  {
  final ListStatus status;
  final List<Screen> screens;
  const ScreenListState._({
    this.status = ListStatus.loading,
    this.screens = const []
  });

  const ScreenListState.loading() : this._();
  const ScreenListState.success(List<Screen> devices)
      : this._(status: ListStatus.success, screens: devices);
  const ScreenListState.added(List<Screen> devices)
      : this._(status: ListStatus.success, screens: devices);
  const ScreenListState.failure() : this._(status: ListStatus.failure);








}
