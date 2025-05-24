part of 'device_bloc.dart';

enum DeviceStatus { unavailable, ready, error }

class DeviceState extends Equatable {
  final DateTime lastUpdated;
  final dynamic value;
  final DeviceStatus status;

  const DeviceState(
      {required this.value, required this.lastUpdated, required this.status});

  @override
  List<Object?> get props => [status, value, lastUpdated];
}

class DeviceInitial extends DeviceState {
  const DeviceInitial({required DateTime t, super.value, status})
      : super(lastUpdated: t, status: status);

  const DeviceInitial.value(
      {super.value, required DateTime t, required super.status})
      : super(lastUpdated: t);
}
