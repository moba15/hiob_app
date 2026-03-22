import 'dart:async';

import 'package:restart_app/restart_app.dart';
import 'package:smart_home/generated/config_sync/config_sync.pbgrpc.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/services/connection_service_interface.dart';
import 'package:smart_home/services/logging/logging_service.dart';

import '../preconfigs/preconfig.dart';

class SettingsSyncManager {
  final ConnectionServiceInterface connectionManager;
  final FileManager fileManager;
  final LoggingService loggingService;
  String settingsSyncKey = "settingsSyncKey";
  String templateStorageKey = "templateKey";
  String screenStorageKey = "screens";

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
    required this.loggingService,
  });

  Future<void> loadSettings() async {
    if (!await fileManager.containsKey(settingsSyncKey)) {
      fileManager.writeJSON(settingsSyncKey, _loadDefaultSettings());
    }
    Map<String, dynamic> settings =
        (await fileManager.getMap(settingsSyncKey)) ?? _loadDefaultSettings();
    loadedTemplate = settings["loadedTemplate"];
    autoUpdateFromAdapter = settings["autoUpdateFromAdapter"];
    autoUpdateToAdapter = settings["autoUpdateToAdapter"];
  }

  Future<void> uploadSettings(
    String preConfig, {
    required bool widget,
    required bool screen,
  }) async {
    String? widgetsJSON = !widget
        ? null
        : await fileManager.getString(templateStorageKey);

    String? screensJSON = !screen
        ? null
        : await fileManager.getString(screenStorageKey);

    ConfigSyncUpRequest configSyncUpRequest = ConfigSyncUpRequest(
      config: Config(
        name: preConfig,
        screens: screensJSON,
        templates: widgetsJSON,
      ),
    );
    connectionManager.getGrpcService<ConfigSyncClient>().configSyncUp(
      configSyncUpRequest,
    );
  }

  Future<ConfigCreateDeleteResponse> createNewSettingsTemplate(
    String name,
  ) async {
    ConfigCreateDeleteResponse response = await connectionManager
        .getGrpcService<ConfigSyncClient>()
        .configCreateDelete(
          ConfigCreateDeleteRequest(configName: name, delete: false),
        )
        .onError((error, stackTrace) {
          loggingService.error(
            "Error creating new settings template: $error, $stackTrace",
            error,
            stackTrace,
          );
          return ConfigCreateDeleteResponse(success: false);
        });
    return response;
  }

  Future<List<String>> fetchTemplatesFromAdapter() async {
    AvailableConfigsResponse response = await connectionManager
        .getGrpcService<ConfigSyncClient>()
        .getAvailableConfigs(AvailableConfigsRequest())
        .onError((error, stackTrace) {
          loggingService.error(
            "SettingsSyncManager | fetchTemplatesFromAdapter | Error fetching templates from adapter: $error, $stackTrace",
            error,
            stackTrace,
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
    Config config = await connectionManager
        .getGrpcService<ConfigSyncClient>()
        .configSyncDown(request)
        .onError((error, stackTrace) {
          loggingService.error(
            "SettingsSyncManager | fetchTemplatesFromAdapter | Error fetching templates from adapter: $error, $stackTrace",
            error,
            stackTrace,
          );
          return Config();
        });
    if (config.name.isNotEmpty) {
      loadGotTemplate(config.screens, config.templates);
    }
  }

  void loadGotTemplate(String? screens, String? widgets) {
    //INFO: Devices are loaded from the adapter
    if (widgets != null) {
      fileManager.pref.setString(templateStorageKey, widgets);
    }
    if (screens != null) {
      fileManager.pref.setString(screenStorageKey, screens);
      Restart.restartApp();
    }

    loadedSuccessStreamController.add(true);
  }
}
