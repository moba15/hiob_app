import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/view/custom_group_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/group/view/settings/custom_group_widget_settings.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/services/service_container.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';

class CustomGroupWidget extends CustomWidget {
  List<dynamic> templates;
  bool isExtended;
  IconWrapper? iconWrapper;

  CustomGroupWidget({
    String? id,
    required super.name,
    this.templates = const [],
    this.isExtended = true,
    this.iconWrapper,
  }) : super(
          type: CustomWidgetTypeDeprecated.group,
          id: id ?? ServiceContainer.randomString(12),
          isAbleToPopupMenu: false,
          hasCustomTheme: false,
          customPopupmenu: null,
          customTheme: null,
        );

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomGroupWidgetSettings(customGroupWidget: this);

  @override
  Widget get widget => CustomGroupWidgetView(customGroupWidget: this);

  @override
  List<String> get dependentDataPoints {
    List<String> dps = [];
    for (dynamic t in templates) {
      if (t is CustomWidget) {
        dps.addAll(t.dependentDataPoints);
      } else if (t is CustomWidgetTemplate) {
        dps.addAll(t.customWidget.dependentDataPoints);
      }
    }
    return dps;
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "id": id,
      "name": name,
      "isExtended": isExtended,
      "iconWrapper": iconWrapper,
    };
    List<Map<String, dynamic>> widgets = [];
    for (dynamic w in templates) {
      if (w is CustomGroupWidget) {
        widgets.add(w.toJson());
      } else if (w is CustomDivisionlineWidget) {
        widgets.add(w.toJson());
      } else if (w is CustomWidgetWrapper) {
        widgets.add({"widget": w.name, "id": w.id});
      }
    }
    map["templates"] = widgets;
    return map;
  }

  void addTemplate(CustomWidgetTemplate template) {
    templates.add(template);
  }

  void addGroup(CustomGroupWidget customGroupWidget) {
    if (!templates.contains(customGroupWidget)) {
      templates.add(customGroupWidget);
    }
  }

  void addLine(CustomDivisionlineWidget line) {
    templates.add(line);
  }

  factory CustomGroupWidget.fromJSON(
    Map<String, dynamic> json,
    List<CustomWidgetWrapper> allTemplates,
  ) {
    List<dynamic> templates = [];
    if (json["templates"] != null) {
      for (Map<String, dynamic> templatesRaw
          in json["templates"] is String
              ? jsonDecode(json["templates"])
              : json["templates"]) {
        if (templatesRaw.containsKey("widget")) {
          if (!allTemplates.any(
            (element) => element.id == templatesRaw["id"],
          )) {
            continue; //TODO: Delete From file
          }
          templates.add(
            allTemplates.firstWhere(
              (element) => element.id == templatesRaw["id"],
            ),
          );
        } else if (templatesRaw.containsKey("isExtended")) {
          templates.add(CustomGroupWidget.fromJSON(templatesRaw, allTemplates));
        } else if (templatesRaw.containsKey("type") &&
            templatesRaw["type"] == "divisionLine") {
          templates.add(CustomDivisionlineWidget.fromJson(templatesRaw));
        }
      }
    }
    //!Support for older versions
    IconWrapper iconWrapper = const IconWrapper();
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
    }
    return CustomGroupWidget(
      id: json["id"] ?? ServiceContainer.randomString(12),
      name: json["name"],
      templates: templates,
      isExtended: json["isExtended"] ?? true,
      iconWrapper: iconWrapper,
    );
  }

  @override
  CustomGroupWidget clone() {
    return CustomGroupWidget(
      id: ServiceContainer.randomString(12),
      name: name,
      templates: List.from(templates),
      isExtended: isExtended,
      iconWrapper: iconWrapper,
    );
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

  void removeTemplateAtIndex(int index) {
    templates.removeAt(index);
  }
}
