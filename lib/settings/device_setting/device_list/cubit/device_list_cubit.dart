

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smart_home/manager/device_manager.dart';

import '../../../../device/device.dart';
import '../../../../utils/list_status.dart';

part 'device_list_state.dart';

class DeviceListCubit extends Cubit<DeviceListState> {
  StreamSubscription? deviceListSubscription;
  DeviceListCubit({required this.deviceManager}) : super(const DeviceListState.loading()) {
    deviceListSubscription = deviceManager.deviceListStreamController.stream.listen((event) { update(event);});
  }

  final DeviceManager deviceManager;

  @override
  Future<void> close() async {
    deviceListSubscription?.cancel();
    super.close();

  }


  Future<void> fetchList() async {
    try {
      final items = await deviceManager.loadDevices();
      emit(DeviceListState.success(items));

    } on Exception {
      emit(const DeviceListState.failure());
    }
  }

  void addDevice(Device device) async {
    deviceManager.addDevice(device);

  }

  @override
  void onChange(Change<DeviceListState> change) {
    super.onChange(change);
  }

  void update(List<Device> devices) {
    emit(DeviceListState.update(devices));

  }


}
