import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../manager.dart';

part 'manager_state.dart';

class ManagerCubit extends Cubit<ManagerState> {
  Manager manager;
  StreamSubscription? streamSubscription;

  ManagerCubit({required this.manager})
    : super(ManagerState(status: manager.status)) {
    streamSubscription = manager.managerStatusStreamController.stream.listen(
      onStatusChange,
      onDone: () => {},
    );
  }

  void onStatusChange(ManagerStatus status) {
    emit(ManagerState(status: status));
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
