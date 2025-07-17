import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_color_palette_widget.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/theme/custom_button_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/custom_colorpicker_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/theme/custom_colorpicker_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/theme/custom_input_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/custom_multiselection_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/theme/custom_multiselection_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/custom_slider_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/theme/custom_slider_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/theme/custom_switch_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_theme/custom_value_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_alert_dialog_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_media_player_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_table_widget.dart'
    as depc_table;
import 'package:smart_home/customwidgets/customwidgets_rework/networkplayer/custom_networkplayer_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart'
    as depc;
import 'package:smart_home/customwidgets/widgets/graphs/graph_widget.dart';

enum CustomWidgetTypeDeprecated {
  simpleSwitch,
  simpleValue,
  advanced,
  light,
  group,
  line,
  webView,
  alertDialog,
  table,
  graph,
  colorPallete,
  mediaPlayer,
  input,
  button,
  webViewNew,
  tableNew,
  valueNew,
  multiselection,
  slider,
  networkPlayer,
  colorPicker,
  switchWidget,
  divisionLine
}

extension CustomWidgetTypeExtension on CustomWidgetTypeDeprecated {
  CustomWidgetSettingWidget get settingWidget {
    switch (this) {
      case CustomWidgetTypeDeprecated.simpleSwitch:
        return CustomSimpleSwitchWidget.edit().settingWidget;
      case CustomWidgetTypeDeprecated.light:
        return CustomLightWidget(name: "").settingWidget;
      case CustomWidgetTypeDeprecated.group:
        throw UnimplementedError("Error 12");
      case CustomWidgetTypeDeprecated.line:
        return CustomDivisionLineWidget(name: "").settingWidget;
      case CustomWidgetTypeDeprecated.simpleValue:
        return CustomSimpleValueWidget.edit().settingWidget;
      case CustomWidgetTypeDeprecated.advanced:
        return AdvancedCustomWidget.edit().settingWidget;
      case CustomWidgetTypeDeprecated.webView:
        return depc.CustomWebViewWidget(name: null, url: null, dataPoint: null)
            .settingWidget;
      case CustomWidgetTypeDeprecated.alertDialog:
        return CustomAlertDialogWidget(name: "").settingWidget;
      case CustomWidgetTypeDeprecated.table:
        return depc_table.CustomTableWidget(
            name: "",
            header: "",
            sortAsc: true,
            initialSortColumn: 1,
            initialSortEnabled: false,
            elementsPerPage: 10,
            columns: {}).settingWidget;
      case CustomWidgetTypeDeprecated.graph:
        return GraphWidget(name: "name").settingWidget;
      case CustomWidgetTypeDeprecated.colorPallete:
        return CustomColorPaletteWidget(name: "", pickersEnabled: {})
            .settingWidget;
      case CustomWidgetTypeDeprecated.mediaPlayer:
        return CustomMediaPlayerWidget(name: "", url: "").settingWidget;
      case CustomWidgetTypeDeprecated.input:
        return CustomInputWidget(
                id: "", name: "", hintText: "", dataPoint: null, suffix: "")
            .settingWidget;
      case CustomWidgetTypeDeprecated.button:
        return CustomButtonWidget(
          id: "",
          name: "",
          dataPoint: null,
        ).settingWidget;
      case CustomWidgetTypeDeprecated.webViewNew:
        return CustomWebViewWidget(id: "id", name: "", dataPoint: null)
            .settingWidget;
      case CustomWidgetTypeDeprecated.tableNew:
        return CustomTableWidget(id: "", name: "", dataPoint: null, columns: {})
            .settingWidget;
      case CustomWidgetTypeDeprecated.valueNew:
        return CustomValueWidget(id: "", name: "", dataPoint: null)
            .settingWidget;
      case CustomWidgetTypeDeprecated.multiselection:
        return CustomMultiselectionWidget(
            id: "", name: "", dataPoint: null, selections: {}).settingWidget;
      case CustomWidgetTypeDeprecated.slider:
        return CustomSliderWidget(id: "", name: "", dataPoint: null)
            .settingWidget;
      case CustomWidgetTypeDeprecated.networkPlayer:
        return CustomNetworkPlayerWidget(id: "", name: "name").settingWidget;
      case CustomWidgetTypeDeprecated.colorPicker:
        return CustomColorPickerWidget(id: "", name: "", dataPoint: null)
            .settingWidget;
      case CustomWidgetTypeDeprecated.switchWidget:
        return CustomSwitchWidget(id: "id", name: "", dataPoint: null)
            .settingWidget;
      case CustomWidgetTypeDeprecated.divisionLine:
        return CustomDivisionLineWidget(name: "").settingWidget;
    }
  }

  CustomThemeForWidget get emptyTheme {
    switch (this) {
      case CustomWidgetTypeDeprecated.valueNew:
        return CustomValueWidgetTheme(
            "not set",
            LabelTheme("not set", null, null, null, null),
            null,
            null,
            null) as CustomThemeForWidget;
      case CustomWidgetTypeDeprecated.switchWidget:
        return CustomSwitchWidgetTheme(
                "not set", LabelTheme("not set", null, null, null, null))
            as CustomThemeForWidget;
      case CustomWidgetTypeDeprecated.button:
        return CustomButtonWidgetTheme(
                "not set", LabelTheme("not set", null, null, null, null))
            as CustomThemeForWidget;
      case CustomWidgetTypeDeprecated.input:
        return CustomInputWidgetTheme(
                "not set", LabelTheme("not set", null, null, null, null))
            as CustomThemeForWidget;
      case CustomWidgetTypeDeprecated.multiselection:
        return CustomMultiselectionWidgetTheme(
                "not set", LabelTheme("not set", null, null, null, null))
            as CustomThemeForWidget;
      case CustomWidgetTypeDeprecated.colorPicker:
        return CustomColorpickerWidgetTheme(
                "not set", LabelTheme("not set", null, null, null, null))
            as CustomThemeForWidget;
      case CustomWidgetTypeDeprecated.slider:
        return CustomSliderWidgetTheme(
                "not set", LabelTheme("not set", null, null, null, null))
            as CustomThemeForWidget;

      default:
        throw UnimplementedError("Not implemented for $this");
    }
  }

  String get name {
    switch (this) {
      case CustomWidgetTypeDeprecated.simpleSwitch:
        return "Button (Deprecated)";
      case CustomWidgetTypeDeprecated.light:
        return "Switch with Slider (Deprecated)";
      case CustomWidgetTypeDeprecated.line:
        return "Division Line (Deprecated)";
      case CustomWidgetTypeDeprecated.simpleValue:
        return "Value (Deprecated)";
      case CustomWidgetTypeDeprecated.advanced:
        return "Advanced/Flexible (Deprecated)";
      case CustomWidgetTypeDeprecated.webView:
        return "Web View (Deprecated)";
      case CustomWidgetTypeDeprecated.table:
        return "Table (Deprecated)";
      case CustomWidgetTypeDeprecated.graph:
        return "Graph (only sql Adapter)";
      case CustomWidgetTypeDeprecated.colorPallete:
        return "Color Palette (Deprecated)";
      case CustomWidgetTypeDeprecated.mediaPlayer:
        return "Network Media Player (Deprecated)";
      case CustomWidgetTypeDeprecated.button:
        return "Button (new)";
      case CustomWidgetTypeDeprecated.input:
        return "Input (new)";
      case CustomWidgetTypeDeprecated.webViewNew:
        return "Web view (new)";
      case CustomWidgetTypeDeprecated.tableNew:
        return "Table (new)";
      case CustomWidgetTypeDeprecated.valueNew:
        return "Value (new)";
      case CustomWidgetTypeDeprecated.multiselection:
        return "Multiselection (new)";
      case CustomWidgetTypeDeprecated.slider:
        return "Slider (new)";
      case CustomWidgetTypeDeprecated.networkPlayer:
        return "Network player (new)";
      case CustomWidgetTypeDeprecated.colorPicker:
        return "Colorpicker (new)";
      case CustomWidgetTypeDeprecated.switchWidget:
        return "Switch (new)";
      case CustomWidgetTypeDeprecated.divisionLine:
        return "Line (new)";
      default:
        return toString();
    }
  }
}

abstract class CustomWidgetDeprecated {
  static String typeID = "-1";
  String? name;
  CustomWidgetTypeDeprecated? type;
  Map<String, dynamic>? settings;

  CustomWidgetDeprecated(
      {required this.name, required this.type, required this.settings});

  CustomWidgetDeprecated.edit({required this.type});

  Widget get widget;

  CustomWidgetSettingWidget get settingWidget;

  factory CustomWidgetDeprecated.fromJSON(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson();

  CustomWidgetDeprecated clone();

  CustomWidget migrate({required String id, required String name});
}

abstract class CustomWidgetSettingWidget {
  bool validate();

  final bool deprecated = true;

  CustomWidgetDeprecated get customWidgetDeprecated;
  CustomWidget get customWidget;

  List<GlobalKey> get showKeys;
}

abstract class CustomWidgetSettingStatelessWidget extends StatelessWidget
    implements CustomWidgetSettingWidget {
  const CustomWidgetSettingStatelessWidget({super.key});
}

abstract class CustomWidgetSettingStatefulWidget extends StatefulWidget
    implements CustomWidgetSettingWidget {
  const CustomWidgetSettingStatefulWidget({super.key});
}
