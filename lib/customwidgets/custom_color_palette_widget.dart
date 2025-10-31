import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/custom_colorpicker_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/custom_color_palette_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/custom_color_pallete_widget_settings.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/device/device.dart';
import 'package:smart_home/manager/manager.dart';

class CustomColorPaletteWidget extends CustomWidgetDeprecated {
  String? value;
  Map<ColorPickerType, bool> pickersEnabled;
  DataPoint? dataPoint;
  Device? device;
  String prefix;
  bool? alpha;

  bool shadesSelection;

  CustomColorPaletteWidget({
    required super.name,
    this.value,
    required this.pickersEnabled,
    this.dataPoint,
    this.device,
    this.prefix = "0x",
    this.alpha = false,
    this.shadesSelection = true,
  }) : super(type: CustomWidgetTypeDeprecated.colorPallete, settings: {}) {
    for (ColorPickerType type in ColorPickerType.values) {
      if (!pickersEnabled.containsKey(type) && type != ColorPickerType.custom) {
        pickersEnabled[type] = false;
      }
    }
  }

  @override
  CustomWidgetDeprecated clone() {
    return CustomColorPaletteWidget(
      name: name,
      value: value,
      pickersEnabled: pickersEnabled,
      dataPoint: dataPoint,
      device: device,
      prefix: prefix,
      alpha: alpha,
    );
  }

  @override
  CustomWidgetSettingWidget get settingWidget =>
      CustomColorPaletteWidgetSettings(customColorPaletteWidget: this);

  @override
  Map<String, dynamic> toJson() {
    Map<String, bool> m = pickersEnabled.map(
      (key, value) => MapEntry(key.toString(), value),
    );
    return {
      "type": type.toString(),
      "name": name,
      "value": value,
      "pickersEnabled": m,
      "dataPoint": dataPoint?.id,
      "device": device?.id,
      "prefix": prefix,
      "alpha": alpha,
      "shadesSelection": shadesSelection,
    };
  }

  @override
  Widget get widget => CustomColorPaletteWidgetView(colorPaletteWidget: this);

  factory CustomColorPaletteWidget.fromJson(Map<String, dynamic> json) {
    throw UnsupportedError("Not supported anymore");
  }

  @override
  CustomWidget migrate({required String id, required String name}) {
    return CustomColorPickerWidget(
      id: id,
      name: name,
      dataPoint: dataPoint?.id,
      alpha: alpha,
      label: value,
      prefix: prefix,
      pickersEnabled: pickersEnabled,
      shadesSelection: shadesSelection,
    );
  }
}
