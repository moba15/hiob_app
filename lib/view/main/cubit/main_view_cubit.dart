import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_home/manager/manager.dart';

import '../../../manager/connection/connection_manager.dart';
import '../../../screen/screen.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(const MainViewStateInitial()) {
    _fetchList();
  }

  void _fetchList() async {
    List<Screen> screens = await Manager().screenManager.loadScreens();
    emit(MainViewStateLoaded(screens: screens));
    _listenToConnectionChanges();
  }

  void _listenToConnectionChanges() {
    Manager().connectionManager.connectionStatusStreamController.stream.listen((event) {
      emit(MainViewStateLoaded(screens: state.screens, connectionStatus: event));
    });
  }
}
