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
}

