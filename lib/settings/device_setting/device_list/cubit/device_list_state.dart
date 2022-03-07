part of 'device_list_cubit.dart';
enum ListStatus { loading, success, failure }

class DeviceListState  {
  final ListStatus status;
  final List<Device> devices;
  const DeviceListState._({
    this.status = ListStatus.loading,
    this.devices = const []
  });

  const DeviceListState.loading() : this._();
  const DeviceListState.success(List<Device> devices)
      : this._(status: ListStatus.success, devices: devices);
  const DeviceListState.added(List<Device> devices)
      : this._(status: ListStatus.success, devices: devices);
  const DeviceListState.failure() : this._(status: ListStatus.failure);








}
