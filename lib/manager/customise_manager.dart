import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/screen/screen.dart';
import 'package:smart_home/utils/random_generator.dart';

class CustomWidgetManager {

  CustomWidgetManager();

  final List<Screen> _screens = [];

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }


  Future<void> load() async {

    await _loadScreens();

  }

  Future<void> _loadScreens() async {
    Map<String, String> screens = await getScreens();
    for(String id in screens.keys) {
      String? name = screens[id];
      if(name !=null) {
        _screens.add(Screen(id, name));
      }
    }
  }

  Future<File> get _customWidgetsFile async {
    final path = await _localPath;
    return File('$path/customWidgets.json');
  }

  Future<File> get _screenFile async {
    final path = await _localPath;
    return File('$path/screens.json');
  }



  Future<File> writeJsonToCustomWidgetFile(String json) async {
    final file = await _customWidgetsFile;
    return file.writeAsString(json);



  }

  Future<String> readJsonFromCustomWidgetsFile() async {
    final file = await _customWidgetsFile;
    return file.readAsString(encoding: utf8);
  }

  Future<File> writeJsonToScreenFile(String json) async {
    final file = await _screenFile;
    return file.writeAsString(json);



  }

  Future<String> readJsonFromScreenFile() async {
    final file = await _screenFile;
    return file.readAsString(encoding: utf8);
  }


  Future<bool> addWidgetToScreen(CustomWidget customWidget, String screen) async {
    String jsonRaw = await readJsonFromCustomWidgetsFile();
    Map<String, dynamic> json = jsonDecode(jsonRaw);
    if(json.isEmpty) {
      return false;
    }

    if(!json.containsKey(screen) ) {
      return false;
    }

    List<dynamic> widgets = json[screen];
    widgets.add(customWidget.toJson());
    json[screen] = widgets;
    writeJsonToCustomWidgetFile(jsonEncode(json));

    return true;
  }

  Future<bool> exitsScreen(String screen) async {
    String screenJsonRaw = await readJsonFromScreenFile();
    Map<String, dynamic> screensJson = jsonDecode(screenJsonRaw);
    if(screensJson.isEmpty || !screensJson.containsKey("screen")) {
      return false;
    }

    return true;
  }


  Future<bool> addScreen(String screenName) async {
    String screen = RandomGen.getRandString(6);

    while(await exitsScreen(screen)) {
      screen = RandomGen.getRandString(6);
    }

    String customWidgetJsonRaw = await readJsonFromCustomWidgetsFile();

    String screenJsonRaw = await readJsonFromScreenFile();
    Map<String, dynamic> customWidgetsJson = jsonDecode(customWidgetJsonRaw);
    Map<String, dynamic> screensJson = jsonDecode(screenJsonRaw);



    customWidgetsJson[screen] = List<dynamic>;
    screensJson[screen] = {
      "screenName": screenName,
      "created": DateTime.now().millisecondsSinceEpoch
    };

    writeJsonToCustomWidgetFile(jsonEncode(customWidgetsJson));
    writeJsonToScreenFile(jsonEncode(screensJson));

    return true;
  }



  Future<Map<String, String>> getScreens() async {
    String jsonRaw = await readJsonFromScreenFile();
    Map<String, dynamic> json = jsonDecode(jsonRaw);
    if(json.isEmpty) {
      return {};
    }
    Map<String, String> screens = {};
    for(String screenC in json.keys) {
      String screen = screenC;
      screens[screen] = json[screen]["screenName"];

    }

    return screens;
  }







}