import 'dart:async';
import 'dart:developer' as developer;

import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/custom_colorpicker_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/custom_multiselection_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/networkplayer/custom_networkplayer_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/custom_slider_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/repository/screen_repository.dart';
import 'package:smart_home/services/service_container.dart';

class CustomWidgetRepository {
  String templateKey = "templateKey";
  bool loaded = false;
  FileManager fileManager;
  final List<CustomWidgetWrapper> templates = [];
  final StreamController<List<CustomWidgetWrapper>> templatesStreamController =
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
          .firstWhere(
            (element) =>
                element.toString() == typeRaw ||
                element.toString().replaceAll("Deprecated", "") == typeRaw ||
                element.toString().replaceAll(
                      "CustomWidgetTypeDeprecated.",
                      "",
                    ) ==
                    typeRaw,
          );
      //TODO refactor
      dynamic customWidget;
      switch (type) {
        case CustomWidgetTypeDeprecated.graph:
        case CustomWidgetTypeDeprecated.colorPallete:
        case CustomWidgetTypeDeprecated.mediaPlayer:
          customWidget = null;
          break;
        case CustomWidgetTypeDeprecated.line:
          customWidget = CustomDivisionLineWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.group:
        case CustomWidgetTypeDeprecated.alertDialog:
          continue;
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
        case CustomWidgetTypeDeprecated.multiselection:
          customWidget = CustomMultiselectionWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.colorPicker:
          customWidget = CustomColorPickerWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.networkPlayer:
          customWidget = CustomNetworkPlayerWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.slider:
          customWidget = CustomSliderWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.switchWidget:
          customWidget = CustomSwitchWidget.fromJson(widgetRaw);
          break;
        case CustomWidgetTypeDeprecated.divisionLine:
          customWidget = CustomDivisionlineWidget.fromJson(widgetRaw);
          break;
      }
      if (customWidget == null) {
        continue;
      }
      if (customWidget is CustomWidgetDeprecated) {
        CustomWidgetTemplate template = CustomWidgetTemplate(
          name: name,
          customWidget: customWidget,
          id: id,
        );
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
    CustomWidgetTypeDeprecated type,
  ) {
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

    screenManager.templateEdited(template);

    return true;
  }

  Future<void> removeTemplate(CustomWidgetWrapper template) async {
    templates.remove(template);
    templatesStreamController.add(templates);
    if (!await fileManager.writeJSONList(templateKey, templates)) {
      templates.add(template);
      templatesStreamController.add(templates);
    } else {
      screenManager.templateRemoved(template);
    }
  }

  void removeTemplates(List<CustomWidgetWrapper> templatesToRemove) {
    templates.removeWhere((element) => templatesToRemove.contains(element));
    for (CustomWidgetWrapper c in templatesToRemove) {
      screenManager.templateRemoved(c);
    }
    fileManager.writeJSONList(templateKey, templates);
  }

  void copyTemplates(List<CustomWidgetWrapper> templatesToCopy) {
    List<CustomWidgetTemplate> renamedTemplatesDepc = templatesToCopy
        .whereType<CustomWidgetTemplate>()
        .map((e) => e)
        .map(
          (CustomWidgetTemplate e) => CustomWidgetTemplate(
            id: ServiceContainer.randomString(12),
            name: "${e.name}_copy2",
            customWidget: e.customWidget.clone()..name = ("${e.name}_copy"),
          ),
        )
        .toList();
    templates.addAll(renamedTemplatesDepc);

    List<CustomWidget> renamedTemplates = templatesToCopy
        .whereType<CustomWidget>()
        .map((e) => e.clone())
        .toList();
    for (var element in renamedTemplates) {
      element.name = "${element.name}_copy3";
      element.id = ServiceContainer.randomString(12);
    }

    templates.addAll(renamedTemplates);
    sort();

    fileManager.writeJSONList(templateKey, templates);
  }

  void migrate(List<CustomWidgetWrapper> widgets) {
    for (CustomWidgetWrapper w in widgets) {
      if (w.settingWidget.deprecated) {
        CustomWidgetTemplate wD = w as CustomWidgetTemplate;
        templates.removeWhere((c) => c == w);
        templates.add(wD.customWidget.migrate(id: w.id, name: w.name));
      }
    }
    fileManager.writeJSONList(templateKey, templates);
  }
}
