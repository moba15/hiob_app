import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/screens/settings/view/loading_screen.dart';

class Manager {

  late CustomWidgetManager customWidgetManager;
  late FileManager fileManager;
  late DeviceManager deviceManager;

  Manager() {
    customWidgetManager =  CustomWidgetManager();
    fileManager = FileManager();
    deviceManager = DeviceManager(fileManager, devicesList: []);




  }








}