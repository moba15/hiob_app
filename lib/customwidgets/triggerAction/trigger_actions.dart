import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/triggerAction/none_trigger_action.dart';

enum TriggerActionType {
  button,
  handle,
  slider,
  multiSelection,
  none,


}

extension TriggerActionTypeExtension on TriggerActionType {
  String get name {
    switch(this) {
      case TriggerActionType.button:
        return "Button";
      case TriggerActionType.handle:
        return "Handle";
      case TriggerActionType.multiSelection:
        return "Multi Selection";
      case TriggerActionType.slider:
        return "Slider";
      case TriggerActionType.none:
        return "None";
    }
  }

  TriggerAction get triggerAction {
    switch(this) {
      case TriggerActionType.button:
        throw UnimplementedError();
      case TriggerActionType.handle:
        throw UnimplementedError();
      case TriggerActionType.multiSelection:
        throw UnimplementedError();
      case TriggerActionType.slider:
        throw UnimplementedError();
      case TriggerActionType.none:
        return NoneTriggerAction(dataPoint: null, displayRules: null);
    }
  }
}


abstract class TriggerAction {
  TriggerAction();

  bool isTypeAllowed(dynamic value);
  bool validate();
  TriggerActionSetting? get settings;
  Widget get widget;
  TriggerActionType get type;
  Map<String, dynamic> toJson();
  void trigger();

  static TriggerAction fromJSON(Map<String, dynamic> map) {
    String typeRaw = map["type"];
    TriggerActionType type = TriggerActionType.values.firstWhere((element) => element.toString() == typeRaw, orElse: () => TriggerActionType.none);
    switch (type) {
      case TriggerActionType.none:
        return  NoneTriggerAction.fromJSON(map);
      default:
        throw UnimplementedError("No Trigger Action found");
    }
  }

}

abstract class TriggerActionSetting extends StatelessWidget {
  const TriggerActionSetting({Key? key}) : super(key: key);
}
