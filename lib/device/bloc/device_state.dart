part of 'device_bloc.dart';

enum DeviceStatus {
  unavailable, ready, error
}

class DeviceState extends Equatable {
  final DateTime lastUpdated;
  final dynamic value;
  final DeviceStatus status;
  
  const DeviceState({required this.value, required this.lastUpdated, required this.status});

  @override
  List<Object?> get props => [status, value, lastUpdated];
}

class DeviceInitial extends DeviceState {
  const DeviceInitial({required DateTime t, dynamic value, status})
      : super(value: value, lastUpdated: t, status: status);
  const DeviceInitial.value({dynamic value, required DateTime t, required DeviceStatus status}) : super(value: value, lastUpdated: t, status: status );
}
