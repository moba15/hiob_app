import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/manager/manager.dart';

part 'datapoint_event.dart';

part 'datapoint_state.dart';

class DataPointBloc extends Bloc<DataPointEvent, DataPointState> {
  StreamSubscription<dynamic>? _deviceValueSubscription;
  String objectId;

  DataPointBloc(this.objectId) : super(DataPointInitial(value: null)) {
    on<DataPointValueUpdate>(_onValueUpdated);
    on<DataPointValueUpdateRequest>(_onValueUpdateRequest);
    Manager().deviceManager.objectValueStreams.stream.listen((event) {
      if (event.first == objectId) {
          add(DataPointValueUpdate(value: event.second));
        }
    });
    //TODO
    /* _deviceValueSubscription =
        dataPoint.valueStreamController.stream.listen((event) {
      add(DataPointValueUpdate(value: event));
    });*/
  }

  @override
  Future<void> close() {
    _deviceValueSubscription?.cancel();
    return super.close();
  }

  void _onValueUpdated(
      DataPointValueUpdate event, Emitter<DataPointState> emit) {
    emit(DataPointState(value: event.value));
    //TODO
  }

  void _onValueUpdateRequest(
      DataPointValueUpdateRequest event, Emitter<DataPointState> emit) {
    dynamic value = event.value;
    double? parsedValue =
        double.tryParse(value.toString().replaceAll(",", "."));
    if (parsedValue != null) {
      value = parsedValue;
    }

    emit(DataPointState(value: value));
    //TODO
    /*dataPoint.value = value;
    dataPoint.device?.lastUpdated = DateTime.now();
    if (dataPoint.device is IoBrokerDevice) {
      Manager.instance.connectionManager.sendMsg(
          StateChangeRequestIobPackage(stateID: dataPoint.id, value: value));
    }*/
  }
}
