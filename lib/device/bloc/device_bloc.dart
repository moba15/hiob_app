import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../device.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  StreamSubscription<dynamic>? deviceValueSubscription;
  StreamSubscription<DateTime>? deviceIdleSubscription;
  Device device;

  DeviceBloc(this.device, {required DateTime t})
      : super(DeviceInitial(t: t, value: device.value)) {
    on<DeviceValueUpdate>(_onValueUpdated);
    on<DeviceIdle>(_onDeviceIdle);
    deviceValueSubscription =
        device.valueStreamController.stream.listen((event) {
      add(DeviceValueUpdate(value: event));
    });
    deviceIdleSubscription =
        device.lastUpdatedStreamController.stream.listen((event) {
      add(DeviceIdle(lastUpdated: event));
    });
  }

  @override
  Future<void> close() {
    deviceValueSubscription?.cancel();
    deviceIdleSubscription?.cancel();
    return super.close();
  }

  void _onValueUpdated(DeviceValueUpdate event, Emitter<DeviceState> emit)  {
    emit(DeviceState(
        value: event.value,
        lastUpdated: DateTime.now(),
        status: DeviceStatus.ready));
    device.value = event.value;
  }

  void _onDeviceIdle(DeviceIdle event, Emitter<DeviceState> emit)  {
    emit(DeviceState(value: state.value, lastUpdated: event.lastUpdated, status: state.status));
  }
}
