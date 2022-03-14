import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/screen_manager.dart';

class Manager {

  late CustomWidgetManager customWidgetManager;
  late FileManager fileManager;
  late DeviceManager deviceManager;
  late ScreenManager screenManager;

  Future<void> load() async {
    customWidgetManager = CustomWidgetManager();
    final pref = await SharedPreferences.getInstance();
    fileManager = FileManager(pref: pref);
    deviceManager = DeviceManager(fileManager, devicesList: []);
    screenManager = ScreenManager(fileManager: fileManager, screens: []);
    print("load");
  }
}