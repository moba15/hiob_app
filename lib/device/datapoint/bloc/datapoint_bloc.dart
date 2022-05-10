import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/device/iobroker_device.dart';
import 'package:smart_home/manager/manager.dart';

import '../../../dataPackages/data_package.dart';

part 'datapoint_event.dart';
part 'datapoint_state.dart';


class DataPointBloc extends Bloc<DataPointEvent, DataPointState> {
  StreamSubscription<dynamic>? _deviceValueSubscription;
  DataPoint dataPoint;

  DataPointBloc(this.dataPoint)
      : super(DataPointInitial(value: dataPoint.value)) {
    on<DataPointValueUpdate>(_onValueUpdated);
    on<DataPointValueUpdateRequest>(_onValueUpdateRequest);
    _deviceValueSubscription =
        dataPoint.valueStreamController.stream.listen((event) {
      add(DataPointValueUpdate(value: event, oldValue: dataPoint.olderValue));
    });
  }

  @override
  Future<void> close() {
    _deviceValueSubscription?.cancel();
    return super.close();
  }

  void _onValueUpdated(DataPointValueUpdate event, Emitter<DataPointState> emit) {
    emit(DataPointState(
        value: event.value, oldValue: event.oldValue));
    dataPoint.value = event.value;
  }

  void _onValueUpdateRequest(
      DataPointValueUpdateRequest event, Emitter<DataPointState> emit) {
    emit(DataPointState(value: event.value, oldValue: event.oldValue));
    dataPoint.value = event.value;
    dataPoint.device?.lastUpdated = DateTime.now();
    if (dataPoint.device is IoBrokerDevice) {
      Manager.instance?.connectionManager.sendMsg(StateChangeRequestIobPackage(
          stateID: dataPoint.id, value: event.value));
    }
  }
}
