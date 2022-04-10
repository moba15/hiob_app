import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

class SimpleValueWidgetView extends StatelessWidget {
  final CustomSimpleValueWidget customSimpleValueWidget;

  const SimpleValueWidgetView({Key? key, required this.customSimpleValueWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(customSimpleValueWidget.dataPoint == null) {
      return ListTile(
        title: Text(customSimpleValueWidget.name?? "No Text Found"),
        onTap: ()  {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Device Not Found")));
        },

      );
    }
    DataPoint? dataPoint = customSimpleValueWidget.dataPoint;

    if (dataPoint == null) {
      return ListTile(
        title: Text(customSimpleValueWidget.name ?? "No Text Found"),
        subtitle:  const Text("No Data Point found"),
      );
    }

    return ListTile(
      title: Text(customSimpleValueWidget.name ?? "No Text Found"),
      trailing: BlocBuilder<DataPointBloc, DataPointState>(
        bloc: DataPointBloc(dataPoint),
        builder: (context, state) {
          if(state.value is double) {
            return Text((state.value as double).toStringAsFixed(customSimpleValueWidget.round ?? 800) , style: const TextStyle(fontSize: 17),);
          } else {
            return Text(state.value.toString(), style: const TextStyle(fontSize: 17),);
          }
        },
      ),

    );
  }
}