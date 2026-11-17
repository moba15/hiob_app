part of 'device_state_bloc.dart';

@immutable
sealed class DeviceStateEvent extends Equatable {
  const DeviceStateEvent();
  @override
  List<Object?> get props => [];
}

class DeviceValuesBatchUpdated extends DeviceStateEvent {
  final Map<String, dynamic> updates;
  const DeviceValuesBatchUpdated(this.updates);
  @override
  List<Object?> get props => [updates];
}

class DeviceControlRequested<T> extends DeviceStateEvent {
  final String deviceId;
  final T value;
  const DeviceControlRequested({required this.deviceId, required this.value});
  @override
  List<Object?> get props => [deviceId, value];
}
