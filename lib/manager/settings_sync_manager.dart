import 'dart:async';
import 'dart:convert';

import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';

import '../preconfigs/preconfig.dart';

class SettingsSyncManager {
  final ConnectionManager connectionManager;
  final FileManager fileManager;
  String settingsSyncKey = "settingsSyncKey";

  String? loadedTemplate;

  bool autoUpdateFromAdapter = false;
  bool autoUpdateToAdapter = false;

  List<PreConfig> configs = [];

  StreamController<bool> configAddedStreamController =
      StreamController.broadcast();

  StreamController<List<String>> fetchedConfigListStreamController =
      StreamController.broadcast();

  StreamController<bool> uploadSuccessStreamController =
      StreamController.broadcast();

  StreamController<bool> loadedSuccessStreamController =
      StreamController.broadcast();

  SettingsSyncManager(
      {required this.connectionManager, required this.fileManager});

  void loadSettings() async {
    if (!await fileManager.containsKey(settingsSyncKey)) {
      fileManager.writeJSON(settingsSyncKey, _loadDefaultSettings());
    }
    Map<String, dynamic> settings =
        (await fileManager.getMap(settingsSyncKey)) ?? _loadDefaultSettings();
    loadedTemplate = settings["loadedTemplate"];
    autoUpdateFromAdapter = settings["autoUpdateFromAdapter"];
    autoUpdateToAdapter = settings["autoUpdateToAdapter"];
  }

  void uploadSettings(PreConfig preConfig,
      {required bool device, required bool widget, required bool screen}) {
    String? devicesJSON = !device
        ? null
        : jsonEncode(Manager.instance.deviceManager.devicesList);
    String? widgetsJSON = !widget
        ? null
        : jsonEncode(Manager.instance.customWidgetManager.templates);
    String? screensJSON =
        !screen ? null : jsonEncode(Manager.instance.screenManager.screens);

    connectionManager.sendMsg(UploadTemplateSetting(
        name: preConfig.name,
        devicesJSON: devicesJSON,
        widgetsJSON: widgetsJSON,
        screensJSON: screensJSON));
  }

  void createNewSettingsTemplate(String name) {
    connectionManager.sendMsg(CreateTemplateSetting(name: name));
  }

  Future<List<PreConfig>> fetchTemplatesFromAdapter() async {
    Manager.instance.connectionManager.sendMsg(RequestTemplateSettings());
    List rawData = await fetchedConfigListStreamController.stream.first;
    List<PreConfig> configs = [];
    for (String name in rawData) {
      configs.add(PreConfig(name: name, lastUpdate: DateTime.now()));
    }
    return configs;
  }

  Map<String, dynamic> _loadDefaultSettings() {
    return {
      "loadedTemplate": null,
      "autoUpdateFromAdapter": false,
      "autoUpdateToAdapter": false,
    };
  }

  void onTemplateCreate() {
    configAddedStreamController.sink.add(true);
  }

  void getTemplateSettings(PreConfig preConfig,
      {required bool device, required bool widget, required bool screen}) {
    connectionManager.sendMsg(GetTemplateSetting(
        name: preConfig.name, device: device, widget: widget, screen: screen));
  }

  void loadGotTemplate(String? devices, String? screens, String? widgets) {
    Manager manager = Manager.instance;

    if (devices != null) {
      fileManager.pref.setString(manager.deviceManager.key, devices);
    }
    if (widgets != null) {
      fileManager.pref
          .setString(manager.customWidgetManager.templateKey, widgets);
    }
    if (screens != null) {
      fileManager.pref.setString(manager.screenManager.key, screens);
    }
    manager.deviceManager.reload();
    manager.screenManager.reload();
    loadedSuccessStreamController.add(true);
  }
}
