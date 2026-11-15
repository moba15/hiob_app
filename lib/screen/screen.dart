import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/repository/custom_widget_repository.dart';
import 'package:smart_home/services/service_container.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';

import '../customwidgets/custom_widget.dart';
import '../repository/screen_repository.dart';

class Screen {
  final String id;
  final String name;
  final IconWrapper iconWrapper;
  final int index;
  bool enabled;
  List<dynamic> widgetTemplates;

  Screen({
    required this.id,
    required this.name,
    required this.iconWrapper,
    required this.index,
    required this.widgetTemplates,
    required this.enabled,
  });

  factory Screen.fromJSON(
    Map<String, dynamic> json, {
    required CustomWidgetRepository customWidgetManager,
  }) {
    List<dynamic> widgetTemplates = [];
    for (Map<String, dynamic> templateRaw
        in json["widgetIds"] is String
            ? jsonDecode(json["widgetIds"])
            : json["widgetIds"]) {
      if (templateRaw.containsKey("widget")) {
        widgetTemplates.add(
          customWidgetManager.templates.firstWhere(
            (element) => element.id == templateRaw["id"],
          ),
        );
      } else if (templateRaw.containsKey("type") &&
          templateRaw["type"] == "divisionLine") {
        widgetTemplates.add(CustomDivisionlineWidget.fromJson(templateRaw));
      } else {
        widgetTemplates.add(
          CustomGroupWidget.fromJSON(
            templateRaw,
            customWidgetManager.templates,
          ),
        );
      }
    }
    //!Support for older versions
    IconWrapper iconWrapper;
    if (json["iconID"] != null) {
      iconWrapper = IconWrapper(
        iconDataType: IconDataType.flutterIcons,
        iconData: IconData(
          int.parse(json["iconID"], radix: 16),
          fontFamily: "MaterialIcons",
        ),
      );
    } else if (json["iconWrapper"] != null) {
      iconWrapper = IconWrapper.fromJSON(json["iconWrapper"]);
    } else {
      iconWrapper = const IconWrapper();
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
      } else if (w is CustomDivisionlineWidget) {
        widgets.add(w.toJson());
      } else if (w is CustomWidget) {
        widgets.add(w.toJson());
      }
    }
    map["widgetIds"] = widgets;

    return map;
  }

  void addWidgetTemplate(
    ScreenRepository screenManager,
    CustomWidget customWidgetTemplate,
  ) async {
    widgetTemplates.add(customWidgetTemplate);
    screenManager.update();
  }

  void addWidgetTemplates(
    ScreenRepository screenManager,
    List<CustomWidget> customWidgetTemplates,
  ) async {
    for (CustomWidget t in customWidgetTemplates) {
      if (!widgetTemplates.contains(t)) {
        widgetTemplates.add(t);
      }
    }
    screenManager.update();
  }

  void directlyAddLine(
    ScreenRepository screenManager,
    CustomDivisionlineWidget line,
  ) {
    widgetTemplates.add(line);
    screenManager.update();
  }

  void addGroup(
    CustomGroupWidget customGroupWidget,
    ScreenRepository screenManager,
  ) {
    if (!widgetTemplates.contains(customGroupWidget)) {
      widgetTemplates.add(customGroupWidget);
    }
    screenManager.update();
  }

  void removeWidgetTemplate(ScreenRepository screenManager, dynamic template) {
    if (template is CustomWidget) {
      widgetTemplates.removeWhere(
        (element) => (element is CustomWidget) && element.id == template.id,
      );
    } else {
      widgetTemplates.removeWhere(
        (element) => (element is CustomGroupWidget) && element == template,
      );
    }
  }

  void removeWidgetTemplateAtIndex(ScreenRepository screenManager, int index) {
    widgetTemplates.removeAt(index);
    screenManager.update();
  }

  void reorderWidgetTemplates({
    required int oldIndex,
    required int newIndex,
    required ScreenRepository screenManager,
  }) {
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

  void onTemplateRemove(CustomWidget customWidgetTemplate) {}

  List<String> getDependentDataPoints() {
    List<String> dataPoints = [];
    List<CustomWidget> customWidgtes = widgetTemplates
        .whereType<CustomWidget>()
        .map((t) => t)
        .toList();
    for (CustomWidget c in customWidgtes) {
      dataPoints.addAll(c.dependentDataPoints);
    }

    return dataPoints;
  }

  Screen clone() {
    return Screen(
      id: id,
      name: name,
      iconWrapper: iconWrapper,
      index: index,
      widgetTemplates: List.of(widgetTemplates),
      enabled: enabled,
    );
  }
}
