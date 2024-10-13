import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/custom_slider_widget.dart';
import 'dart:math' as math;
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:smart_home/shapes/sldier/custom_slider_thumb_value.dart';

class CustomSliderWidgetView extends StatefulWidget {
  final CustomSliderWidget customSliderWidget;
  const CustomSliderWidgetView({Key? key, required this.customSliderWidget})
      : super(key: key);

  @override
  State<CustomSliderWidgetView> createState() => _CustomSliderWidgetViewState();
}

class _CustomSliderWidgetViewState extends State<CustomSliderWidgetView> {
  DataPointBloc? bloc;
  @override
  void initState() {
    if (widget.customSliderWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customSliderWidget.dataPoint!);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomSliderWidgetView oldWidget) {
    setState(() {
      bloc?.close();
      if (widget.customSliderWidget.dataPoint != null) {
        bloc = DataPointBloc(widget.customSliderWidget.dataPoint!);
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
    if (widget.customSliderWidget.step <= 0) {
      return const Text("Step must be positive");
    }
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: bloc,
      builder: (context, state) {
        double min = math.min(
            widget.customSliderWidget.min.toDouble(),
            double.tryParse(state.value.toString()) ??
                widget.customSliderWidget.min.toDouble());
        double max = math.max(
            widget.customSliderWidget.max.toDouble(),
            double.tryParse(state.value.toString()) ??
                widget.customSliderWidget.max.toDouble());
        int divisons =
            (max.toInt() - min.toInt()) ~/ widget.customSliderWidget.step;
        return ListTile(
          title: Text(widget.customSliderWidget.label ??
              widget.customSliderWidget.name),
          subtitle: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: CustomSliderThumbValueCircle(
                  thumbRadius: 16, max: max.toInt(), min: min.toInt()),
            ),
            child: Slider(
              value: double.tryParse(state.value.toString()) ?? min,
              min: min,
              max: max,
              divisions: divisons,
              onChanged: (value) {
                bloc?.add(
                    DataPointValueUpdateRequest(value: value, oldValue: value));
              },
              label:
                  (double.tryParse(state.value.toString()) ?? min).toString(),
            ),
          ),
        );
      },
    );
  }

  onLongPress() {
    widget.customSliderWidget.customPopupmenu?.tryOpen(context);
  }
}
