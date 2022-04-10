import 'dart:convert';

import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/manager/manager.dart';

import '../manager/screen_manager.dart';

class Screen {
  final String id;
  final String name;
  final String iconID;
  final int index;
  List<dynamic> widgetTemplates;

  Screen(
      {required this.id,
      required this.name,
      required this.iconID,
      required this.index,
      required this.widgetTemplates});

  factory Screen.fromJSON(Map<String, dynamic> json) {
    List<dynamic> widgetTemplates = [];
    for(Map<String, dynamic> templateRaw in jsonDecode(json["widgetIds"])) {
      if(templateRaw.containsKey("widget")) {
        print("templateRaw " + templateRaw.toString());
        for(CustomWidgetTemplate t in Manager.instance!.customWidgetManager.templates) {
          print(t.id);
        }
        widgetTemplates.add(Manager.instance?.customWidgetManager.templates.firstWhere((element) => element.id == templateRaw["id"]));
      } else {
        widgetTemplates.add(CustomGroupWidget.fromJSON(templateRaw, Manager.instance!.customWidgetManager.templates ));
      }
    }
    return Screen(
      id: json["id"],
      iconID: json["iconID"],
      name: json["name"],
      index: json["index"],
      widgetTemplates: widgetTemplates,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconID": iconID,
        "index": index,
        "widgetIds": jsonEncode(widgetTemplates),
      };

  void addWidgetTemplate(ScreenManager screenManager, CustomWidgetTemplate customWidgetTemplate) async {
    widgetTemplates.add(customWidgetTemplate);
    screenManager.update();
  }

  void addWidgetTemplates(ScreenManager screenManager, List<CustomWidgetTemplate> customWidgetTemplates) async {
    for (CustomWidgetTemplate t in customWidgetTemplates) {
      if(!widgetTemplates.contains(t)) {
        widgetTemplates.add(t);
      }
    }
    screenManager.update();
  }

  void addGroup(CustomGroupWidget customGroupWidget, ScreenManager screenManager) {
    if(!widgetTemplates.contains(customGroupWidget)) {
      widgetTemplates.add(customGroupWidget);
    }
    screenManager.update();
  }



  void removeWidgetTemplate(ScreenManager screenManager, dynamic template) {
    if(template is CustomWidgetTemplate) {
      widgetTemplates
        .removeWhere((element) => (element is CustomWidgetTemplate)  && element.id == template.id);
    } else {
      widgetTemplates
          .removeWhere((element) => (element is CustomGroupWidget)  && element == template);
    }
    screenManager.update();
  }

  void reorderWidgetTemplates({required int oldIndex, required int newIndex, required ScreenManager screenManager}) {
    dynamic widget = widgetTemplates[oldIndex];
    if(widgetTemplates.length <=newIndex) {
      widgetTemplates.add(widget);
    }

    widgetTemplates.insert(newIndex, widget);
    widgetTemplates.removeAt(oldIndex+1);
    if(widgetTemplates.length <=newIndex) {
      widgetTemplates.removeLast();
    }
    screenManager.update();
  }

  void onTemplateRemove(CustomWidgetTemplate customWidgetTemplate) {

  }
}