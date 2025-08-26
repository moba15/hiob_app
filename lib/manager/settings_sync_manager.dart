import 'dart:async';
import 'dart:convert';

import 'package:restart_app/restart_app.dart';
import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/generated/config_sync/config_sync.pbgrpc.dart';
import 'package:smart_home/generated/google/protobuf/struct.pb.dart';
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

  SettingsSyncManager({
    required this.connectionManager,
    required this.fileManager,
  });

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

  void uploadSettings(
    String preConfig, {
    required bool widget,
    required bool screen,
  }) {
    if (connectionManager.configSyncStub == null) {
      Manager().talker.error(
        "ConfigSyncStub is null, cannot create new settings template.",
      );
    }
    String? widgetsJSON = !widget
        ? null
        : jsonEncode(Manager.instance.customWidgetManager.templates);

    String? screensJSON = !screen
        ? null
        : jsonEncode(Manager.instance.screenManager.screens);

    ConfigSyncUpRequest configSyncUpRequest = ConfigSyncUpRequest(
      config: Config(
        name: preConfig,
        screens: screensJSON,
        templates: widgetsJSON,
      ),
    );
    connectionManager.configSyncStub!.configSyncUp(configSyncUpRequest);
  }

  Future<ConfigCreateDeleteResponse> createNewSettingsTemplate(
    String name,
  ) async {
    if (connectionManager.configSyncStub == null) {
      Manager().talker.error(
        "ConfigSyncStub is null, cannot create new settings template.",
      );
    }
    ConfigCreateDeleteResponse response = await connectionManager
        .configSyncStub!
        .configCreateDelete(
          ConfigCreateDeleteRequest(configName: name, delete: false),
        )
        .onError((error, stackTrace) {
          Manager().talker.error(
            "Error creating new settings template: $error, $stackTrace",
          );

          return ConfigCreateDeleteResponse(success: false);
        });
    return response;
  }

  Future<List<String>> fetchTemplatesFromAdapter() async {
    if (connectionManager.configSyncStub == null) {
      Manager().talker.error(
        "SettingsSyncManager | fetchTemplatesFromAdapter | ConfigSyncStub is null, cannot fetch templates from adapter.",
      );
      return [];
    }

    AvailableConfigsResponse response = await connectionManager.configSyncStub!
        .getAvailableConfigs(AvailableConfigsRequest())
        .onError((error, stackTrace) {
          Manager().talker.error(
            "SettingsSyncManager | fetchTemplatesFromAdapter | Error fetching templates from adapter: $error, $stackTrace",
          );
          return AvailableConfigsResponse(configNames: []);
        });

    return response.configNames;
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

  void getTemplateSettings(
    String preConfig, {
    required bool widget,
    required bool screen,
  }) async {
    if (connectionManager.configSyncStub == null) {
      Manager().talker.error(
        "SettingsSyncManager | getTemplateSettings | ConfigSyncStub is null.",
      );
      return;
    }
    SyncType syncType = SyncType.SYNC_ALL;
    if (widget && !screen) {
      syncType = SyncType.SYNC_TEMPLATES;
    } else if (!widget && screen) {
      syncType = SyncType.SYNC_SCREENS;
    }
    ConfigSyncDownRequest request = ConfigSyncDownRequest(
      configName: preConfig,
      syncType: syncType,
    );
    Config config = await connectionManager.configSyncStub!
        .configSyncDown(request)
        .onError((error, stackTrace) {
          Manager().talker.error(
            "SettingsSyncManager | fetchTemplatesFromAdapter | Error fetching templates from adapter: $error, $stackTrace",
          );
          return Config();
        });
    if (config.name.isNotEmpty) {
      loadGotTemplate(config.screens, config.templates);
    }
  }

  void loadGotTemplate(String? screens, String? widgets) {
    Manager manager = Manager.instance;

    //INFO: Devices are loaded from the adapter
    if (widgets != null) {
      fileManager.pref.setString(
        manager.customWidgetManager.templateKey,
        widgets,
      );
    }
    if (screens != null) {
      fileManager.pref.setString(manager.screenManager.key, screens);
      Restart.restartApp();
    }

    loadedSuccessStreamController.add(true);
  }
}
