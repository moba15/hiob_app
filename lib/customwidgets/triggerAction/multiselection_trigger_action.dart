import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/triggerAction/settings/multiselection_trigger_action_settings.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/triggerAction/view/multiselection_trigger_view.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

import '../../manager/manager.dart';

class MultiSelectionTriggerAction extends TriggerAction {
  DataPoint? dataPoint;
  Map<String, String> selections;

  MultiSelectionTriggerAction(
      {required this.dataPoint, required this.selections});

  @override
  bool isTypeAllowed(value) {
    return true;
  }

  factory MultiSelectionTriggerAction.fromJSON(Map<String, dynamic> json) {
    DataPoint? dataPoint = Manager.instance.deviceManager
        .getIoBrokerDataPointByObjectID(json["dataPoint"] ?? "");
    return MultiSelectionTriggerAction(
        dataPoint: dataPoint,
        selections: Map.from(jsonDecode(json["selections"])));
  }

  @override
  TriggerActionSetting? get settings =>
      MultiSelectionTriggerActionSettings(multiSelectionTriggerAction: this);

  @override
  Map<String, dynamic> toJson() => {
        "type": type.toString(),
        "dataPoint": dataPoint?.id,
        "selections": jsonEncode(selections),
      };

  @override
  void trigger() {}

  @override
  TriggerActionType get type => TriggerActionType.multiSelection;

  @override
  bool validate() {
    return dataPoint != null && selections.length >= 2;
  }

  void reorderSelection(int oldIndex, int newIndex) {
    String? toReorder = selections[selections.keys.elementAt(oldIndex)];
    if (toReorder == null) {
      return;
    }
    Map<String, String> orderedMap = {};
    if (oldIndex < newIndex) {
      for (int i = 0; i < newIndex; i++) {
        if (i == oldIndex) {
          continue;
        }
        orderedMap[selections.keys.elementAt(i)] =
            selections[selections.keys.elementAt(i)]!;
      }

      orderedMap[selections.keys.elementAt(oldIndex)] = toReorder;
      for (int i = newIndex; i < selections.keys.length; i++) {
        orderedMap[selections.keys.elementAt(i)] =
            selections[selections.keys.elementAt(i)]!;
      }
    } else if (oldIndex > newIndex) {
      for (int i = 0; i < newIndex; i++) {
        orderedMap[selections.keys.elementAt(i)] =
            selections[selections.keys.elementAt(i)]!;
      }
      orderedMap[selections.keys.elementAt(oldIndex)] = toReorder;
      for (int i = newIndex; i < selections.keys.length; i++) {
        if (i == oldIndex) {
          continue;
        }
        orderedMap[selections.keys.elementAt(i)] =
            selections[selections.keys.elementAt(i)]!;
      }
    }
    if (oldIndex != newIndex) {
      selections = orderedMap;
    }
  }

  @override
  Widget getWidget({VoidCallback? onLongTab}) =>
      MultiSelectionTriggerActionView(multiSelectionTriggerAction: this);
}
