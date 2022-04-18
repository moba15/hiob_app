import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

class SimpleSwitchWidgetView extends StatelessWidget {
  final CustomSimpleSwitchWidget customSimpleSwitchWidget;

  const SimpleSwitchWidgetView({Key? key, required this.customSimpleSwitchWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(customSimpleSwitchWidget.dataPoint == null) {
      return ListTile(
        visualDensity: VisualDensity.compact,
        title: Text(customSimpleSwitchWidget.value ??  customSimpleSwitchWidget.name ?? "No Text Found"),
        onTap: ()  {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error Device Not Found")));
        },

      );
    }
    DataPoint? dataPoint = customSimpleSwitchWidget.dataPoint;

    if (dataPoint == null) {
      return SwitchListTile(
        visualDensity: VisualDensity.compact,
        value: false,
        onChanged: (v) => {},
        title: Text(customSimpleSwitchWidget.value ??  customSimpleSwitchWidget.name ?? "No Text Found"),
        subtitle:  const Text("No Data Point found"),
      );
    }
    return BlocProvider(
      create: (_) => DataPointBloc(dataPoint),
      child: SimpleSwitchWidgetDeviceView(
        text: customSimpleSwitchWidget.value ??  customSimpleSwitchWidget.name ?? "No Text Found",
        buttonText: customSimpleSwitchWidget.buttonText ?? "Press",
      ),
    );
  }
}

class SimpleSwitchWidgetDeviceView extends StatelessWidget {
  final String text;
  final String buttonText;

  const SimpleSwitchWidgetDeviceView({Key? key, required this.text, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DataPointBloc>();
    return ListTile(
      visualDensity: VisualDensity.compact,
      onTap: () {
        bloc.add(DataPointValueUpdateRequest(value: !(bloc.state.value == true)));
      },
      title: Text(text),
      trailing: OutlinedButton(

        child: Text(buttonText),
        onPressed: () {
          bloc.add(const DataPointValueUpdateRequest(value: true));
        },
      ),
    );
  }
}
