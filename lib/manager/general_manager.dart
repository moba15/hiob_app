import 'dart:async';

import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';

class GeneralManager {
  
  final FileManager fileManager;
  final Manager manager;
  final String key = "generalSettings";
  StreamController<bool> statusStreamController = StreamController();
  
  late bool vibrateEnabled;
  
  
  GeneralManager({required this.manager,required this.fileManager});
  
  void load() async  {
    if(!await fileManager.containsKey(key)) {
      await fileManager.writeJSON(key, {});
    }
    Map<String, dynamic> settings = (await fileManager.getMap(key)) ?? _loadDefaultSettings();
    vibrateEnabled = settings["vibrateEnabled"] ?? false;
    statusStreamController.add(true);
    
    
  }

  Map<String, dynamic> _loadDefaultSettings() => {
    "vibrateEnabled": false,
  };


  bool get isVibrateEnabled => vibrateEnabled;

  void _save() async {
    Map<String, dynamic> settings =  {
      "vibrateEnabled": vibrateEnabled
    };

    await fileManager.writeJSON(key, settings);

  }

  void updateVibrateEnabled(bool vibrate) {
    vibrateEnabled = vibrate;
    _save();
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}