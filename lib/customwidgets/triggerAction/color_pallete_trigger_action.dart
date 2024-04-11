import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

class ColorPalleteTriggerAction extends TriggerAction {
  final DataPoint? dataPoint;
  ColorPalleteTriggerAction({required this.dataPoint});
  @override
  Widget getWidget({VoidCallback? onLongTab}) {
    return Text("");
  }

  @override
  bool isTypeAllowed(value) {
    return true;
  }

  @override
  TriggerActionSetting? get settings => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() => {
        "type": type.toString(),
        "dataPoint": dataPoint?.id,
      };

  @override
  void trigger() {}

  @override
  TriggerActionType get type => TriggerActionType.colorPallete;

  @override
  bool validate() {
    return true;
  }
}
