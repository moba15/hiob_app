import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/history/history_manager.dart';
import 'package:smart_home/manager/notification/notification_manager.dart';
import 'package:smart_home/manager/samart_home/iobroker_manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/manager/settings_sync_manager.dart';
import 'package:smart_home/manager/theme/theme_manager.dart';

import '../background/background_runner.dart';

class Manager {
  //@Deprecated("Please use the Context")
  static final Manager instance =
      Manager._internal(versionNumber: "0.0.620", buildNumber: "149");
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

  late HistoryManager historyManager;
  StreamSubscription? subscription7;

  late SettingsSyncManager settingsSyncManager;

  late ThemeManager themeManager;

  late BackgroundRunner backgroundRunner;

  late NotificationManager notificationManager;

  ManagerStatus status = ManagerStatus.loading;

  String versionNumber;
  String buildNumber;

  Manager._internal({required this.versionNumber, required this.buildNumber});

  int loadingState = 0;
  int maxLoadingState = 6;
  StreamController<ManagerStatus> managerStatusStreamController =
      StreamController.broadcast();
  var random = Random();

  Future<void> load() async {
    final pref = await SharedPreferences.getInstance();

    fileManager = FileManager(pref: pref, manager: this);
    deviceManager = DeviceManager(fileManager, devicesList: [], manager: this)
      ..loadDevices();

    ioBrokerManager = IoBrokerManager(fileManager: fileManager)..load();

    generalManager = GeneralManager(manager: this, fileManager: fileManager)
      ..load();

    connectionManager = ConnectionManager(
        deviceManager: deviceManager,
        ioBrokerManager: ioBrokerManager,
        generalManager: generalManager);

    historyManager = HistoryManager(connectionManager: connectionManager);

    customWidgetManager = CustomWidgetManager(
        fileManager: fileManager, deviceManager: deviceManager, manager: this);
    screenManager =
        ScreenManager(fileManager: fileManager, screens: [], manager: this)
          ..loadScreens();

    settingsSyncManager = SettingsSyncManager(
        connectionManager: connectionManager, fileManager: fileManager)
      ..loadSettings();

    themeManager = ThemeManager(manager: this)..loadTheme();

    subscription1 =
        customWidgetManager.templatesStreamController.stream.listen((event) {
      onLoaded();
    });

    subscription2 =
        deviceManager.deviceListStreamController.stream.listen((event) {
      onLoaded();
    });

    subscription3 = screenManager.screenStreamController.stream.listen((event) {
      onLoaded();
    });

    subscription4 =
        ioBrokerManager.statusStreamController.stream.listen((event) {
      onLoaded();
    });

    subscription5 =
        connectionManager.statusStreamController.stream.listen((event) {
      onLoaded();
    });
    subscription6 =
        generalManager.statusStreamController.stream.listen((event) {
      onLoaded();
    });
  }

  String getRandString(int len) {
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void onLoaded() {
    loadingState += 1;
    if (loadingState == maxLoadingState - 1) {
      status = ManagerStatus.finished;
      managerStatusStreamController.add(ManagerStatus.finished);
      connectionManager.connectIoB();
    }
    if (loadingState >= maxLoadingState - 1) {
      _initManagerAfter();
      status = ManagerStatus.finished;
      managerStatusStreamController.sink.add(ManagerStatus.finished);
      subscription1?.cancel();
      subscription2?.cancel();
      subscription3?.cancel();
      subscription4?.cancel();
      subscription5?.cancel();
      subscription6?.cancel();
    }
  }

  void _initManagerAfter() {
    notificationManager = NotificationManager(fileManager: fileManager);
    backgroundRunner = BackgroundRunner(
        generalManager: generalManager, ioBrokerManager: ioBrokerManager)
      ..init();
  }
}
