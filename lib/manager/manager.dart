import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/manager/settings_sync_manager.dart';
import 'package:smart_home/manager/theme/theme_manager.dart';
import 'package:smart_home/services/connection_service_interface.dart';
import 'package:smart_home/services/device/device_service_interface.dart';
import 'package:smart_home/services/service_container.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../background/background_runner.dart';

class Manager {
  //@Deprecated("Please use the Context")
  static final Manager instance = Manager._internal(
    versionNumber: "1.000-alpha.3",
    buildNumber: "301",
  );
  static final navigatorKey = GlobalKey<NavigatorState>();
  //@Deprecated("Please use the Context")
  factory Manager() => instance;

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  late FileManager fileManager;
  late CustomWidgetManager customWidgetManager;
  StreamSubscription? subscription1;

  late DeviceManager deviceManager;
  StreamSubscription? subscription2;

  late ScreenManager screenManager;
  StreamSubscription? subscription3;

  late IoBrokerManager ioBrokerManager;
  StreamSubscription? subscription4;

  late ConnectionManager connectionManager;
  StreamSubscription? subscription5;

  late GeneralManager generalManager;
  StreamSubscription? subscription6;

  late SettingsSyncManager settingsSyncManager;

  late ThemeManager themeManager;

  late BackgroundRunner backgroundRunner;

  late NotificationManager notificationManager;

  final Talker talker = TalkerFlutter.init();

  ManagerStatus status = ManagerStatus.loading;

  String versionNumber;
  String buildNumber;

  Manager._internal({required this.versionNumber, required this.buildNumber});

  var _random = Random();

  /// Loads services by delegating creation to [ServiceContainer]. The
  /// heavy wiring was moved into the container so we can expose values via
  /// Provider. We still keep the same fields on `Manager` so existing call
  /// sites can continue to access `Manager().<field>` during incremental
  /// migration.
  Future<void> load() async {
    final container = await ServiceContainer.create();

    fileManager = container.fileManager;
    deviceManager = container.deviceManager;
    ioBrokerManager = container.ioBrokerManager;
    generalManager = container.generalManager;
    connectionManager = container.connectionManager;
    customWidgetManager = container.customWidgetManager;
    screenManager = container.screenManager;
    settingsSyncManager = container.settingsSyncManager;
    themeManager = container.themeManager;
  }

  String getRandString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789';
    return List.generate(
      length,
      (index) => chars[_random.nextInt(chars.length)],
    ).join();
  }
}
