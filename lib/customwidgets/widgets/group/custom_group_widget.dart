import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/view/custom_group_widget_view.dart';

class CustomGroupWidget extends CustomWidget {
  static const CustomWidgetType TYPE = CustomWidgetType.group;


  List<dynamic> templates;
  bool isExtended;
  String? iconID;

  CustomGroupWidget({required String? name, this.templates = const [], this.isExtended = true, this.iconID}) : super(name: name, type: TYPE, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() => {
    "name":  name,
    "templates": jsonEncode(templates),
    "isExtended": isExtended,
    "iconID": iconID,
  };

  void addTemplate(CustomWidgetTemplate template) {
    templates.add(template);
    //TODO: Update
  }

  factory CustomGroupWidget.fromJSON(Map<String, dynamic> json, List<CustomWidgetTemplate> allTemplates) {
    List<dynamic> templates = [];
    developer.log("Loaded Group: " + json.toString(), name: "de.bachmaiers/custom_group_widget");
    for(Map<String, dynamic> templatesRaw in jsonDecode(json["templates"])) {
      if(templatesRaw.containsKey("widget")) {
        if (!allTemplates.any((element) => element.id == templatesRaw["id"])) {
          continue; //TODO: Delete From file
        }
        templates.add(allTemplates.firstWhere((element) => element.id == templatesRaw["id"]));
      } else {
        //Is a Line Widget
        templates.add(CustomDivisionLineWidget.fromJson(templatesRaw));
      }


    }
    return CustomGroupWidget(name: json["name"], templates: templates, isExtended: json["isExtended"] ?? true, iconID: json["iconID"]);
  }

  CustomGroupWidget clone() {
    return CustomGroupWidget(name: name, templates: List.from(templates), isExtended: isExtended, iconID: iconID);
  }

  void addTemplates(List<CustomWidgetTemplate> templates) {
    if(this.templates.isEmpty) {
      this.templates = [];
    }

    for(CustomWidgetTemplate t in templates) {
      if(!this.templates.contains(t)) {

        this.templates.add(t);
      }
    }
  }

  void addLine(CustomDivisionLineWidget customDivisionLineWidget) {
    templates.add(customDivisionLineWidget);
  }

  void removeTemplate(dynamic template) {
    templates.remove(template);
  }

  void reorder({required int oldIndex, required int newIndex}) {
    dynamic tmp = templates[oldIndex];
    if(newIndex>=templates.length) {
      templates.add(tmp);
    }
    templates.removeAt(oldIndex);
    templates.insert(newIndex, tmp);
    if(newIndex>=templates.length-1) {
      templates.removeLast();
    }


  }

  @override
  Widget get widget => CustomGroupWidgetView(customGroupWidget: this);

}