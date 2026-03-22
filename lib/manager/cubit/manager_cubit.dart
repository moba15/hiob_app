import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manager_state.dart';

class ManagerCubit extends Cubit<ManagerState> {
  ManagerCubit({
    required ManagerStatus status,
    List<ServiceLoadEntry> services = const [],
  }) : super(ManagerState(status: status, services: services));

  void onStatusChange(ManagerStatus status) {
    emit(state.copyWith(status: status));
  }

  void updateServiceStatus({
    required String key,
    required String label,
    required ServiceLoadStatus status,
    String? error,
  }) {
    final List<ServiceLoadEntry> updated = List.of(state.services);
    final int index = updated.indexWhere((entry) => entry.key == key);
    final nextEntry = ServiceLoadEntry(
      key: key,
      label: label,
      status: status,
      error: error,
    );
    if (index == -1) {
      updated.add(nextEntry);
    } else {
      updated[index] = nextEntry;
    }
    emit(state.copyWith(services: updated));
  }

  void setStartupError(String message) {
    emit(state.copyWith(startupError: message));
  }
}
