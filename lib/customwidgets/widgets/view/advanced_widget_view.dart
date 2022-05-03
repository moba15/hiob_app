import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/triggerAction/multiselection_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/none_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/slider_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';

import '../../../device/bloc/device_bloc.dart';

class AdvancedWidgetView extends StatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  const AdvancedWidgetView({Key? key, required this.advancedCustomWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(advancedCustomWidget.bodyTriggerAction == null) {
      return const ListTile(
        title: Text("No Trigger Found"),
      );
    }

    switch(advancedCustomWidget.bodyTriggerAction!.type) {
      case TriggerActionType.none:
        return _NoneTriggerActionView(
            advancedCustomWidget: advancedCustomWidget,
            noneTriggerAction: advancedCustomWidget.bodyTriggerAction as NoneTriggerAction
        );
      case TriggerActionType.multiSelection:
        return _MultiSelectionTriggerActionView(
          advancedCustomWidget: advancedCustomWidget,
          multiSelectionTriggerAction: advancedCustomWidget.bodyTriggerAction as MultiSelectionTriggerAction,
        );
      case TriggerActionType.slider:
        return _SliderTriggerView(advancedCustomWidget: advancedCustomWidget, sliderTriggerAction:  advancedCustomWidget.bodyTriggerAction as SliderTriggerAction,);
      default:
        return const Text("Error 404 no view found");

    }


  }
}

//TODO: Maybe in sperate File usw.
class _NoneTriggerActionView extends StatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  final NoneTriggerAction noneTriggerAction;
  const _NoneTriggerActionView({Key? key, required this.advancedCustomWidget, required this.noneTriggerAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(noneTriggerAction.dataPoint == null) {
      return const ListTile(
        title: Text("No Device found"),
      );
    }


    return ListTile(
      title: advancedCustomWidget.value == null ? Text(advancedCustomWidget.name ?? "No Name Fund") : Text(advancedCustomWidget.value!),
      subtitle: noneTriggerAction.dataPoint?.device?.getDeviceStatus() != DeviceStatus.ready ? const  Text("Unavailable", style: TextStyle(color: Colors.red),) : null,
      trailing: BlocBuilder<DataPointBloc, DataPointState>(
        bloc: DataPointBloc(noneTriggerAction.dataPoint!),
        builder: (context, state) {
          String leading = state.value.toString();
          if(noneTriggerAction.displayRules?.containsKey(leading) ?? false) {
            leading = noneTriggerAction.displayRules?[leading] ?? "Error in Filter";
          } else if(state.value is double) {
            leading = (state.value as double).toStringAsFixed(noneTriggerAction.round);
          }
          if(noneTriggerAction.unit != null) {
            leading = leading + " " + noneTriggerAction.unit!;
          }
          return Container(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Text(
              leading,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          );
        },

      ),

    );
  }
}

class _MultiSelectionTriggerActionView extends StatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  final MultiSelectionTriggerAction multiSelectionTriggerAction;
  const _MultiSelectionTriggerActionView({Key? key, required this.advancedCustomWidget, required this.multiSelectionTriggerAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(multiSelectionTriggerAction.dataPoint == null) {
      return const ListTile(
        title: Text("No Device found"),
      );
    }
    if(multiSelectionTriggerAction.selections.length<2) {
      return const ListTile(
        title: Text("Please add more selections"),
      );
    }
    return ListTile(
        title: Text(advancedCustomWidget.value ?? advancedCustomWidget.name ?? "No Name Found"),
        subtitle: multiSelectionTriggerAction.dataPoint?.device?.getDeviceStatus() != DeviceStatus.ready ? const  Text("Unavailable", style: TextStyle(color: Colors.red),) : null,
        trailing: FractionallySizedBox(
          widthFactor: 0.40,
          child: multiSelectionTriggerAction.widget,
        )
    );
  }
}

class _SliderTriggerView extends StatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  final SliderTriggerAction sliderTriggerAction;
  const _SliderTriggerView({Key? key, required this.advancedCustomWidget, required this.sliderTriggerAction}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if(sliderTriggerAction.dataPoint == null) {
      return const ListTile(
        title: Text("No Device found"),
      );
    }
    return ListTile(
      title: Text(advancedCustomWidget.value ?? advancedCustomWidget.name ?? "No Name found"),
      subtitle: Column(
        children: [
          sliderTriggerAction.widget,
          if(sliderTriggerAction.dataPoint?.device?.getDeviceStatus() != DeviceStatus.ready)
            const Text("Unavailable", style: TextStyle(color: Colors.red),),
        ],
      ),

    );
  }
}



