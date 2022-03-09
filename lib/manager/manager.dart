import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/screen_manager.dart';

class Manager {

  late CustomWidgetManager customWidgetManager;
  late FileManager fileManager;
  late DeviceManager deviceManager;
  late ScreenManager screenManager;

  Manager() {
    customWidgetManager =  CustomWidgetManager();
    fileManager = FileManager();
    deviceManager = DeviceManager(fileManager, devicesList: []);
    screenManager = ScreenManager(fileManager: fileManager, screens: []);




  }








}