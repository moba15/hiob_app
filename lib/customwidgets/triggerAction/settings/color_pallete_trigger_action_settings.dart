import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';

class ColorPalleteTriggerActionSettings extends TriggerActionSetting {
  @override
  Widget build(BuildContext context) {
    return Text("nice");
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();
}
