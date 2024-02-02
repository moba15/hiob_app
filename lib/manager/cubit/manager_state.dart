part of 'manager_cubit.dart';

enum ManagerStatus { finished, loading, changeLog }

// ignore: must_be_immutable
class ManagerState extends Equatable {
  ManagerStatus status;

  ManagerState({required this.status});

  // TODO: implement props
  @override
  List<Object?> get props {
    return [status];
  }
}
