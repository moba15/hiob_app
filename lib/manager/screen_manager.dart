import 'dart:async';

import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/screen/screen.dart';

class ScreenManager {
  final FileManager fileManager;
  final List<Screen> screens;
  StreamController screenStreamController = StreamController.broadcast();
  bool loaded = false;

  ScreenManager({required this.fileManager, required this.screens});

  Future<void> loadScreens() async {
    if(loaded) {
      screenStreamController.add(screens);
      return;
    }
    screens.add(Screen(id: "id", name: "Name", iconID: "124", widgetIds: [],index: 1));
    screens.add(Screen(id: "id", name: "Name", iconID: "124", widgetIds: [],index: 2));
    screens.add(Screen(id: "id", name: "Name", iconID: "124", widgetIds: [],index: 3));
    screens.add(Screen(id: "id", name: "Name", iconID: "124", widgetIds: [],index: 4));

    screenStreamController.add(screens);
    loaded = true;

  }

  void addScreen(Screen screen) async {
    screens.add(screen);
    screenStreamController.add(screens);
  }

  void removeScreen(Screen screen) async {}

  void reorderScreen(int screen, int index) {
    Screen last = screens[screen];
    for(int i = index; i<screens.length; i++) {
      Screen tmp = screens[i];
      screens[i] = last;
      last = tmp;
    }
    screens.add(last);
    screenStreamController.add(screens);
  }
}
