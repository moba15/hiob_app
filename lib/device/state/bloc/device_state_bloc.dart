import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:smart_home/model/device/device_interface.dart';
import 'package:smart_home/services/device/device_service_interface.dart';

part 'device_state_event.dart';
part 'device_state_state.dart';

class DeviceStateBloc extends Bloc<DeviceStateEvent, DeviceState> {
  final DeviceServiceInterface _deviceService;
  final bool isPreviewMode;
  StreamSubscription? _batchValueSub;

  DeviceStateBloc({
    this.isPreviewMode = false,
    Map<String, dynamic>? initialValues,
    required DeviceServiceInterface<DeviceInterface> deviceService,
  }) : _deviceService = deviceService,
       super(
         DeviceState(
           values:
               initialValues ??
               Map<String, dynamic>.from(deviceService.currentValuesMap),
         ),
       ) {
    on<DeviceValuesBatchUpdated>((event, emit) {
      if (event.updates.isEmpty) return;
      final updatedMap = Map<String, dynamic>.from(state.values)
        ..addAll(event.updates);
      emit(state.copyWith(values: updatedMap));
    });

    on<DeviceControlRequested>((event, emit) async {
      final previousValue = state.values[event.deviceId];
      final normalizedValue = _normalizeControlValue(event.value);

      final updatedMap = Map<String, dynamic>.from(state.values)
        ..[event.deviceId] = normalizedValue;
      emit(state.copyWith(values: updatedMap));

      // In preview/simulator mode, never dispatch hardware RPCs
      if (isPreviewMode) return;

      try {
        final success = await _deviceService.controllDevice(
          deviceId: event.deviceId,
          value: normalizedValue,
        );
        if (!success) {
          _rollback(event.deviceId, previousValue, emit);
        }
      } catch (_) {
        _rollback(event.deviceId, previousValue, emit);
      }
    });

    if (!isPreviewMode) {
      _batchValueSub = _deviceService.objectBatchValueStream.listen((batch) {
        add(DeviceValuesBatchUpdated(batch));
      });
    }
  }

  dynamic _normalizeControlValue(dynamic rawValue) {
    if (rawValue is String) {
      final parsedDouble = double.tryParse(rawValue.replaceAll(',', '.'));
      if (parsedDouble != null) return parsedDouble;
    }
    return rawValue;
  }

  void _rollback(
    String deviceId,
    dynamic previousValue,
    Emitter<DeviceState> emit,
  ) {
    final rollbackMap = Map<String, dynamic>.from(state.values)
      ..[deviceId] = previousValue;
    emit(state.copyWith(values: rollbackMap));
  }

  @override
  Future<void> close() {
    _batchValueSub?.cancel();
    return super.close();
  }
}
