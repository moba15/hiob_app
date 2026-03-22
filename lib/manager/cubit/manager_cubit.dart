import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manager_state.dart';

class ManagerCubit extends Cubit<ManagerState> {
  ManagerCubit({required ManagerStatus status})
    : super(ManagerState(status: status));

  void onStatusChange(ManagerStatus status) {
    emit(ManagerState(status: status));
  }
}
