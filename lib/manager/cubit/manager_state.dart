part of 'manager_cubit.dart';

enum ManagerStatus { finished, loading, connecting, error }

class ManagerState extends Equatable {
  ManagerStatus status;

  ManagerState({required this.status});

  // TODO: implement props
  @override
  List<Object?> get props {
    return [status];
  }
}
