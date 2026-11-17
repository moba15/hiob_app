import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_home/device/state/bloc/device_state_bloc.dart';
import 'package:smart_home/model/device/device_interface.dart';
import 'package:smart_home/services/device/device_service_interface.dart';

class FakeDeviceService implements DeviceServiceInterface<DeviceInterface> {
  final StreamController<Map<String, dynamic>> _batchController =
      StreamController<Map<String, dynamic>>.broadcast();

  final Map<String, dynamic> _initialValues;
  bool controlResult = true;
  Object? controlError;
  final List<({String deviceId, dynamic value})> controlCalls = [];

  FakeDeviceService({Map<String, dynamic>? initialValues})
    : _initialValues = Map<String, dynamic>.from(initialValues ?? {});

  void emitBatch(Map<String, dynamic> batch) {
    _batchController.add(batch);
  }

  Future<void> dispose() async {
    await _batchController.close();
  }

  @override
  Map<String, dynamic> get currentValuesMap =>
      Map<String, dynamic>.unmodifiable(_initialValues);

  @override
  Stream<Map<String, dynamic>> get objectBatchValueStream =>
      _batchController.stream;

  @override
  Future<bool> controllDevice<T>({
    required String deviceId,
    required T value,
  }) async {
    controlCalls.add((deviceId: deviceId, value: value));
    if (controlError != null) {
      throw controlError!;
    }
    return controlResult;
  }

  @override
  Future<void> fetchAndUpdateDevices() async {}

  @override
  Future<List<DeviceInterface>> getAllDevices({required int limit}) async => [];

  @override
  Future<DeviceInterface?> getDeviceById({required String id}) async => null;

  @override
  T? getDeviceValue<T>({required DeviceInterface device}) =>
      _initialValues[device.id] as T?;

  @override
  Future<List<String>> getSelectableFilters() async => [];

  @override
  void listenToDeviceChanges() {}

  @override
  List<String> get preDefinedFilters => [];

  @override
  Future<List<DeviceInterface>> searchDevices({
    required String userQuery,
    Map<String, bool> filters = const {},
  }) async => [];

  @override
  void updateFilters(List<String> filters) {}
}

void main() {
  group('DeviceStateBloc', () {
    late FakeDeviceService fakeDeviceService;

    setUp(() {
      fakeDeviceService = FakeDeviceService(
        initialValues: {'light.1': false, 'temp.1': 20.5},
      );
    });

    tearDown(() async {
      await fakeDeviceService.dispose();
    });

    test('seeds initial state from deviceService.currentValuesMap', () {
      final bloc = DeviceStateBloc(deviceService: fakeDeviceService);
      expect(bloc.state.getValue('light.1'), false);
      expect(bloc.state.getValue('temp.1'), 20.5);
      expect(bloc.state.getValue(null), isNull);
      expect(bloc.state.updateSequence, 0);
      bloc.close();
    });

    test('prefers explicit initialValues over currentValuesMap', () {
      final bloc = DeviceStateBloc(
        deviceService: fakeDeviceService,
        initialValues: {'light.1': true},
      );
      expect(bloc.state.getValue('light.1'), true);
      expect(bloc.state.getValue('temp.1'), isNull);
      bloc.close();
    });

    blocTest<DeviceStateBloc, DeviceState>(
      'emits single state update for DeviceValuesBatchUpdated and ignores empty batch',
      build: () => DeviceStateBloc(deviceService: fakeDeviceService),
      act: (bloc) {
        bloc.add(const DeviceValuesBatchUpdated({}));
        bloc.add(
          const DeviceValuesBatchUpdated({'light.1': true, 'temp.1': 22.0}),
        );
      },
      expect: () => [
        isA<DeviceState>()
            .having((s) => s.updateSequence, 'updateSequence', 1)
            .having((s) => s.getValue('light.1'), 'light.1', true)
            .having((s) => s.getValue('temp.1'), 'temp.1', 22.0),
      ],
    );

    blocTest<DeviceStateBloc, DeviceState>(
      'subscribes to objectBatchValueStream when not in preview mode',
      build: () => DeviceStateBloc(deviceService: fakeDeviceService),
      act: (bloc) async {
        fakeDeviceService.emitBatch({'light.1': true, 'dimmer.1': 75});
        await Future<void>.delayed(Duration.zero);
      },
      expect: () => [
        isA<DeviceState>()
            .having((s) => s.updateSequence, 'updateSequence', 1)
            .having((s) => s.getValue('light.1'), 'light.1', true)
            .having((s) => s.getValue('dimmer.1'), 'dimmer.1', 75),
      ],
    );

    blocTest<DeviceStateBloc, DeviceState>(
      'optimistically updates state and normalizes comma-decimal strings on DeviceControlRequested',
      build: () => DeviceStateBloc(deviceService: fakeDeviceService),
      act: (bloc) => bloc.add(
        const DeviceControlRequested(deviceId: 'temp.1', value: '21,5'),
      ),
      expect: () => [
        isA<DeviceState>()
            .having((s) => s.updateSequence, 'updateSequence', 1)
            .having((s) => s.getValue('temp.1'), 'temp.1', 21.5),
      ],
      verify: (_) {
        expect(fakeDeviceService.controlCalls, [
          (deviceId: 'temp.1', value: 21.5),
        ]);
      },
    );

    blocTest<DeviceStateBloc, DeviceState>(
      'rolls back optimistic update when controllDevice returns false',
      build: () {
        fakeDeviceService.controlResult = false;
        return DeviceStateBloc(deviceService: fakeDeviceService);
      },
      act: (bloc) => bloc.add(
        const DeviceControlRequested(deviceId: 'light.1', value: true),
      ),
      expect: () => [
        isA<DeviceState>()
            .having((s) => s.updateSequence, 'updateSequence', 1)
            .having((s) => s.getValue('light.1'), 'light.1', true),
        isA<DeviceState>()
            .having((s) => s.updateSequence, 'updateSequence', 2)
            .having((s) => s.getValue('light.1'), 'light.1', false),
      ],
    );

    blocTest<DeviceStateBloc, DeviceState>(
      'rolls back optimistic update when controllDevice throws',
      build: () {
        fakeDeviceService.controlError = Exception('RPC failed');
        return DeviceStateBloc(deviceService: fakeDeviceService);
      },
      act: (bloc) => bloc.add(
        const DeviceControlRequested(deviceId: 'light.1', value: true),
      ),
      expect: () => [
        isA<DeviceState>()
            .having((s) => s.updateSequence, 'updateSequence', 1)
            .having((s) => s.getValue('light.1'), 'light.1', true),
        isA<DeviceState>()
            .having((s) => s.updateSequence, 'updateSequence', 2)
            .having((s) => s.getValue('light.1'), 'light.1', false),
      ],
    );

    blocTest<DeviceStateBloc, DeviceState>(
      'preview mode ignores stream updates and skips controllDevice RPCs',
      build: () => DeviceStateBloc(
        deviceService: fakeDeviceService,
        isPreviewMode: true,
      ),
      act: (bloc) async {
        fakeDeviceService.emitBatch({'light.1': true});
        await Future<void>.delayed(Duration.zero);
        bloc.add(
          const DeviceControlRequested(deviceId: 'light.1', value: true),
        );
      },
      expect: () => [
        isA<DeviceState>()
            .having((s) => s.updateSequence, 'updateSequence', 1)
            .having((s) => s.getValue('light.1'), 'light.1', true),
      ],
      verify: (_) {
        expect(fakeDeviceService.controlCalls, isEmpty);
      },
    );
  });
}
