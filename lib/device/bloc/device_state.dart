part of 'device_bloc.dart';

enum DeviceStatus {
  unavailable, ready, error
}

class DeviceState extends Equatable {
  final DateTime lastUpdated;
  final dynamic value;
  final DeviceStatus status;
  
  const DeviceState({required this.value, required this.lastUpdated, this.status =  DeviceStatus.unavailable});

  @override
  List<Object?> get props => [status, value, lastUpdated];
}

class DeviceInitial extends DeviceState {
  const DeviceInitial({required DateTime t, dynamic value})
      : super(value: value, lastUpdated: t);
  const DeviceInitial.value({dynamic value, required DateTime t}) : super(value: value, lastUpdated: t);
}
