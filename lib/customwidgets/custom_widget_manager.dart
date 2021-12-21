import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';

class CustomWidgetManager {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _screenFile async {
    final path = await _localPath;
    return File('$path/screen.json');
  }


  Future<File> writeJson(String json) async {
    final file = await _screenFile;
    return file.writeAsString(json);



  }

  Future<String> readJson() async {
    final file = await _screenFile;
    return file.readAsString(encoding: utf8);
  }


  Future<bool> addWidgetToScreen(CustomWidget customWidget, int screen) async {
    String jsonRaw = await readJson();
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
    writeJson(jsonEncode(json));

    return true;
  }


  Future<bool> addScreen(int screen) async {
    String jsonRaw = await readJson();
    Map<String, dynamic> json = jsonDecode(jsonRaw);
    if(json.isEmpty) {
      return false;
    }

    if(json.containsKey("Screen $screen") ) {
      return false;
    }

    json["Screen $screen"] = List<dynamic>;

    writeJson(jsonEncode(json));

    return true;
  }



}