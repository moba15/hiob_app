import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';

import '../customwidgets/custom_widget.dart';
import '../manager/screen_manager.dart';

class Screen {
  final String id;
  final String name;
  final IconWrapper iconWrapper;
  final int index;
  final bool enabled;
  List<dynamic> widgetTemplates;

  Screen(
      {required this.id,
      required this.name,
      required this.iconWrapper,
      required this.index,
      required this.widgetTemplates,
      required this.enabled});

  factory Screen.fromJSON(Map<String, dynamic> json) {
    List<dynamic> widgetTemplates = [];
    for (Map<String, dynamic> templateRaw in json["widgetIds"] is String
        ? jsonDecode(json["widgetIds"])
        : json["widgetIds"]) {
      if (templateRaw.containsKey("widget")) {
        if (!Manager.instance.customWidgetManager.templates
            .any((element) => element.id == templateRaw["id"])) {
          continue;
        }
        widgetTemplates.add(Manager.instance.customWidgetManager.templates
            .firstWhere((element) => element.id == templateRaw["id"]));
      } else {
        if (templateRaw["type"] == CustomWidgetType.line.toString()) {
          widgetTemplates.add(CustomWidgetTemplate(
              id: Manager.instance.getRandString(12),
              name: "Line",
              customWidget: CustomDivisionLineWidget.fromJson(templateRaw)));
        } else {
          widgetTemplates.add(CustomGroupWidget.fromJSON(
              templateRaw, Manager.instance.customWidgetManager.templates));
        }
      }
    }
    IconWrapper iconWrapper;
    if (json["iconID"]) {
      iconWrapper = IconWrapper(
          iconDataType: IconDataType.flutterIcons,
          iconData: IconData(int.parse(json["iconID"], radix: 16),
              fontFamily: "MaterialIcons"));
    } else if (json["iconWrapper"]) {
      iconWrapper = IconWrapper.fromJSON(json["iconWrapper"]);
    } else {
      iconWrapper = IconWrapper(
          iconDataType: IconDataType.flutterIcons,
          iconData: Icons.question_answer);
    }
    return Screen(
      id: json["id"],
      iconWrapper: iconWrapper,
      name: json["name"],
      index: json["index"],
      widgetTemplates: widgetTemplates,
      enabled: json["enabled"] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "iconWrapper": iconWrapper,
      "index": index,
      "enabled": enabled,
    };
    List<Map<String, dynamic>> widgets = [];
    for (dynamic w in widgetTemplates) {
      if (w is CustomGroupWidget) {
        widgets.add(w.toJson());
      } else if (w is CustomWidgetTemplate &&
          w.customWidget is CustomDivisionLineWidget) {
        widgets.add(w.customWidget.toJson());
      } else if (w is CustomWidgetTemplate) {
        widgets.add({
          "widget": w.name,
          "id": w.id,
        });
      }
    }
    map["widgetIds"] = widgets;

    return map;
  }

  void addWidgetTemplate(ScreenManager screenManager,
      CustomWidgetTemplate customWidgetTemplate) async {
    widgetTemplates.add(customWidgetTemplate);
    screenManager.update();
  }

  void addWidgetTemplates(ScreenManager screenManager,
      List<CustomWidgetTemplate> customWidgetTemplates) async {
    for (CustomWidgetTemplate t in customWidgetTemplates) {
      if (!widgetTemplates.contains(t)) {
        widgetTemplates.add(t);
      }
    }
    screenManager.update();
  }

  void addGroup(
      CustomGroupWidget customGroupWidget, ScreenManager screenManager) {
    if (!widgetTemplates.contains(customGroupWidget)) {
      widgetTemplates.add(customGroupWidget);
    }
    screenManager.update();
  }

  void removeWidgetTemplate(ScreenManager screenManager, dynamic template) {
    if (template is CustomWidgetTemplate) {
      widgetTemplates.removeWhere((element) =>
          (element is CustomWidgetTemplate) && element.id == template.id);
    } else {
      widgetTemplates.removeWhere(
          (element) => (element is CustomGroupWidget) && element == template);
    }
  }

  void reorderWidgetTemplates(
      {required int oldIndex,
      required int newIndex,
      required ScreenManager screenManager}) {
    dynamic widget = widgetTemplates[oldIndex];
    int length = widgetTemplates.length;

    if (length <= newIndex) {
      widgetTemplates.add(widget);
    }
    widgetTemplates.insert(newIndex, widget);
    if (newIndex <= oldIndex) {
      widgetTemplates.removeAt(oldIndex + 1);
    } else {
      widgetTemplates.removeAt(oldIndex);
    }

    if (length <= newIndex) {
      widgetTemplates.removeLast();
    }
    screenManager.update();
  }

  void onTemplateRemove(CustomWidgetTemplate customWidgetTemplate) {}

  Screen clone() {
    return Screen(
        id: id,
        name: name,
        iconWrapper: iconWrapper,
        index: index,
        widgetTemplates: List.of(widgetTemplates),
        enabled: enabled);
  }
}
