import 'dart:async';
import 'dart:developer' as developer;

import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/screen/screen.dart';

class ScreenManager {
  final FileManager fileManager;
  final Manager manager;
  List<Screen> screens;
  final String key = "screens";
  StreamController screenStreamController = StreamController.broadcast();
  bool loaded = false;

  ScreenManager(
      {required this.fileManager,
      required this.screens,
      required this.manager});

  Future<List<Screen>> loadScreens() async {
    //await fileManager.writeJSONList(key, screens);
    if (loaded) {
      screenStreamController.add(screens);
      loaded = true;
      return screens;
    }

    await manager.customWidgetManager.loadTemplates();

    List<dynamic>? l = await fileManager.getList(key);

    developer.log("Screens Raw Loaded $l",
        name: "de.bachmaiers/screen_manager.dart",
        time: DateTime.now(),
        zone: Zone.current);
    if (l == null) {
      screens = [];
    } else {
      for (dynamic rawScreens in l) {
        Map<String, dynamic> rawMap = rawScreens;
        Screen s = Screen.fromJSON(rawMap);
        screens.add(s);
      }
    }
    loaded = true;
    if (screens.isEmpty) {
      screens.add(Screen(
          id: Manager.instance.getRandString(15),
          name: "Template",
          iconID: "ee98",
          index: 1,
          widgetTemplates: [],
          enabled: true));
    }
    screenStreamController.add(screens);

    return screens;
  }

  void reload() async {
    screens.clear();
    await manager.customWidgetManager.reload();

    List<dynamic>? l = await fileManager.getList(key);

    if (l == null) {
      screens = [];
    } else {
      for (dynamic rawScreens in l) {
        Map<String, dynamic> rawMap = rawScreens;
        Screen s = Screen.fromJSON(rawMap);
        screens.add(s);
      }
    }
    loaded = true;
    if (screens.isEmpty) {
      screens.add(Screen(
          id: "testID11&",
          name: "Template",
          iconID: "ee98",
          index: 1,
          widgetTemplates: [],
          enabled: true));
    }
    screenStreamController.add(screens);
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
    if (screens.isEmpty) {
      screens.add(Screen(
          id: "testID11&",
          name: "Template",
          iconID: "ee98",
          index: 1,
          widgetTemplates: [],
          enabled: true));
    }
    screenStreamController.add(screens);
    bool suc = await fileManager.writeJSONList(key, screens);
    if (!suc) {
      screens.add(screen);
      screenStreamController.add(screens);
    }
  }

  void reorderScreen({required int oldIndex, required int newIndex}) async {
    Screen tmp = screens[oldIndex];
    screens.removeAt(oldIndex);
    screens.add(tmp);
    screens.insert(newIndex, tmp);
    screens.removeLast();
    screenStreamController.add(screens);
    bool suc = await fileManager.writeJSONList(key, screens);
    if (!suc) {
      screens.removeAt(newIndex);
      screens.insert(oldIndex, tmp);
      screenStreamController.add(screens);
    }
  }

  void editScreen(
      {required Screen screen,
      required String name,
      required String iconID,
      required int index,
      required bool enabled}) async {
    int z = -1;
    for (int i = 0; i < screens.length; i++) {
      if (screens[i] == screen) {
        z = i;
        screens[i] = Screen(
            id: screen.id,
            name: name,
            iconID: iconID,
            index: index,
            widgetTemplates: screen.widgetTemplates,
            enabled: enabled);
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

  void update() async {
    bool suc = await fileManager.writeJSONList(key, screens);
    if (suc) {
      screenStreamController.add(screens);
    }
  }

  void templateRemoved(CustomWidgetTemplate template) async {
    for (Screen s in screens) {
      s.widgetTemplates.removeWhere((element) => template == element);
      for (dynamic temp in s.widgetTemplates) {
        if (temp is CustomGroupWidget) {
          temp.templates.removeWhere((element) => element == template);
        }
      }
    }
    await fileManager.writeJSONList(key, screens);
    screenStreamController.add(screens);
  }

  void templateEdited(CustomWidgetTemplate template) {
    screenStreamController.add(screens);
  }
}
