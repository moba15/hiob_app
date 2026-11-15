import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/common_impl/label/widget_label_theme.dart';
import 'package:smart_home/customwidgets/custom_theme_for_widget/custom_theme_for_widget.dart';
import 'package:smart_home/customwidgets/custom_widget.dart' as old;
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/theme/custom_button_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/custom_colorpicker_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/theme/custom_colorpicker_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/theme/custom_input_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/custom_multiselection_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/theme/custom_multiselection_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/networkplayer/custom_networkplayer_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/custom_slider_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/theme/custom_slider_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/theme/custom_switch_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_theme/custom_value_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';

enum WidgetType {
  group,
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
  divisionLine,
}

extension CustomWidgetTypeExtension on WidgetType {
  CustomWidgetSettingWidget get settingWidget {
    switch (this) {
      case WidgetType.input:
        return CustomInputWidget(
          id: "",
          name: "",
          hintText: "",
          dataPoint: null,
          suffix: "",
        ).settingWidget;
      case WidgetType.button:
        return CustomButtonWidget(
          id: "",
          name: "",
          dataPoint: null,
        ).settingWidget;
      case WidgetType.webViewNew:
        return CustomWebViewWidget(
          id: "id",
          name: "",
          dataPoint: null,
        ).settingWidget;
      case WidgetType.tableNew:
        return CustomTableWidget(
          id: "",
          name: "",
          dataPoint: null,
          columns: {},
        ).settingWidget;
      case WidgetType.valueNew:
        return CustomValueWidget(
          id: "",
          name: "",
          dataPoint: null,
        ).settingWidget;
      case WidgetType.multiselection:
        return CustomMultiselectionWidget(
          id: "",
          name: "",
          dataPoint: null,
          selections: {},
        ).settingWidget;
      case WidgetType.slider:
        return CustomSliderWidget(
          id: "",
          name: "",
          dataPoint: null,
        ).settingWidget;
      case WidgetType.networkPlayer:
        return CustomNetworkPlayerWidget(id: "", name: "name").settingWidget;
      case WidgetType.colorPicker:
        return CustomColorPickerWidget(
          id: "",
          name: "",
          dataPoint: null,
        ).settingWidget;
      case WidgetType.switchWidget:
        return CustomSwitchWidget(
          id: "id",
          name: "",
          dataPoint: null,
        ).settingWidget;
      case WidgetType.divisionLine:
        return CustomDivisionlineWidget(id: "", name: "").settingWidget;
      default:
        return CustomSwitchWidget(
          id: "id",
          name: "",
          dataPoint: null,
        ).settingWidget;
    }
  }

  CustomThemeForWidget get emptyTheme {
    switch (this) {
      case WidgetType.valueNew:
        return CustomValueWidgetTheme(
              "not set",
              LabelTheme("not set", null, null, null, null),
              null,
              null,
              null,
            )
            as CustomThemeForWidget;
      case WidgetType.switchWidget:
        return CustomSwitchWidgetTheme(
              "not set",
              LabelTheme("not set", null, null, null, null),
            )
            as CustomThemeForWidget;
      case WidgetType.button:
        return CustomButtonWidgetTheme(
              "not set",
              LabelTheme("not set", null, null, null, null),
            )
            as CustomThemeForWidget;
      case WidgetType.input:
        return CustomInputWidgetTheme(
              "not set",
              LabelTheme("not set", null, null, null, null),
            )
            as CustomThemeForWidget;
      case WidgetType.multiselection:
        return CustomMultiselectionWidgetTheme(
              "not set",
              LabelTheme("not set", null, null, null, null),
            )
            as CustomThemeForWidget;
      case WidgetType.colorPicker:
        return CustomColorpickerWidgetTheme(
              "not set",
              LabelTheme("not set", null, null, null, null),
            )
            as CustomThemeForWidget;
      case WidgetType.slider:
        return CustomSliderWidgetTheme(
              "not set",
              LabelTheme("not set", null, null, null, null),
            )
            as CustomThemeForWidget;

      default:
        throw UnimplementedError("Not implemented for $this");
    }
  }

  String get name {
    switch (this) {
      case WidgetType.button:
        return "Button (new)";
      case WidgetType.input:
        return "Input (new)";
      case WidgetType.webViewNew:
        return "Web view (new)";
      case WidgetType.tableNew:
        return "Table (new)";
      case WidgetType.valueNew:
        return "Value (new)";
      case WidgetType.multiselection:
        return "Multiselection (new)";
      case WidgetType.slider:
        return "Slider (new)";
      case WidgetType.networkPlayer:
        return "Network player (new)";
      case WidgetType.colorPicker:
        return "Colorpicker (new)";
      case WidgetType.switchWidget:
        return "Switch (new)";
      case WidgetType.divisionLine:
        return "Line (new)";
      default:
        return toString();
    }
  }
}

abstract class CustomWidgetSettingWidget {
  bool validate();

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
