import 'dart:async';

import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_text_widget.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';

class CustomWidgetManager {
  String templateKey = "templateKey";
  bool loaded = false;
  FileManager fileManager;
  DeviceManager deviceManager;
  Manager manager;
  final List<CustomWidgetTemplate> templates = [];
  final StreamController<List<CustomWidgetTemplate>> templatesStreamController =
      StreamController.broadcast();

  CustomWidgetManager(
      {required this.fileManager,
      required this.deviceManager,
      required this.manager});

  Future<void> loadTemplates() async {

    if (loaded) {
      templatesStreamController.add(templates);
      return;
    }

    List? listRaw = await fileManager.getList(templateKey);

    if (listRaw == null) {
      loaded = true;
      templatesStreamController.add(templates);
      return;
    }
    for (Map<String, dynamic> templateRaw in listRaw) {
      String name = templateRaw["name"];
      String id = templateRaw["id"];
      Map<String, dynamic> widgetRaw = templateRaw["widget"];
      String typeRaw = widgetRaw["type"];
      CustomWidgetType type = CustomWidgetType.values
          .firstWhere((element) => element.toString() == typeRaw);
      CustomWidget customWidget;
      switch (type) {
        case CustomWidgetType.text:
          customWidget = CustomTextWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetType.simpleSwitch:
          customWidget = CustomSimpleSwitchWidget.fromJson(widgetRaw);
          break;
      }

      CustomWidgetTemplate template =
          CustomWidgetTemplate(name: name, customWidget: customWidget, id: id);
      templates.add(template);
    }

    loaded = true;
    templatesStreamController.add(templates);
  }

  Future<void> save(CustomWidgetTemplate customWidget) async {
    templates.add(customWidget);
    templatesStreamController.add(templates);
    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templates.remove(customWidget);
      templatesStreamController.add(templates);
    }
  }
}