import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart';
import 'package:smart_home/device/bloc/device_bloc.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

class SimpleValueWidgetView extends StatelessWidget {
  final CustomSimpleValueWidget customSimpleValueWidget;

  const SimpleValueWidgetView({Key? key, required this.customSimpleValueWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (customSimpleValueWidget.dataPoint == null) {
      return ListTile(
        visualDensity: VisualDensity.compact,
        title: Text(customSimpleValueWidget.name ?? "No Text Found"),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error Device Not Found")));
        },
      );
    }
    DataPoint? dataPoint = customSimpleValueWidget.dataPoint;

    if (dataPoint == null) {
      return ListTile(
        visualDensity: VisualDensity.compact,
        title: Text(customSimpleValueWidget.value ??
            customSimpleValueWidget.name ??
            "No Name Found"),
        subtitle: const Text("No Data Point found"),
      );
    }

    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: DataPointBloc(dataPoint),
      builder: (context, state) {
        return SizedBox.fromSize(

          child: ListTile(
            visualDensity: VisualDensity.compact,
            onLongPress: () => onTab(context),
            title: Row(
              children: [
                Text(customSimpleValueWidget.value ??
                    customSimpleValueWidget.name ?? "No Name Found"),
                if(dataPoint.device?.getDeviceStatus() != DeviceStatus.ready)
                  const Text(" (Unavailable)", style: TextStyle(color: Colors.red),)
              ],
            ),
            //subtitle: dataPoint.device?.getDeviceStatus() != DeviceStatus.ready ? const  Text("Unavailable", style: TextStyle(color: Colors.red),) : null,
            trailing: state.value is double
                ? Text(
                    (state.value as double).toStringAsFixed(customSimpleValueWidget.round ?? 800) + (customSimpleValueWidget.unit == null ? "": " " + customSimpleValueWidget.unit!),
                    style: const TextStyle(fontSize: 16),
                  )
                : Container(
                    constraints: const BoxConstraints(maxWidth: 200),
                    child: Text(
                      state.value.toString() +  (customSimpleValueWidget.unit == null ? "": " " + customSimpleValueWidget.unit!),
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
          ),
        );
      },
    );
  }

  void onTab(BuildContext context) {
    showDialog(context: context, builder:(c) => _ValueDialog(title: customSimpleValueWidget.value ?? customSimpleValueWidget.name ?? "No Name Found",dataPoint: customSimpleValueWidget.dataPoint!,) );
  }
}


class _ValueDialog extends StatelessWidget {
  final DataPoint dataPoint;
  final String title;
  const _ValueDialog({Key? key, required this.dataPoint, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Back"))
      ],
      title: Text(title),
      content: Text(dataPoint.value.toString(), style: const TextStyle(fontSize: 17),),

    );
  }
}

