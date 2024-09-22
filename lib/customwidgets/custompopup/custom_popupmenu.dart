import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custompopup/view/cutsom_popupmenu_view.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/custom_slider_widget.dart';
import 'package:smart_home/device/state/state.dart';
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

  List<DataPoint> getDependentDataPoints() {
    List<DataPoint> dataPoints = [];
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

      default:
        throw ErrorDescription("Not yet implementened: ${json["type"]}");
    }
  }

  @override
  Map<String, dynamic> toJson(CustomWidget object) {
    return object.toJson();
  }
}
