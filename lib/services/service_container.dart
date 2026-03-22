import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/manager/settings_sync_manager.dart';
import 'package:smart_home/manager/theme/theme_manager.dart';
import 'package:smart_home/services/logging/logging_service.dart';
import 'package:smart_home/services/metadata/metadata_service.dart';

class ServiceContainer {
  final FileManager fileManager;
  final DeviceManager deviceManager;
  final IoBrokerManager ioBrokerManager;
  final GeneralManager generalManager;
  final ConnectionManager connectionManager;
  final CustomWidgetManager customWidgetManager;
  final ScreenManager screenManager;
  final SettingsSyncManager settingsSyncManager;
  final ThemeManager themeManager;
  final NotificationManager notificationManager;
  final LoggingService loggingService;
  final MetadataService metadataService;

  ServiceContainer._({
    required this.fileManager,
    required this.deviceManager,
    required this.ioBrokerManager,
    required this.generalManager,
    required this.connectionManager,
    required this.customWidgetManager,
    required this.screenManager,
    required this.settingsSyncManager,
    required this.themeManager,
    required this.notificationManager,
    required this.loggingService,
    required this.metadataService,
  });

  /// Creates and wires all services/managers using provider-friendly
  /// constructor injection.
  static Future<ServiceContainer> create() async {
    final pref = await SharedPreferences.getInstance();
    final LoggingService loggingService = LoggingService.instance;
    final MetadataService metadataService = await MetadataService.create();

    final fileManager = FileManager(pref: pref, loggingService: loggingService);
    final generalManager = GeneralManager(
      loggingService: loggingService,
      fileManager: fileManager,
      metadataService: metadataService,
    )..load();

    final screenManager = ScreenManager(
      fileManager: fileManager,
      screens: [],
      loggingService: loggingService,
    );

    final deviceManager = DeviceManager(
      fileManager,
      generalManager: generalManager,
      loggingService: loggingService,
      screenManager: screenManager,
    );

    final customWidgetManager = CustomWidgetManager(
      fileManager: fileManager,
      screenManager: screenManager,
    );
    screenManager.customWidgetManager = customWidgetManager;
    await screenManager.loadScreens();

    final ioBrokerManager = IoBrokerManager(fileManager: fileManager);
    ioBrokerManager.load();

    final connectionManager = ConnectionManager(
      deviceManager: deviceManager,
      ioBrokerManager: ioBrokerManager,
      generalManager: generalManager,
      loggingService: loggingService,
    );

    final notificationManager = NotificationManager(
      fileManager: fileManager,
      loggingService: loggingService,
    );

    final settingsSyncManager = SettingsSyncManager(
      connectionManager: connectionManager,
      fileManager: fileManager,
      loggingService: loggingService,
    )..loadSettings();

    final themeManager = ThemeManager(fileManager: fileManager)..loadTheme();

    return ServiceContainer._(
      fileManager: fileManager,
      deviceManager: deviceManager,
      ioBrokerManager: ioBrokerManager,
      generalManager: generalManager,
      connectionManager: connectionManager,
      customWidgetManager: customWidgetManager,
      screenManager: screenManager,
      settingsSyncManager: settingsSyncManager,
      themeManager: themeManager,
      notificationManager: notificationManager,
      loggingService: loggingService,
      metadataService: metadataService,
    );
  }

  /// Generates a random string of [length]. Optionally provide [chars].
  static String randomString(
    int length, {
    String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
  }) {
    final rnd = Random.secure();
    final buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      buffer.write(chars[rnd.nextInt(chars.length)]);
    }
    return buffer.toString();
  }
}
