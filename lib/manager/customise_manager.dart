import 'dart:async';
import 'dart:developer' as developer;

import 'package:smart_home/customwidgets/custom_color_palette_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_media_player_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart'
    as depc_value;
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_table_widget.dart'
    as depc_table;
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart'
    as depc_web_view;
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';
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
  final List<CustomWidgetWrapper> templates = [];
  final StreamController<List<CustomWidgetWrapper>> templatesStreamController =
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

  List<CustomWidgetWrapper> loadTemplate(List<dynamic> listRaw) {
    List<CustomWidgetWrapper> templates = [];
    for (Map<String, dynamic> templateRaw in listRaw) {
      //TODO

      String name = templateRaw["name"];
      String id = templateRaw["id"];
      Map<String, dynamic> widgetRaw = templateRaw["widget"] ?? templateRaw;
      if (widgetRaw["type"] == null) {
        continue;
      }
      String typeRaw = widgetRaw["type"];
      CustomWidgetTypeDeprecated type = CustomWidgetTypeDeprecated.values
          .firstWhere((element) =>
              element.toString() == typeRaw ||
              element.toString().replaceAll("Deprecated", "") == typeRaw ||
              element
                      .toString()
                      .replaceAll("CustomWidgetTypeDeprecated.", "") ==
                  typeRaw);
      //TODO refactor
      dynamic customWidget;
      switch (type) {
        case CustomWidgetTypeDeprecated.simpleSwitch:
          customWidget = CustomSimpleSwitchWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.light:
          customWidget = CustomLightWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.line:
          customWidget = CustomDivisionLineWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.group:
        case CustomWidgetTypeDeprecated.alertDialog:
          continue;
        case CustomWidgetTypeDeprecated.simpleValue:
          customWidget = depc_value.CustomSimpleValueWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.advanced:
          customWidget = AdvancedCustomWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.webView:
          customWidget = depc_web_view.CustomWebViewWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.table:
          customWidget = depc_table.CustomTableWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.graph:
          customWidget = GraphWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.colorPallete:
          customWidget = CustomColorPaletteWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.mediaPlayer:
          customWidget = CustomMediaPlayerWidget.fromJSON(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.input:
          customWidget = CustomInputWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.button:
          customWidget = CustomButtonWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.webViewNew:
          customWidget = CustomWebViewWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.tableNew:
          customWidget = CustomTableWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.valueNew:
          customWidget = CustomValueWidget.fromJson(widgetRaw);
          break;
        default:
          throw UnimplementedError();
      }
      if (customWidget is CustomWidgetDeprecated) {
        CustomWidgetTemplate template = CustomWidgetTemplate(
            name: name, customWidget: customWidget, id: id);
        templates.add(template);
      } else if (customWidget is CustomWidget) {
        templates.add(customWidget);
      }
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
      if (a.type == b.type) {
        return a.name.compareTo(b.name);
      } else {
        return a.type?.index.compareTo(b.type?.index ?? 0) ?? 0;
      }
    });
  }

  List<CustomWidgetWrapper> getTemplatesByType(
      CustomWidgetTypeDeprecated type) {
    List<CustomWidgetWrapper> tmps = [];
    for (CustomWidgetWrapper t in templates) {
      if (t.type?.name == type.name) {
        tmps.add(t);
      }
    }
    return tmps;
  }

  Future<void> save({required CustomWidgetWrapper template}) async {
    //TODO Random generator
    templates.add(template);
    sort();
    templatesStreamController.add(templates);
    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templates.remove(template);
      templatesStreamController.add(templates);
    }
  }

  Future<bool> edit({required CustomWidgetWrapper template}) async {
    templates.removeWhere((element) => element.id == template.id);
    templates.add(template);
    sort();
    templatesStreamController.add(templates);

    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templatesStreamController.add(templates);
      return false;
    }

    manager.screenManager.templateEdited(template);

    return true;
  }

  Future<void> removeTemplate(CustomWidgetWrapper template) async {
    templates.remove(template);
    templatesStreamController.add(templates);
    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templates.add(template);
      templatesStreamController.add(templates);
    } else {
      manager.screenManager.templateRemoved(template);
    }
  }

  void removeTemplates(List<CustomWidgetWrapper> templatesToRemove) {
    templates.removeWhere((element) => templatesToRemove.contains(element));
    for (CustomWidgetWrapper c in templatesToRemove) {
      manager.screenManager.templateRemoved(c);
    }
    fileManager.writeJSONList(templateKey, templates);
  }

  void copyTemplates(List<CustomWidgetWrapper> templatesToCopy) {
    List<CustomWidgetWrapper> renamedTemplates = templatesToCopy
        .whereType<CustomWidgetTemplate>()
        .map((e) => e)
        .map((CustomWidgetTemplate e) => CustomWidgetTemplate(
            id: Manager.instance.getRandString(12),
            name: "${e.name}_copy",
            customWidget: e.customWidget.clone()..name = ("${e.name}_copy")))
        .toList();
    templates.addAll(renamedTemplates);
    sort();

    fileManager.writeJSONList(templateKey, templates);
  }
}
