

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/devices/device.dart';
import 'package:smart_home/manager/device_manager.dart';

part 'device_list_state.dart';

class DeviceListCubit extends Cubit<DeviceListState> {
  DeviceListCubit({required this.deviceManager}) : super(const DeviceListState.loading());

  final DeviceManager deviceManager;


  Future<void> fetchList() async {
    try {
      final items = await deviceManager.loadDevices();
      emit(DeviceListState.success(items));
    } on Exception {
      emit(const DeviceListState.failure());
    }
  }

  Future<void> addDevice(Device device) async {
    try {

      deviceManager.addDevice(device);
      deviceManager.devicesList.add(device);

      emit(DeviceListState.success(deviceManager.devicesList));
    } on Exception {
      emit(const DeviceListState.failure());
    }
  }

}
