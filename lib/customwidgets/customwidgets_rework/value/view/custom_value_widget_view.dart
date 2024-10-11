import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/value/custom_value_widget.dart';
import 'package:smart_home/device/bloc/device_bloc.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:smart_home/device/state/state.dart';

class CustomValueWidgetView extends StatefulWidget {
  final CustomValueWidget customValueWidget;
  const CustomValueWidgetView({Key? key, required this.customValueWidget})
      : super(key: key);

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
        if (state.value is double) {
          value = (state.value as double)
              .toStringAsFixed(widget.customValueWidget.round);
        } else {
          double? parse = double.tryParse(state.value.toString());
          if (parse != null) {
            value = parse.toStringAsFixed(widget.customValueWidget.round);
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
                ),
              ),
              if (widget.customValueWidget.dataPoint?.device
                      ?.getDeviceStatus() !=
                  DeviceStatus.ready)
                const Flexible(
                  child: Text(
                    " U/A",
                    style: TextStyle(color: Colors.red),
                    overflow: TextOverflow.clip,
                    softWrap: false,
                    maxLines: 1,
                  ),
                )
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
              dataPoint: widget.customValueWidget.dataPoint!, title: title);
        },
      );
    }
  }
}

class _ValueDialog extends StatelessWidget {
  final DataPoint dataPoint;
  final String title;
  const _ValueDialog({Key? key, required this.dataPoint, required this.title})
      : super(key: key);

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
        dataPoint.value.toString(),
        style: const TextStyle(fontSize: 17),
      ),
    );
  }
}
