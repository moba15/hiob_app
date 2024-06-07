import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/view/custom_widget_tile.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/view/custom_group_widget_view.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';
import 'package:smart_home/manager/manager.dart';

class CustomGroupWidget extends CustomWidgetDeprecated {
  List<dynamic> templates;
  bool isExtended;
  IconWrapper? iconWrapper;

  CustomGroupWidget(
      {required String? name,
      this.templates = const [],
      this.isExtended = true,
      this.iconWrapper})
      : super(name: name, type: CustomWidgetTypeDeprecated.group, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "isExtended": isExtended,
      "iconWrapper": iconWrapper,
    };
    List<Map<String, dynamic>> widgets = [];
    for (dynamic w in templates) {
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
      Map<String, dynamic> json, List<CustomWidgetWrapper> allTemplates) {
    List<dynamic> templates = [];
    if (json["templates"] != null) {
      for (Map<String, dynamic> templatesRaw in json["templates"] is String
          ? jsonDecode(json["templates"])
          : json["templates"]) {
        if (templatesRaw.containsKey("widget")) {
          if (!allTemplates
              .any((element) => element.id == templatesRaw["id"])) {
            continue; //TODO: Delete From file
          }
          templates.add(allTemplates
              .firstWhere((element) => element.id == templatesRaw["id"]));
        } else if (templatesRaw.containsKey("isExtended")) {
          templates.add(CustomGroupWidget.fromJSON(templatesRaw, allTemplates));
        } else if (templatesRaw["type"] ==
            CustomWidgetTypeDeprecated.line.toString()) {
          templates.add(CustomWidgetTemplate(
              id: Manager.instance.getRandString(12),
              name: "Line",
              customWidget: CustomDivisionLineWidget.fromJson(templatesRaw)));
        } else {
          //!maintain for downward compatibility
          templates.add(CustomWidgetTemplate(
              id: Manager.instance.getRandString(12),
              name: "Line",
              customWidget: CustomDivisionLineWidget.fromJson(templatesRaw)));
          //Is a Line Widget
          //templates.add(CustomDivisionLineWidget.fromJson(templatesRaw));
        }
      }
    }
    //!Support for older versions
    IconWrapper iconWrapper = const IconWrapper();
    if (json["iconID"] != null) {
      iconWrapper = IconWrapper(
          iconDataType: IconDataType.flutterIcons,
          iconData: IconData(int.parse(json["iconID"], radix: 16),
              fontFamily: "MaterialIcons"));
    } else if (json["iconWrapper"] != null) {
      iconWrapper = IconWrapper.fromJSON(json["iconWrapper"]);
    }
    return CustomGroupWidget(
        name: json["name"],
        templates: templates,
        isExtended: json["isExtended"] ?? true,
        iconWrapper: iconWrapper);
  }

  @override
  CustomGroupWidget clone() {
    return CustomGroupWidget(
        name: name,
        templates: List.from(templates),
        isExtended: isExtended,
        iconWrapper: iconWrapper);
  }

  void addTemplates(List<CustomWidgetWrapper> templates) {
    for (CustomWidgetWrapper t in templates) {
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
