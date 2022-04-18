import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

class MultiSelectionTriggerAction extends TriggerAction {
  DataPoint dataPoint;
  String? value; 
  Map<String, dynamic> selections;

  MultiSelectionTriggerAction({required this.value, required this.dataPoint, required this.selections});


  @override
  bool isTypeAllowed(value) {
    return true;
  }

  @override
  TriggerActionSetting? get settings => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  void trigger() {
  }


  @override
  TriggerActionType get type => throw UnimplementedError();

  @override
  bool validate() {
    throw UnimplementedError();
  }

  @override
  Widget get widget => throw UnimplementedError();
  
}