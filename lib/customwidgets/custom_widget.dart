import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_color_palette_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_alert_dialog_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_media_player_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_table_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';
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
        return CustomWebViewWidget(name: null, url: null, dataPoint: null)
            .settingWidget;
      case CustomWidgetTypeDeprecated.alertDialog:
        return CustomAlertDialogWidget(name: "").settingWidget;
      case CustomWidgetTypeDeprecated.table:
        return CustomTableWidget(
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
    }
  }

  String get name {
    switch (this) {
      case CustomWidgetTypeDeprecated.simpleSwitch:
        return "Button (Deprecated)";
      case CustomWidgetTypeDeprecated.light:
        return "Switch with Slider";
      case CustomWidgetTypeDeprecated.line:
        return "Division Line";
      case CustomWidgetTypeDeprecated.simpleValue:
        return "Value";
      case CustomWidgetTypeDeprecated.advanced:
        return "Advanced/Flexible";
      case CustomWidgetTypeDeprecated.webView:
        return "Web View";
      case CustomWidgetTypeDeprecated.table:
        return "Table";
      case CustomWidgetTypeDeprecated.graph:
        return "Graph (only sql Adapter)";
      case CustomWidgetTypeDeprecated.colorPallete:
        return "Color Palette";
      case CustomWidgetTypeDeprecated.mediaPlayer:
        return "Network Media Player";
      case CustomWidgetTypeDeprecated.button:
        return "Button (new)";
      case CustomWidgetTypeDeprecated.input:
        return "Input (new)";
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
  const CustomWidgetSettingStatelessWidget({Key? key}) : super(key: key);
}

abstract class CustomWidgetSettingStatefulWidget extends StatefulWidget
    implements CustomWidgetSettingWidget {
  const CustomWidgetSettingStatefulWidget({Key? key}) : super(key: key);
}
