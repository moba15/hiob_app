import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home/services/connection/connection_service_interface.dart';
import 'package:smart_home/services/impl/iobroker/connection_manager.dart';
import 'package:smart_home/services/device/device_service_interface.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/utils/pair.dart';
import 'package:smart_home/model/device/device_interface.dart';
import 'package:smart_home/repository/custom_widget_repository.dart';
import 'package:smart_home/services/impl/iobroker/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/repository/general_repository.dart';
import 'package:smart_home/repository/notification_repository.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:smart_home/repository/screen_repository.dart';
import 'package:smart_home/services/impl/iobroker/settings_sync_manager.dart';
import 'package:smart_home/custom_theme/theme_repository.dart';
import 'package:smart_home/services/logging/logging_service.dart';
import 'package:smart_home/services/metadata/metadata_service.dart';

enum ServiceInitStatus { started, loaded, failed }

typedef ServiceInitProgressCallback =
    void Function(String key, ServiceInitStatus status, String? error);

class BackgroundServiceContaier {
  final FileManager fileManager;
  final IoBrokerManager ioBrokerManager;
  final GeneralRepository generalRepository;
  final NotificationRepository notificationRepository;
  final ConnectionServiceInterface connectionService;

  BackgroundServiceContaier._({
    required this.fileManager,
    required this.ioBrokerManager,
    required this.generalRepository,
    required this.notificationRepository,
    required this.connectionService,
  });

  /// Creates and wires all services/managers using provider-friendly
  /// constructor injection.
  static Future<BackgroundServiceContaier> create({
    ServiceInitProgressCallback? onProgress,
  }) async {
    void progress(String key, ServiceInitStatus status, [String? error]) {
      onProgress?.call(key, status, error);
    }

    Future<T> runStep<T>(String key, Future<T> Function() action) async {
      progress(key, ServiceInitStatus.started);
      try {
        final result = await action();
        progress(key, ServiceInitStatus.loaded);
        return result;
      } catch (e) {
        progress(key, ServiceInitStatus.failed, e.toString());
        rethrow;
      }
    }

    final pref = await runStep(
      'shared_preferences',
      SharedPreferences.getInstance,
    );
    final LoggingService loggingService = await runStep(
      'logging_service',
      () async => LoggingService.instance,
    );
    final MetadataService metadataService = await runStep(
      'metadata_service',
      MetadataService.create,
    );

    final fileManager = await runStep(
      'file_manager',
      () async => FileManager(pref: pref, loggingService: loggingService),
    );
    final generalRepository = GeneralRepository(
      loggingService: loggingService,
      fileManager: fileManager,
      metadataService: metadataService,
    );
    await runStep('general_manager', generalRepository.load);

    final notificationRepository = NotificationRepository(
      fileManager: fileManager,
    );
    await runStep('notification_repository', notificationRepository.load);
    final deviceManager = await runStep(
      'dummy_device_manager',
      () async => DummyDeviceManager(),
    );

    final ioBrokerManager = IoBrokerManager(fileManager: fileManager);
    await runStep('iobroker_manager', ioBrokerManager.load);

    final connectionManager = await runStep(
      'connection_manager',
      () async => IoBrokerConnectionService(
        deviceManager: deviceManager,
        ioBrokerManager: ioBrokerManager,
        generalManager: generalRepository,
        loggingService: loggingService,
      ),
    );
    // DummyDeviceManager doesn't need the connectionService, so we can skip setting it if it's not supported
    // but to satisfy IoBrokerConnectionService if it sets it, we'll implement it.

    await runStep('connection_manager_connect', connectionManager.connect);

    return BackgroundServiceContaier._(
      fileManager: fileManager,
      ioBrokerManager: ioBrokerManager,
      generalRepository: generalRepository,
      notificationRepository: notificationRepository,
      connectionService: connectionManager,
    );
  }
}

class DummyDeviceManager implements DeviceServiceInterface<IobrokerObject> {
  ConnectionServiceInterface? connectionServiceInterface;

  @override
  Future<List<IobrokerObject>> getAllDevices({required int limit}) async => [];

  @override
  Future<IobrokerObject?> getDeviceById({required String id}) async => null;

  @override
  Future<void> fetchAndUpdateDevices() async {}

  @override
  Future<bool> controllDevice<T>({
    required String deviceId,
    required T value,
  }) async => false;

  @override
  T? getDeviceValue<T>({required DeviceInterface device}) => null;

  @override
  Future<List<IobrokerObject>> searchDevices({
    required String userQuery,
    Map<String, bool> filters = const {},
  }) async => [];

  @override
  void listenToDeviceChanges() {}

  @override
  void updateFilters(List<String> filters) {}

  @override
  Stream<Pair<String, dynamic>> get objectValueStream => const Stream.empty();

  @override
  List<String> get preDefinedFilters => [];

  @override
  Future<List<String>> getSelectableFilters() async => [];
}
