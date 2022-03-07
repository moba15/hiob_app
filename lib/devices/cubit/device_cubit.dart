import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'device_state.dart';

class DeviceCubit<T> extends Cubit<DeviceState<T>> {
  DeviceCubit(T? value, DeviceStatus status) : super(
    DeviceState._(value: value, status: DeviceStatus.UNAVALIBLE, lastUpdated: const Duration())
  );


  Future<void> changeValue(T value) async {
    emit(state.copyWith(value: value));

  }

  Future<void> changeLastUpdated(Duration value) async {
    emit(state.copyWith(lastUpdated: value));

  }

  Future<void> changeStatus(DeviceStatus value) async {
    emit(state.copyWith(status: value));

  }

}
