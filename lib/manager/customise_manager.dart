import 'dart:async';
import 'dart:developer' as developer;

import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_table_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_widget.dart';
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
    //fileManager.writeJSONList(templateKey, templates);

    if (loaded) {
      templatesStreamController.add(templates);
      return;
    }

    List? listRaw = await fileManager.getList(templateKey);
    developer.log("Widgets Raw Loaded $listRaw",
        name: "de.bachmaiers/customise_manager.dart",
        time: DateTime.now(),
        zone: Zone.current);


    if (listRaw == null) {
      loaded = true;
      templatesStreamController.add(templates);
      return;
    }
    templates.addAll(loadTemplate(listRaw));

    loaded = true;
    sort();
    templatesStreamController.add(templates);
  }

  List<CustomWidgetTemplate> loadTemplate(List<dynamic> listRaw) {
    List<CustomWidgetTemplate> templates = [];
    for (Map<String, dynamic> templateRaw in listRaw) {
      String name = templateRaw["name"];
      String id = templateRaw["id"];
      Map<String, dynamic> widgetRaw = templateRaw["widget"];
      String typeRaw = widgetRaw["type"];
      CustomWidgetType type = CustomWidgetType.values
          .firstWhere((element) => element.toString() == typeRaw);
      CustomWidget customWidget;
      switch (type) {
        case CustomWidgetType.simpleSwitch:
          customWidget = CustomSimpleSwitchWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetType.light:
          customWidget = CustomLightWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetType.line:
          customWidget = CustomDivisionLineWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetType.group:
        case CustomWidgetType.alertDialog:
          continue;
        case CustomWidgetType.simpleValue:
          customWidget = CustomSimpleValueWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetType.advanced:
          customWidget = AdvancedCustomWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetType.webView:
          customWidget = CustomWebViewWidget.fromJSON(widgetRaw);
          break;
        case CustomWidgetType.table:
          customWidget = CustomTableWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetType.graph:
          customWidget = GraphWidget.fromJSON(widgetRaw);
          break;
      }

      CustomWidgetTemplate template =
          CustomWidgetTemplate(name: name, customWidget: customWidget, id: id);
      templates.add(template);
    }
    return templates;
  }

  Future<void> reload() async {
    templates.clear();
    List? listRaw = await fileManager.getList(templateKey);

    if (listRaw == null) {
      loaded = true;
      templatesStreamController.add(templates);
      return;
    }
    templates.addAll(loadTemplate(listRaw));

    loaded = true;
    sort();
    templatesStreamController.add(templates);
  }

  void sort() {
    templates.sort((a, b) {
      if (a.customWidget.type == b.customWidget.type) {
        return a.name.compareTo(b.name);
      } else {
        return a.customWidget.type?.index
                .compareTo(b.customWidget.type?.index ?? 0) ??
            0;
      }
    });
  }

  List<CustomWidgetTemplate> getTemplatesByType(CustomWidgetType type) {
    List<CustomWidgetTemplate> tmps = [];
    for (CustomWidgetTemplate t in templates) {
      if (t.customWidget.type == type) {
        tmps.add(t);
      }
    }
    return tmps;
  }

  Future<void> save({required CustomWidgetTemplate template}) async {
    templates.add(template);
    sort();
    templatesStreamController.add(templates);
    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templates.remove(template);
      templatesStreamController.add(templates);
    }


  }

  Future<bool> edit({required CustomWidgetTemplate template}) async {
    sort();
    templatesStreamController.add(templates);

    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templatesStreamController.add(templates);
      return false;
    }

    manager.screenManager.templateEdited(template);


    return true;
  }

  Future<void> removeTemplate(CustomWidgetTemplate template) async {
    templates.remove(template);
    templatesStreamController.add(templates);
    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templates.add(template);
      templatesStreamController.add(templates);
    } else {
      manager.screenManager.templateRemoved(template);
    }

  }
}
