import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_home/model/device/device_interface.dart';
import 'package:smart_home/services/device/device_service_interface.dart';

part 'datapoint_event.dart';

part 'datapoint_state.dart';

class DataPointBloc extends Bloc<DataPointEvent, DataPointState> {
  StreamSubscription<dynamic>? _deviceValueSubscription;
  final String objectId;
  final DeviceServiceInterface _deviceService;

  DataPointBloc(this.objectId, {required DeviceServiceInterface deviceService})
    : _deviceService = deviceService,
      super(DataPointInitial(value: null)) {
    on<DataPointValueUpdate>(_onValueUpdated);
    on<DataPointValueUpdateRequest>(_onValueUpdateRequest);
    _deviceValueSubscription = _deviceService.objectValueStream.listen((event) {
      if (event.first == objectId) {
        add(DataPointValueUpdate(value: event.second));
      }
    });

    // Start listening to device changes for this object

    add(
      DataPointValueUpdate(
        value: _deviceService.getDeviceValue(
          device: DeviceInterface(id: objectId),
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _deviceValueSubscription?.cancel();
    return super.close();
  }

  void _onValueUpdated(
    DataPointValueUpdate event,
    Emitter<DataPointState> emit,
  ) {
    emit(DataPointState(value: event.value));
  }

  void _onValueUpdateRequest(
    DataPointValueUpdateRequest event,
    Emitter<DataPointState> emit,
  ) {
    dynamic value = event.value;
    double? parsedValue = double.tryParse(
      value.toString().replaceAll(",", "."),
    );
    if (parsedValue != null) {
      value = parsedValue;
    }

    emit(DataPointState(value: value));
    _deviceService.controllDevice<dynamic>(deviceId: objectId, value: value);
  }
}
