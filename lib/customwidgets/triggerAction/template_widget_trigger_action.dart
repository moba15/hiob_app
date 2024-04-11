import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';

class TemplateWidgetTriggerAction extends TriggerAction {
  @override
  Widget getWidget({VoidCallback? onLongTab}) {
    throw UnimplementedError();
  }

  @override
  bool isTypeAllowed(value) {
    throw UnimplementedError();
  }

  @override
  TriggerActionSetting? get settings => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  void trigger() {}

  @override
  TriggerActionType get type => throw UnimplementedError();

  @override
  bool validate() {
    throw UnimplementedError();
  }
}
