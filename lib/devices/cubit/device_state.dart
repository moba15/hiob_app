part of 'device_cubit.dart';


enum DeviceStatus {
  UNAVALIBLE, READY, TIMEOUT, ERROR404
}
@immutable
class DeviceState<T>  {

  T? value;
  DeviceStatus status;
  Duration lastUpdated;

  DeviceState._({ this.value, required this.status, required this.lastUpdated});

  DeviceState<T> copyWith({T? value, String? id, String? name, DeviceStatus? status, Duration? lastUpdated }){
    return DeviceState._(
      value: value ?? this.value,
      lastUpdated: lastUpdated ?? this.lastUpdated,

      status: status ?? this.status,

    );
  }





}

