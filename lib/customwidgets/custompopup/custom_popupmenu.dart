import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custompopup/view/cutsom_popupmenu_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/colorpicker/custom_colorpicker_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/multiselection/custom_multiselection_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/custom_slider_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/switch/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/reorder_helper.dart';

part 'custom_popupmenu.freezed.dart';
part 'custom_popupmenu.g.dart';

//TODO maybe do constructor const
@unfreezed
class CustomPopupmenu with _$CustomPopupmenu {
  CustomPopupmenu._();

  factory CustomPopupmenu(
      {@CustomWidgetConverter()
      required List<CustomWidget> customWidgets}) = _CustomPopupmenu;

  factory CustomPopupmenu.fromJson(Map<String, dynamic> json) =>
      _$CustomPopupmenuFromJson(json);

  bool tryOpen(BuildContext context) {
    if (customWidgets.isEmpty) {
      return false;
    }

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => CutsomPopupmenuView(customPopupmenu: this));

    return true;
  }

  List<String> getDependentDataPoints() {
    List<String> dataPoints = [];
    for (CustomWidget customWidget in customWidgets) {
      dataPoints.addAll(customWidget.dependentDataPoints);
    }
    return dataPoints;
  }

  void reorder(int oldIndex, int newIndex) {
    ReorderHelper.rorderList(customWidgets,
        oldIndex: oldIndex, newIndex: newIndex);
  }
}

class CustomWidgetConverter
    implements JsonConverter<CustomWidget, Map<String, dynamic>> {
  const CustomWidgetConverter();
  @override
  CustomWidget fromJson(Map<String, dynamic> json) {
    switch (json["type"]) {
      case "button":
        return CustomButtonWidget.fromJson(json);
      case "slider":
        return CustomSliderWidget.fromJson(json);
      case "multiselection":
        return CustomMultiselectionWidget.fromJson(json);
      case "webViewNew":
        return CustomWebViewWidget.fromJson(json);
      case "input":
        return CustomInputWidget.fromJson(json);
      case "tableNew":
        return CustomTableWidget.fromJson(json);
      case "valueNew":
        return CustomValueWidget.fromJson(json);
      case "colorPicker":
        return CustomColorPickerWidget.fromJson(json);
      case "switchWidget":
        return CustomSwitchWidget.fromJson(json);
      default:
        return CustomValueWidget(
            id: Manager().getRandString(12),
            name: "Please only use new widgets",
            dataPoint: null);
    }
  }

  @override
  Map<String, dynamic> toJson(CustomWidget object) {
    return object.toJson();
  }
}
