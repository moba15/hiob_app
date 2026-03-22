import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home/services/logging/logging_service.dart';

class FileManager {
  SharedPreferences pref;
  bool isLoaded = false;
  final LoggingService loggingService;

  FileManager({required this.pref, required this.loggingService}) {
    _createBackup();
  }

  void _createBackup() {
    for (String key in pref.getKeys()) {
      if (pref.containsKey("${key}_backup")) {
        if (key.contains("backup")) {
          continue;
        }
      }
    }
  }

  Future<void> reload() async {
    await pref.reload();
  }

  Future<bool> writeJSON(String key, Map<String, dynamic> content) async {
    return await pref.setString(key, jsonEncode(content));
  }

  Future<bool> writeJSONList(String key, List<dynamic> content) async {
    return await pref.setString(key, jsonEncode(content));
  }

  Future<bool> writeString(String key, String content) async {
    return await pref.setString(key, content);
  }

  Future<bool> writeInt(String key, int content) async {
    return await pref.setInt(key, content);
  }

  Future<bool> writeBool(String key, bool content) async {
    return await pref.setBool(key, content);
  }

  Future<bool> writeDouble(String key, double content) async {
    return await pref.setDouble(key, content);
  }

  Future<bool> containsKey(String key) async {
    return pref.containsKey(key);
  }

  Future<String?> getString(String key) async {
    return pref.getString(key);
  }

  Future<int?> getInt(String key) async {
    return pref.getInt(key);
  }

  Future<Map<String, dynamic>?> getMap(String key) async {
    if (pref.getString(key) != null) {
      loggingService.verbose(
        "FileManager | getMap $key:${pref.getString(key)}",
      );
      try {
        Map<String, dynamic>? m = jsonDecode(pref.getString(key)!);
        return m;
      } catch (e) {
        loggingService.error(
          "FileManager | getMap error during decode: $e for key $key",
          e,
        );
        return null;
      }
    }
    loggingService.debug("FileManager | getMap key $key does not exists");
    return null;
  }

  Future<List<dynamic>?> getList(String key) async {
    if (pref.containsKey(key)) {
      loggingService.verbose(
        "FileManager | getList $key:${pref.getString(key)}",
      );
      try {
        List<dynamic> l = jsonDecode(pref.getString(key)!);
        return l;
      } catch (e) {
        loggingService.error(
          "FileManager | getList error during decode: $e for key $key",
          e,
        );
        return null;
      }
    } else {
      loggingService.debug("FileManager | getList key $key does not exists");
      return null;
    }
  }

  void export(BuildContext context) async {
    /*String? result = await FilePicker.platform.getDirectoryPath(
      dialogTitle: 'Please select an output file:',
      initialDirectory: "Download",
    );
    if (result == null) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Exporting...")));
    try {
      File myFile = File(
        "$result/exportHioB${DateFormat("y_M_d_mm_ss_a").format(DateTime.now())}.json",
      );
      Map<String, dynamic> data = {
        "widgets": jsonEncode(manager.customWidgetManager.templates),
        "screens": jsonEncode(manager.screenManager.screens),
      };
      String t = jsonEncode(data);
      await myFile.writeAsString(t, mode: FileMode.write);
    } on Exception catch (e) {
      dev.log(e.toString(), name: "error exporting");
      if (Manager.navigatorKey.currentContext != null) {
        ScaffoldMessenger.of(
          Manager.navigatorKey.currentContext!,
        ).showSnackBar(const SnackBar(content: Text("Error exporting!")));
        showDialog(
          context: Manager.navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error details:"),
              content: Column(
                children: [
                  const Text(
                    "Please try to export into the Download folder",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(height: 5),
                  Text(e.toString(), style: const TextStyle(fontSize: 12)),
                ],
              ),
              scrollable: true,
            );
          },
        );
      }

      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Export Successful")));*/
    throw UnimplementedError("Not supported anymore");
  }

  void import(BuildContext context) async {
    //TODO: Add IOS Support

    /*   FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        allowedExtensions: ["json"],
        type: FileType.custom,
        dialogTitle: "Dialog",
        withData: true,
      );
    } catch (e) {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        dialogTitle: "Dialog",
        withData: true,
      );
    }
    _import(result, context);
  }

  void _import(FilePickerResult? result, BuildContext context) {
    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Select File to import!"),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      if (result.files.first.extension != "json") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a valid file format")),
        );
        return;
      }
      try {
        Uint8List fileBytes = result.files.first.bytes!;
        String t = String.fromCharCodes(fileBytes.toList());
        t = utf8.decode(fileBytes.toList());
        Map<String, dynamic> map = jsonDecode(t);
        pref.setString(manager.customWidgetManager.templateKey, map["widgets"]);
        pref.setString(manager.screenManager.key, map["screens"]);
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error importing! $e")));
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error details:"),
              content: Row(
                children: [
                  const Text(
                    "Please use the Download folder to import a file",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(e.toString(), style: const TextStyle(fontSize: 12)),
                ],
              ),
              scrollable: true,
            );
          },
        );
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Import Successful")));
    }*/
    throw UnimplementedError("Not supported anymore");
  }
}
