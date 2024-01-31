
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/triggerAction/multiselection_trigger_action.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';

import '../../../manager/manager.dart';

class MultiSelectionTriggerActionView extends StatelessWidget {
  final MultiSelectionTriggerAction multiSelectionTriggerAction;

  const MultiSelectionTriggerActionView(
      {Key? key, required this.multiSelectionTriggerAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = DataPointBloc(multiSelectionTriggerAction.dataPoint!);
    if (multiSelectionTriggerAction.dataPoint == null ||
        multiSelectionTriggerAction.selections.length < 2) {
      return const Text("Error");
    }

    return BlocBuilder<DataPointBloc, DataPointState>(
      builder: (context, state) {

        List<String> items = multiSelectionTriggerAction.selections.keys.toList();
        if(!items.any((element) => element == state.value.toString())) {
          items.add(state.value.toString());
        }

        items = items.toSet().toList();
        final ids = <dynamic>{};

        var i = items.map((e) => DropdownMenuItem<String>(value: multiSelectionTriggerAction.selections[e] ?? e.toString(),child: Text(e),)).toSet().toList();
        i.retainWhere((element) => ids.add(element.value));


        return DropdownButtonFormField<String>(
          items: i,
          onChanged: (d)  {
            if(multiSelectionTriggerAction.selections.containsValue(d)) {
              dynamic value = d;
              if(int.tryParse(value.toString()) != null) {
                value = int.parse(value.toString());
              } else if(value == "true" || value == "false") {
                value = value == "true";
              } else if(double.tryParse(value.toString()) != null) {
                value = double.parse(value.toString());
              }

              bloc.add(DataPointValueUpdateRequest(value: value, oldValue: state.value));
              if(context.read<Manager>().generalManager.vibrateEnabled) {
                HapticFeedback.lightImpact();
              }
            }

          },

          value: state.value.toString(),
          decoration: const InputDecoration(border: OutlineInputBorder()),
        );


      },
      bloc: bloc ,
    );
  }
}

