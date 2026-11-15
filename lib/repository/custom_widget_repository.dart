import 'dart:async';
import 'dart:developer' as developer;

import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/custom_colorpicker_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/custom_multiselection_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/networkplayer/custom_networkplayer_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/custom_slider_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/repository/screen_repository.dart';
import 'package:smart_home/services/service_container.dart';

class CustomWidgetRepository {
  String templateKey = "templateKey";
  bool loaded = false;
  FileManager fileManager;
  final List<CustomWidget> templates = [];
  final StreamController<List<CustomWidget>> templatesStreamController =
      StreamController.broadcast();
  final ScreenRepository screenManager;

  CustomWidgetRepository({
    required this.fileManager,
    required this.screenManager,
  });
  Future<void> loadTemplates() async {
    //fileManager.writeJSONList(templateKey, templates);

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
    templates.addAll(loadTemplate(listRaw));

    loaded = true;
    sort();
    templatesStreamController.add(templates);
  }

  List<CustomWidget> loadTemplate(List<dynamic> listRaw) {
    List<CustomWidget> templates = [];
    for (Map<String, dynamic> templateRaw in listRaw) {
      //TODO

      String name = templateRaw["name"];
      String id = templateRaw["id"];
      Map<String, dynamic> widgetRaw = templateRaw["widget"] ?? templateRaw;
      if (widgetRaw["type"] == null) {
        continue;
      }
      String typeRaw = widgetRaw["type"];

      if (typeRaw == "line") {
        templates.add(
          CustomDivisionlineWidget(
            id: id,
            name: name,
            thickness: widgetRaw["thickness"] ?? 3,
          ),
        );
        continue;
      }
      //TODO maybe removeable
      if (typeRaw == "graph" ||
          typeRaw == "colorPallete" ||
          typeRaw == "mediaPlayer" ||
          typeRaw == "alertDialog" ||
          typeRaw == "group") {
        continue;
      }

      WidgetType? type;
      for (var element in WidgetType.values) {
        if (element.name == typeRaw ||
            element.toString() == typeRaw ||
            element.toString().replaceAll("CustomWidgetTypeDeprecated.", "") ==
                typeRaw) {
          type = element;
          break;
        }
      }
      if (type == null) {
        continue;
      }

      CustomWidget? customWidget;
      switch (type) {
        case WidgetType.group:
          continue;
        case WidgetType.input:
          customWidget = CustomInputWidget.fromJson(widgetRaw);
          break;
        case WidgetType.button:
          customWidget = CustomButtonWidget.fromJson(widgetRaw);
          break;
        case WidgetType.webViewNew:
          customWidget = CustomWebViewWidget.fromJson(widgetRaw);
          break;
        case WidgetType.tableNew:
          customWidget = CustomTableWidget.fromJson(widgetRaw);
          break;
        case WidgetType.valueNew:
          customWidget = CustomValueWidget.fromJson(widgetRaw);
          break;
        case WidgetType.multiselection:
          customWidget = CustomMultiselectionWidget.fromJson(widgetRaw);
          break;
        case WidgetType.colorPicker:
          customWidget = CustomColorPickerWidget.fromJson(widgetRaw);
          break;
        case WidgetType.networkPlayer:
          customWidget = CustomNetworkPlayerWidget.fromJson(widgetRaw);
          break;
        case WidgetType.slider:
          customWidget = CustomSliderWidget.fromJson(widgetRaw);
          break;
        case WidgetType.switchWidget:
          customWidget = CustomSwitchWidget.fromJson(widgetRaw);
          break;
        case WidgetType.divisionLine:
          customWidget = CustomDivisionlineWidget.fromJson(widgetRaw);
          break;
      }
      if (customWidget != null) {
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

  List<CustomWidget> getTemplatesByType(WidgetType type) {
    List<CustomWidget> tmps = [];
    for (CustomWidget t in templates) {
      if (t.type?.name == type.name) {
        tmps.add(t);
      }
    }
    return tmps;
  }

  Future<void> save({required CustomWidget template}) async {
    //TODO Random generator
    templates.add(template);
    sort();
    templatesStreamController.add(templates);
    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templates.remove(template);
      templatesStreamController.add(templates);
    }
  }

  Future<bool> edit({required CustomWidget template}) async {
    templates.removeWhere((element) => element.id == template.id);
    templates.add(template);
    sort();
    templatesStreamController.add(templates);

    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templatesStreamController.add(templates);
      return false;
    }

    screenManager.templateEdited(template);

    return true;
  }

  Future<void> removeTemplate(CustomWidget template) async {
    templates.remove(template);
    templatesStreamController.add(templates);
    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templates.add(template);
      templatesStreamController.add(templates);
    } else {
      screenManager.templateRemoved(template);
    }
  }

  void removeTemplates(List<CustomWidget> templatesToRemove) {
    templates.removeWhere((element) => templatesToRemove.contains(element));
    for (CustomWidget c in templatesToRemove) {
      screenManager.templateRemoved(c);
    }
    fileManager.writeJSONList(templateKey, templates);
  }

  void copyTemplates(List<CustomWidget> templatesToCopy) {
    throw UnimplementedError("Not implemented yet");
  }
}
