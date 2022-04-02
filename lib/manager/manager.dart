import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home/manager/connection_manager.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/screen_manager.dart';

class Manager {
  late FileManager fileManager;

  late CustomWidgetManager customWidgetManager;
  StreamSubscription? subscription1;

  late DeviceManager deviceManager;
  StreamSubscription? subscription2;

  late ScreenManager screenManager;
  StreamSubscription? subscription3;

  late ConnectionManager connectionManager;
  StreamSubscription? subscription4;

  int loadingState = 0;
  int maxLoadingState = 4;
  StreamController<ManagerStatus> managerStatusStreamController =
      StreamController.broadcast();
  var random = Random();

  Future<void> load() async {
    final pref = await SharedPreferences.getInstance();

    fileManager = FileManager(pref: pref);
    deviceManager = DeviceManager(fileManager, devicesList: [], manager: this)
      ..loadDevices();
    screenManager =
        ScreenManager(fileManager: fileManager, screens: [], manager: this)
          ..loadScreens();
    customWidgetManager = CustomWidgetManager(
        fileManager: fileManager, deviceManager: deviceManager, manager: this)
      ..loadTemplates();
    connectionManager = ConnectionManager(
        ip: "192.168.178.68", port: 8090, deviceManager: deviceManager);

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
        connectionManager.statusStreamController.stream.listen((event) {
      onLoaded();
    });
    connectionManager.connectIoB();
  }

  String getRandString(int len) {
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void onLoaded() {
    loadingState += 1;
    if (loadingState == maxLoadingState) {
      managerStatusStreamController.add(ManagerStatus.finished);
      subscription1?.cancel();
      subscription2?.cancel();
      subscription3?.cancel();
      subscription4?.cancel();
    }
  }
}