import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/screen/screen.dart';

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
    Map<int, String> screens = await getScreens();
    for(int id in screens.keys) {
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


  Future<bool> addWidgetToScreen(CustomWidget customWidget, int screen) async {
    String jsonRaw = await readJsonFromCustomWidgetsFile();
    Map<String, dynamic> json = jsonDecode(jsonRaw);
    if(json.isEmpty) {
      return false;
    }

    if(!json.containsKey("Screen $screen") ) {
      return false;
    }

    List<dynamic> widgets = json["Screen $screen"];
    widgets.add(customWidget.toJson());
    json["Screen $screen"] = widgets;
    writeJsonToCustomWidgetFile(jsonEncode(json));

    return true;
  }


  Future<bool> addScreen(int screen, String screenName) async {
    String customWidgetJsonRaw = await readJsonFromCustomWidgetsFile();
    String screenJsonRaw = await readJsonFromScreenFile();
    Map<String, dynamic> customWidgetsJson = jsonDecode(customWidgetJsonRaw);
    Map<String, dynamic> screensJson = jsonDecode(screenJsonRaw);
    if(customWidgetsJson.isEmpty) {
      return false;
    }

    if(customWidgetsJson.containsKey("Screen $screen") ||screensJson.containsKey("$screen") ) {
      return false;
    }



    customWidgetsJson["Screen $screen"] = List<dynamic>;
    screensJson["$screen"] = {
      "screenName": screenName,
    };

    writeJsonToCustomWidgetFile(jsonEncode(customWidgetsJson));

    return true;
  }

  Future<Map<int, String>> getScreens() async {
    String jsonRaw = await readJsonFromScreenFile();
    Map<String, dynamic> json = jsonDecode(jsonRaw);
    if(json.isEmpty) {
      return {};
    }
    Map<int, String> screens = {};
    for(String screenC in json.keys) {
      int screen = int.fromEnvironment(screenC);
      screens[screen] = json[screen]["screenName"];

    }

    return screens;
  }







}