import 'dart:async';

import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/screen/screen.dart';

class ScreenManager {
  final FileManager fileManager;
  final List<Screen> screens;
  StreamController screenStreamController = StreamController.broadcast();

  ScreenManager({required this.fileManager, required this.screens});

  void loadScreens() async {}

  void addScreen(Screen screen) async {}

  void removeScreen(Screen screen) async {}
}
