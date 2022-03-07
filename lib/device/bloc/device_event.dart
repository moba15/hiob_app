part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class DeviceValueUpdate extends DeviceEvent {
  final dynamic value;
  const DeviceValueUpdate({required this.value});
}


class DeviceIdle extends DeviceEvent {
  final DateTime lastUpdated;
  const DeviceIdle({required this.lastUpdated});
}