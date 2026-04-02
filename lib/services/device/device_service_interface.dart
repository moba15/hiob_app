import 'package:smart_home/model/device/device_interface.dart';
import 'package:smart_home/utils/pair.dart';

interface class DeviceServiceInterface<Device extends DeviceInterface> {
  Future<List<Device>> getAllDevices({required int limit}) async {
    throw UnimplementedError();
  }

  Future<Device?> getDeviceById({required String id}) async {
    throw UnimplementedError();
  }

  Future<void> fetchAndUpdateDevices() async {}

  Future<bool> controllDevice<T>({
    required String deviceId,
    required T value,
  }) async {
    throw UnimplementedError();
  }

  T? getDeviceValue<T>({required DeviceInterface device}) {
    throw UnimplementedError();
  }

  Future<List<Device>> searchDevices({
    required String userQuery,
    Map<String, bool> filters = const {},
  }) {
    throw UnimplementedError();
  }

  void listenToDeviceChanges() {
    throw UnimplementedError();
  }

  void updateFilters(List<String> filters) {
    throw UnimplementedError();
  }

  Stream<Pair<String, dynamic>> get objectValueStream =>
      throw UnimplementedError();

  List<String> get preDefinedFilters => throw UnimplementedError();

  Future<List<String>> getSelectableFilters() {
    throw UnimplementedError();
  }
}
