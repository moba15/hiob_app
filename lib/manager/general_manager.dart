import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home/background/background_runner.dart';
import 'package:smart_home/background/impl/local/local_background_runner.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/logger/logger_filter.dart';
import 'package:uuid/uuid.dart';

class GeneralManager {
  //Has to be static for background runner
  static BackgroundReconnectStrategy backgroundReconnectStrategy =
      BackgroundReconnectStrategy.wifiOnly;

  var uuid = const Uuid();

  final FileManager fileManager;
  final Manager manager;
  final String key = "generalSettings";
  final String buildKey = "buildKey";
  StreamController<bool> statusStreamController = StreamController();
  StreamController<AlertDialog Function(BuildContext)> dialogStreamController =
      StreamController.broadcast();

  late bool vibrateEnabled;
  String? deviceName;
  String? deviceID;
  String? loginKey;
  String? ioBVersion;
  bool useBottomSheet = true;
  CustomLoggerFilter customLoggerFilter = CustomLoggerFilter();

  BackgroundRunner? backgroundRunner;
  BackgroundRunnerStrategy backgroundRunnerStrategy =
      BackgroundRunnerStrategy.local;

  GeneralManager({required this.manager, required this.fileManager});

  void load() async {
    if (!await fileManager.containsKey(key)) {
      await fileManager.writeJSON(key, {});
    }
    Map<String, dynamic> settings =
        (await fileManager.getMap(key)) ?? _loadDefaultSettings();
    vibrateEnabled = settings["vibrateEnabled"] ?? false;
    await setDeviceNameBasedOnSettingAndOS(settings);
    loginKey = settings["loginKey"]; //TODO: Exclude in Backup
    deviceID = settings["id"] ?? uuid.v4();
    ioBVersion = settings["ioBVersion"] ?? "";
    settings["id"] = deviceID;
    backgroundRunnerStrategy = BackgroundRunnerStrategy.values.firstWhere(
        (e) => e.toString() == settings["backgroundRunnerStrategy"],
        orElse: () => BackgroundRunnerStrategy.local);
    backgroundReconnectStrategy = BackgroundReconnectStrategy.values.firstWhere(
        (e) => e.toString() == settings["backgroundReconnectStrategy"],
        orElse: () => BackgroundReconnectStrategy.wifiOnly);

    customLoggerFilter = CustomLoggerFilter.fromJson(settings["logger"] ?? {});
    _save();
    statusStreamController.add(true);
    if (!await fileManager.containsKey(buildKey) ||
        (await fileManager.getString(buildKey)) != manager.buildNumber) {
      await Future.delayed(const Duration(seconds: 4));
      manager.status = ManagerStatus.changeLog;
      manager.managerStatusStreamController.sink.add(ManagerStatus.changeLog);
      fileManager.writeString(buildKey, manager.buildNumber);
    }

    _initBackgroundRunnerOnChange();
  }

  Future<void> setDeviceNameBasedOnSettingAndOS(
      Map<String, dynamic> settings) async {
    deviceName = settings["deviceName"];
    deviceName ??= (await manager.deviceInfo.deviceInfo).data["name"];
    deviceName ??= "No Name found";
  }

  Map<String, dynamic> _loadDefaultSettings() => {
        "vibrateEnabled": false,
      };

  bool get isVibrateEnabled => vibrateEnabled;

  void _save() async {
    Map<String, dynamic> settings = {
      "vibrateEnabled": vibrateEnabled,
      "loginKey": loginKey,
      "id": deviceID,
      "ioBVersion": ioBVersion,
      "logger": customLoggerFilter,
      "backgroundRunnerStrategy": backgroundRunnerStrategy.toString(),
      "backgroundReconnectStrategy": backgroundReconnectStrategy.toString(),
    };

    await fileManager.writeJSON(key, settings);
  }

  void updateVibrateEnabled(bool vibrate) {
    vibrateEnabled = vibrate;
    _save();
  }

  void updateLoginKey(String key) {
    loginKey = key;
    _save();
  }

  void updateIobVersion(String version) {
    ioBVersion = version;
    _save();
  }

  disableLogger() {
    manager.talker.disable();
  }

  enableLogger() {
    manager.talker.enable();
  }

  void changeCustomLoggerFilter() {
    _save();
    Manager().talker.configure(filter: customLoggerFilter);
  }

  setBackgroundStrategy(BackgroundRunnerStrategy backgroundRunnerStrategy) {
    this.backgroundRunnerStrategy = backgroundRunnerStrategy;
    _save();
    _initBackgroundRunnerOnChange();
  }

  setBackgroundReconnectStrategy(
      BackgroundReconnectStrategy backgroundReconnectStrategy) {
    GeneralManager.backgroundReconnectStrategy = backgroundReconnectStrategy;
    _save();
  }

  void _initBackgroundRunnerOnChange() {
    switch (backgroundRunnerStrategy) {
      case BackgroundRunnerStrategy.disabled:
        backgroundRunner = null;
        break;
      case BackgroundRunnerStrategy.local:
        backgroundRunner = LocalBackgroundRunnerImpl(
            generalManager: this, ioBrokerManager: manager.ioBrokerManager);
        break;
    }
    backgroundRunner?.init();
  }
}
