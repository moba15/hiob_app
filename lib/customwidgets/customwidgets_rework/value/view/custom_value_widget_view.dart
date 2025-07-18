import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_theme/custom_value_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:smart_home/manager/manager.dart';

class CustomValueWidgetView extends StatefulWidget {
  final CustomValueWidget customValueWidget;
  const CustomValueWidgetView({super.key, required this.customValueWidget});

  @override
  State<CustomValueWidgetView> createState() => _CustomValueWidgetViewState();
}

class _CustomValueWidgetViewState extends State<CustomValueWidgetView> {
  late String title;
  DataPointBloc? bloc;
  @override
  void initState() {
    title = widget.customValueWidget.label == null ||
            widget.customValueWidget.label!.isEmpty
        ? widget.customValueWidget.name
        : widget.customValueWidget.label!;
    if (widget.customValueWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customValueWidget.dataPoint!);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomValueWidgetView oldWidget) {
    setState(() {
      title = widget.customValueWidget.label == null ||
              widget.customValueWidget.label!.isEmpty
          ? widget.customValueWidget.name
          : widget.customValueWidget.label!;

      bloc?.close();
      if (widget.customValueWidget.dataPoint != null) {
        bloc = DataPointBloc(widget.customValueWidget.dataPoint!);
      } else {
        bloc = null;
      }
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (bloc == null) {
      return const Text("Error 404");
    }
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: bloc,
      builder: (context, state) {
        String value = state.value.toString();
        if (widget.customValueWidget.valueMapper.containsKey(value.trim())) {
          value = widget.customValueWidget.valueMapper[value.trim()].toString();
        } else {
          if (state.value is double) {
            value = (state.value as double)
                .toStringAsFixed(widget.customValueWidget.round);
          } else {
            double? parse = double.tryParse(state.value.toString());
            if (parse != null) {
              value = parse.toStringAsFixed(widget.customValueWidget.round);
            }
          }
        }

        value = (widget.customValueWidget.prefix ?? "") +
            value +
            (widget.customValueWidget.suffix ?? "");
        return ListTile(
          visualDensity: VisualDensity.compact,
          onLongPress: () => onLongPress(),
          onTap: onTap,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: widget.customValueWidget.customTheme != null
                      ? (widget.customValueWidget.customTheme
                              as CustomValueWidgetTheme)
                          .labelTheme
                          .textStyle
                      : null,
                ),
              ),
              //TODO add status
              // if (widget.customValueWidget.dataPoint?.device
              //         ?.getDeviceStatus() !=
              //     DeviceStatus.ready)
              //   const Flexible(
              //     child: Text(
              //       " U/A",
              //       style: TextStyle(color: Colors.red),
              //       overflow: TextOverflow.clip,
              //       softWrap: false,
              //       maxLines: 1,
              //     ),
              //   )
            ],
          ),
          //subtitle: dataPoint.device?.getDeviceStatus() != DeviceStatus.ready ? const  Text("U/A", style: TextStyle(color: Colors.red),) : null,
          trailing: state.value is double
              ? Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                  overflow: TextOverflow.fade,
                )
              : Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
        );
      },
    );
  }

  String getValue(dynamic value) {
    return widget.customValueWidget.valueMapper[value.toString()] ??
        value.toString();
  }

  onLongPress() {
    //TODO Fix
    widget.customValueWidget.customPopupmenu?.tryOpen(context);
  }

  onTap() {
    if (widget.customValueWidget.dataPoint != null) {
      showDialog(
        context: context,
        builder: (context) {
          return _ValueDialog(
              dataPointId: widget.customValueWidget.dataPoint!, title: title);
        },
      );
    }
  }
}

class _ValueDialog extends StatelessWidget {
  final String dataPointId;
  final String title;
  const _ValueDialog({required this.dataPointId, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text("Back"))
      ],
      title: Text(title),
      content: Text(
        Manager().deviceManager.getCurrentValue(dataPointId) ??
            "No value found",
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
