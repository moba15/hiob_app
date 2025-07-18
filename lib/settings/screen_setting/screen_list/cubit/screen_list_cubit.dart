import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/screen/screen.dart';

import '../../../../utils/list_status.dart';

part 'screen_list_state.dart';

class ScreenListCubit extends Cubit<ScreenListState> {
  StreamSubscription? screenListSubscription;
  ScreenManager screenManager;

  ScreenListCubit({required this.screenManager})
    : super(const ScreenListState.loading()) {
    screenListSubscription = screenManager.screenStreamController.stream.listen(
      (event) {
        update(event);
      },
    );
  }

  @override
  Future<void> close() async {
    screenListSubscription?.cancel();
    super.close();
  }

  void update(List<Screen> screens) {
    emit(ScreenListState.added(screens));
  }

  void fetchList() async {
    screenManager.loadScreens();
  }
}
