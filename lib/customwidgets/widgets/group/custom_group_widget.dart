import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/group/view/custom_group_widget_view.dart';

class CustomGroupWidget extends CustomWidget {
  static const CustomWidgetType TYPE = CustomWidgetType.group;


  List<CustomWidgetTemplate> templates;
  CustomGroupWidget({required String? name, this.templates = const []}) : super(name: name, type: TYPE, settings: {});

  @override
  CustomWidgetSettingWidget get settingWidget => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() => {
    "name":  name,
    "templates": jsonEncode(templates),
  };

  void addTemplate(CustomWidgetTemplate template) {
    templates.add(template);
    //TODO: Update
  }

  factory CustomGroupWidget.fromJSON(Map<String, dynamic> json, List<CustomWidgetTemplate> allTemplates) {
    List<CustomWidgetTemplate> templates = [];
    for(Map<String, dynamic> templatesRaw in jsonDecode(json["templates"])) {
      templates.add(allTemplates.firstWhere((element) => element.id == templatesRaw["id"]));
    }
    return CustomGroupWidget(name: json["name"], templates: templates);
  }

  CustomGroupWidget clone() {
    return CustomGroupWidget(name: name, templates: List.from(templates));
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

  void removeTemplate(CustomWidgetTemplate template) {
    templates.remove(template);
  }

  void reorder({required int oldIndex, required int newIndex}) {
    CustomWidgetTemplate tmp = templates[oldIndex];
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