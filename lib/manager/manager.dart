import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/screens/loading_screen.dart';

class Manager {

  late CustomWidgetManager _customWidgetManager;

  Manager() {
    _customWidgetManager =  CustomWidgetManager();


    load();



  }

  void load() async {
    await  _customWidgetManager.load();
  }






}