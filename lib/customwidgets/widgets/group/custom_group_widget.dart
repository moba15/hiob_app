import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/view/custom_group_widget_view.dart';

class CustomGroupWidget extends CustomWidget {
  List<dynamic> templates;
  bool isExtended;
  String? iconID;

  CustomGroupWidget(
      {required String? name,
      this.templates = const [],
      this.isExtended = true,
      this.iconID})
      : super(name: name, type: CustomWidgetType.group, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "isExtended": isExtended,
      "iconID": iconID,
    };
    List<Map<String, dynamic>> widgets = [];
    for (dynamic t in templates) {
      if (t is CustomWidgetTemplate) {
        widgets.add({
          "widget": t.name,
          "id": t.id,
        });
      } else if (t is CustomDivisionLineWidget) {
        widgets.add(t.toJson());
      } else if (t is CustomGroupWidget) {
        widgets.add(t.toJson());
      }
    }
    map["templates"] = widgets;
    return map;
  }

  void addTemplate(CustomWidgetTemplate template) {
    templates.add(template);
    //TODO: Update
  }

  void addGroup(CustomGroupWidget customGroupWidget) {
    if (!templates.contains(customGroupWidget)) {
      templates.add(customGroupWidget);
    }
    //TODO Update
  }

  factory CustomGroupWidget.fromJSON(
      Map<String, dynamic> json, List<CustomWidgetTemplate> allTemplates) {
    List<dynamic> templates = [];
    for (Map<String, dynamic> templatesRaw in json["templates"] is String
        ? jsonDecode(json["templates"])
        : json["templates"]) {
      if (templatesRaw.containsKey("widget")) {
        if (!allTemplates.any((element) => element.id == templatesRaw["id"])) {
          continue; //TODO: Delete From file
        }
        templates.add(allTemplates
            .firstWhere((element) => element.id == templatesRaw["id"]));
      } else if (templatesRaw.containsKey("isExtended")) {
        templates.add(CustomGroupWidget.fromJSON(templatesRaw, allTemplates));
      } else {
        //Is a Line Widget
        templates.add(CustomDivisionLineWidget.fromJson(templatesRaw));
      }
    }
    return CustomGroupWidget(
        name: json["name"],
        templates: templates,
        isExtended: json["isExtended"] ?? true,
        iconID: json["iconID"]);
  }

  @override
  CustomGroupWidget clone() {
    return CustomGroupWidget(
        name: name,
        templates: List.from(templates),
        isExtended: isExtended,
        iconID: iconID);
  }

  void addTemplates(List<CustomWidgetTemplate> templates) {
    if (this.templates.isEmpty) {
      this.templates = [];
    }

    for (CustomWidgetTemplate t in templates) {
      if (!this.templates.contains(t)) {
        this.templates.add(t);
      }
    }
  }

  void removeTemplate(dynamic template) {
    templates.remove(template);
  }

  void reorder({required int oldIndex, required int newIndex}) {
    dynamic tmp = templates[oldIndex];
    if (newIndex >= templates.length) {
      templates.add(tmp);
    }
    templates.removeAt(oldIndex);
    templates.insert(newIndex, tmp);
    if (newIndex >= templates.length - 1) {
      templates.removeLast();
    }
  }

  @override
  Widget get widget => CustomGroupWidgetView(customGroupWidget: this);

  void removeTemplateAtIndex(int index) {
    templates.removeAt(index);
  }
}
