import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:smart_home/customwidgets/widgets/custom_light_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';

import '../../../device/bloc/device_bloc.dart';
import '../../../manager/manager.dart';
import '../../../shapes/sldier/custom_slider_thumb_value.dart';

class CustomLightWidgetView extends StatefulWidget {
  final CustomLightWidget customLightWidget;
  const CustomLightWidgetView({Key? key, required this.customLightWidget})
      : super(key: key);

  @override
  State<CustomLightWidgetView> createState() => _CustomLightWidgetViewState();
}

class _CustomLightWidgetViewState extends State<CustomLightWidgetView> {
  bool currentValue = false;
  @override
  Widget build(BuildContext context) {
    String name = "No Name Found";
    if (widget.customLightWidget.value != null &&
        widget.customLightWidget.value!.replaceAll(" ", "").isNotEmpty) {
      name = widget.customLightWidget.value!;
    } else if (widget.customLightWidget.name != null) {
      name = widget.customLightWidget.name!;
    }
    if (widget.customLightWidget.onDataPoint == null) {
      return ListTile(
        title: Text(name),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error Device Not Found")));
        },
      );
    }
    final onBloc = DataPointBloc(widget.customLightWidget.onDataPoint!);
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: onBloc,
      builder: (context, state) {
        currentValue = state.value == true;

        return ListTile(
          visualDensity: VisualDensity.compact,
          trailing: Switch(
            onChanged: (v) {
              currentValue = v;
              onBloc.add(DataPointValueUpdateRequest(
                  value: v, oldValue: state.value == true));
              if (context.read<Manager>().generalManager.vibrateEnabled) {
                Vibrate.feedback(FeedbackType.light);
              }
            },
            value: state.value == true,
          ),
          title: Row(
            children: [
              Flexible(
                  child: Text(
                name,
                overflow: TextOverflow.clip,
              )),
              if (onBloc.dataPoint.device?.getDeviceStatus() !=
                  DeviceStatus.ready)
                const Flexible(
                    child: Text(
                  " U/A",
                  style: TextStyle(color: Colors.red),
                  overflow: TextOverflow.clip,
                ))
            ],
          ),
          onLongPress: onTab,
          //subtitle: onBloc.dataPoint.device?.getDeviceStatus() != DeviceStatus.ready  ? const  Text("U/A", style: TextStyle(color: Colors.red),) : null,
          onTap: () {
            onBloc.add(DataPointValueUpdateRequest(
                value: !currentValue, oldValue: state.value == true));
            if (context.read<Manager>().generalManager.vibrateEnabled) {
              Vibrate.feedback(FeedbackType.light);
            }
          },
        );
      },
    );
  }

  void onTab() {
    if (widget.customLightWidget.briDataPoint != null) {
      showDialog(
        context: context,
        builder: (context) => _CustomLightWidgetAlert(
            customLightWidget: widget.customLightWidget),
      );
    }
  }
}

class _CustomLightWidgetAlert extends StatefulWidget {
  final CustomLightWidget customLightWidget;
  const _CustomLightWidgetAlert({Key? key, required this.customLightWidget})
      : super(key: key);

  @override
  State<_CustomLightWidgetAlert> createState() =>
      _CustomLightWidgetAlertState();
}

class _CustomLightWidgetAlertState extends State<_CustomLightWidgetAlert> {
  int? briTemp;
  @override
  Widget build(BuildContext context) {
    final briBloc = DataPointBloc(widget.customLightWidget.briDataPoint!);
    return AlertDialog(
      title: Container(
        alignment: Alignment.center,
        child: Text(
          widget.customLightWidget.value ??
              widget.customLightWidget.name ??
              "No Name Found",
          overflow: TextOverflow.ellipsis,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text("Back"))
      ],
      insetPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 22),
            child: Text(widget.customLightWidget.briDisplay),
          ),
          Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.zero,
              width: double.infinity,
              child: BlocBuilder<DataPointBloc, DataPointState>(
                bloc: briBloc,
                builder: (context, state) {
                  return SliderTheme(
                    data: SliderThemeData(
                      thumbShape: CustomSliderThumbValueCircle(
                          thumbRadius: 16,
                          max: widget.customLightWidget.briMax,
                          min: widget.customLightWidget.briMin),
                    ),
                    child: Slider(
                      value: state.value != null
                          ? briTemp?.toDouble() ?? (state.value)?.toDouble()
                          : briTemp?.toDouble() ?? 0.0,
                      label: (state.value != null
                              ? briTemp?.round() ?? (state.value)?.round()
                              : briTemp ?? 0)
                          .toString(),
                      divisions: widget.customLightWidget.briSteps,
                      onChangeStart: (d) {
                        setState(() {
                          briTemp = d.round();
                        });
                      },
                      onChanged: (d) {
                        setState(() {
                          briTemp = d.round();
                        });
                        Vibrate.feedback(FeedbackType.light);
                      },
                      onChangeEnd: (d) => {
                        briBloc.add(DataPointValueUpdateRequest(
                            value: d.round(), oldValue: state.value)),
                      },
                      max: (state.value != null
                                  ? briTemp?.toDouble() ??
                                      (state.value)?.toDouble()
                                  : briTemp ?? 0) >
                              widget.customLightWidget.briMax
                          ? (state.value != null
                              ? briTemp?.toDouble() ?? (state.value)?.toDouble()
                              : briTemp ?? 0)
                          : widget.customLightWidget.briMax.toDouble(),
                      min: widget.customLightWidget.briMin.toDouble(),
                    ),
                  );
                },
              )),
          if (widget.customLightWidget.reachableDataPoint != null)
            BlocBuilder<DataPointBloc, DataPointState>(
              bloc: DataPointBloc(widget.customLightWidget.reachableDataPoint!),
              builder: ((context, state) {
                return ListTile(
                  title: Text(widget.customLightWidget.reachableDisplay),
                  trailing: Text(
                    state.value.toString(),
                    style: TextStyle(
                        color: state.value == true ? Colors.green : Colors.red),
                  ),
                  onTap: () => {},
                  leading: const Icon(Icons.wb_incandescent),
                );
              }),
            ),
        ],
      ),
    );
  }
}
