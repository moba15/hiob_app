import 'dart:async';
import 'dart:convert';

import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';

import '../manager/screen_manager.dart';

class Screen {
  final String id;
  final String name;
  final String iconID;
  final int index;
  List<dynamic> widgetTemplates;
  StreamController<String> widgetListStreamController =
      StreamController.broadcast();

  Screen(
      {required this.id,
      required this.name,
      required this.iconID,
      required this.index,
      required this.widgetTemplates});

  factory Screen.fromJSON(Map<String, dynamic> json) => Screen(
        id: json["id"],
        iconID: json["iconID"],
        name: json["name"],
        index: json["index"],
        widgetTemplates: jsonDecode(json["widgetIds"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconID": iconID,
        "index": index,
        "widgetIds": jsonEncode(widgetTemplates),
      };

  void addWidgetTemplate(ScreenManager screenManager,
      CustomWidgetTemplate customWidgetTemplate) async {
    widgetTemplates.add(customWidgetTemplate.id);
    screenManager.update();
  }

  void addWidgetTemplates(ScreenManager screenManager,
      List<CustomWidgetTemplate> customWidgetTemplates) async {
    for (CustomWidgetTemplate t in customWidgetTemplates) {
      widgetTemplates.add(t.id);
    }
    screenManager.update();
  }

  void removeWidgetTemplate(
      ScreenManager screenManager, CustomWidgetTemplate customWidgetTemplate) {
    widgetTemplates
        .removeWhere((element) => element == customWidgetTemplate.id);
    screenManager.update();
  }
}