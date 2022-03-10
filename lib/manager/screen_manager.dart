import 'dart:async';

import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/screen/screen.dart';

class ScreenManager {
  final FileManager fileManager;
  List<Screen> screens;
  final String key = "screens";
  StreamController screenStreamController = StreamController.broadcast();
  bool loaded = false;

  ScreenManager({required this.fileManager, required this.screens});

  Future<List<Screen>> loadScreens() async {
    if (loaded) {
      screenStreamController.add(screens);
      return screens;
    }

    List<dynamic>? l = await fileManager.getList(key);
    if (l == null) {
      screens = [];
    } else {
      for (dynamic rawScreens in l) {
        Map<String, dynamic> rawMap = rawScreens;
      }
    }
    loaded = true;
    screenStreamController.add(screens);

    return screens;
  }

  void addScreen(Screen screen) async {
    screens.add(screen);
    screenStreamController.add(screens);
    bool suc = await fileManager.writeJSONList(key, screens);
    if (!suc) {
      screens.remove(screen);
      screenStreamController.add(screens);
    }
  }

  void removeScreen(Screen screen) async {
    screens.remove(screen);
    screenStreamController.add(screens);
    bool suc = await fileManager.writeJSONList(key, screens);
    if (!suc) {
      screens.add(screen);
      screenStreamController.add(screens);
    }
  }

  void reorderScreen(int screen, int index) async {
    Screen last = screens[screen];
    for (int i = index; i < screens.length; i++) {
      Screen tmp = screens[i];
      screens[i] = last;
      last = tmp;
    }
    screenStreamController.add(screens);
    bool suc = await fileManager.writeJSONList(key, screens);
  }

  void editScreen(
      {required Screen screen,
      required String name,
      required String iconID,
      required int index}) async {
    int z = -1;
    for (int i = 0; i < screens.length; i++) {
      if (screens[i] == screen) {
        z = i;
        screens[i] = Screen(
            id: screen.id,
            name: name,
            iconID: iconID,
            index: index,
            widgetIds: screen.widgetIds);
        break;
      }
    }
    screenStreamController.add(screens);
    bool suc = await fileManager.writeJSONList(key, screens);
    if (!suc) {
      screens[z] = screen;
      screenStreamController.add(screens);
    }
  }
}
