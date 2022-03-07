import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileManager {


  late SharedPreferences pref;

  FileManager() {
    _init();
  }


  void _init() async {
    //pref = await SharedPreferences.getInstance();
  }

  Future<bool> writeJSON(String key, Map<String, dynamic> content) async {
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

  Future<bool?> getBool(String key) async {
    return pref.getBool(key);
  }
  Future<double?> getDouble(String key) async {
    return pref.getDouble(key);
  }

  Future<int?> getInt(String key) async {
    return pref.getInt(key);
  }

  Future<Map<String, dynamic>?> getMap(String key) async {
    return jsonDecode(pref.getString(key)!);

  }



















}