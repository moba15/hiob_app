import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/services/logging/logging_service.dart';
import 'package:smart_home/services/metadata/metadata_service.dart';
import 'package:smart_home/utils/logger/logger_filter.dart';
import 'package:uuid/uuid.dart';

class GeneralRepository {
  var uuid = const Uuid();

  final FileManager fileManager;
  final LoggingService loggingService;
  final MetadataService metadataService;
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

  GeneralRepository({
    required this.loggingService,
    required this.fileManager,
    required this.metadataService,
  });

  Future<void> load() async {
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
    customLoggerFilter = CustomLoggerFilter.fromJson(settings["logger"] ?? {});
    _save();
    statusStreamController.add(true);
    if (!await fileManager.containsKey(buildKey) ||
        (await fileManager.getString(buildKey)) !=
            metadataService.buildNumber) {
      await Future.delayed(const Duration(seconds: 4));
      //TODO refactor manager.status = ManagerStatus.changeLog;
      // manager.managerStatusStreamController.sink.add(ManagerStatus.changeLog);
      fileManager.writeString(buildKey, metadataService.buildNumber);
    }
  }

  Future<void> setDeviceNameBasedOnSettingAndOS(
    Map<String, dynamic> settings,
  ) async {
    deviceName = settings["deviceName"];
    deviceName ??= "No Devicename found";
    deviceName ??= "No Name found";
  }

  Map<String, dynamic> _loadDefaultSettings() => {"vibrateEnabled": false};

  bool get isVibrateEnabled => vibrateEnabled;

  void _save() async {
    Map<String, dynamic> settings = {
      "vibrateEnabled": vibrateEnabled,
      "loginKey": loginKey,
      "id": deviceID,
      "ioBVersion": ioBVersion,
      "logger": customLoggerFilter,
      "deviceName": deviceName,
    };

    await fileManager.writeJSON(key, settings);
  }

  void updateVibrateEnabled(bool vibrate) {
    vibrateEnabled = vibrate;
    _save();
  }

  void updateDeviceName(String name) {
    deviceName = name;
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
    loggingService.disable();
  }

  enableLogger() {
    loggingService.enable();
  }

  void changeCustomLoggerFilter() {
    _save();
    loggingService.configure(filter: customLoggerFilter);
  }
}
