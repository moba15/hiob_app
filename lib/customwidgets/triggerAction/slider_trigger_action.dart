import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/settings/slider_trigger_action_settings.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/triggerAction/view/slider_trigger_view.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

import '../../manager/manager.dart';

class SliderTriggerAction extends TriggerAction {
  DataPoint? dataPoint;
  int max;
  int min;
  int steps ;
  SliderTriggerAction({required this.dataPoint, this.min = 0, this.max = 100, this.steps = 1});

  factory SliderTriggerAction.fromJSON(Map<String, dynamic> json) {
    DataPoint? dataPoint = Manager.instance.deviceManager.getIoBrokerDataPointByObjectID(json["dataPoint"] ?? "");
    return SliderTriggerAction(dataPoint: dataPoint, min: json["min"], max: json["max"], steps: json["steps"]  );
  }


  @override
  bool isTypeAllowed(value) {
    throw true;
  }

  @override
  TriggerActionSetting? get settings => SliderTriggerActionSettings(sliderTriggerAction: this);

  @override
  Map<String, dynamic> toJson() => {
    "type": type.toString(),
    "dataPoint": dataPoint?.id,
    "min": min,
    "max": max,
    "steps": steps
  };

  @override
  void trigger() {
  }

  @override
  TriggerActionType get type => TriggerActionType.slider;

  @override
  bool validate() {
    return dataPoint != null && max>min && steps>=1;
  }

  @override
  Widget getWidget({VoidCallback? onLongTab}) => SliderTriggerView(sliderTriggerAction: this);

}