import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:uuid/uuid.dart';
class GeneralManager {

  var uuid = Uuid();


  final FileManager fileManager;
  final Manager manager;
  final String key = "generalSettings";
  final String buildKey = "buildKey";
  StreamController<bool> statusStreamController = StreamController();
  StreamController<AlertDialog Function(BuildContext)> dialogStreamController = StreamController.broadcast();
  
  late bool vibrateEnabled;
  String? deviceName;
  String? deviceID;
  String? loginKey;
  
  GeneralManager({required this.manager,required this.fileManager});
  
  void load() async  {
    if(!await fileManager.containsKey(key)) {
      await fileManager.writeJSON(key, {});
    }
    Map<String, dynamic> settings = (await fileManager.getMap(key)) ?? _loadDefaultSettings();
    vibrateEnabled = settings["vibrateEnabled"] ?? false;
    deviceName = settings["deviceName"] ?? manager.androidInfo.model;
    loginKey = settings["loginKey"]; //TODO: Exclude in Backup
    deviceID = settings["id"] ?? uuid.v4();
    settings["id"] = deviceID;
    statusStreamController.add(true);
    if(!await fileManager.containsKey(buildKey) || (await fileManager.getString(buildKey) )!= manager.buildNumber) {
      await Future.delayed(const Duration(seconds: 4));
      manager.status = ManagerStatus.changeLog;
      manager.managerStatusStreamController.sink.add(ManagerStatus.changeLog);
      fileManager.writeString(buildKey , manager.buildNumber);

    }
    
    
  }

  Map<String, dynamic> _loadDefaultSettings() => {
    "vibrateEnabled": false,
  };


  bool get isVibrateEnabled => vibrateEnabled;

  void _save() async {
    Map<String, dynamic> settings =  {
      "vibrateEnabled": vibrateEnabled,
      "loginKey": loginKey,
      "id": deviceID,
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

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}