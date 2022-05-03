import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/triggerAction/slider_trigger_action.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';
import 'package:smart_home/shapes/sldier/custom_slider_thumb_value.dart';

class SliderTriggerView extends StatelessWidget {
  final SliderTriggerAction sliderTriggerAction;

  const SliderTriggerView({Key? key, required this.sliderTriggerAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = DataPointBloc(sliderTriggerAction.dataPoint!);
    if (sliderTriggerAction.dataPoint == null) {
      return const Text("Device not found");
    }
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: bloc,
      builder: (context, state) {
        return _Slider(
          sliderTriggerAction: sliderTriggerAction,
          value: state.value,
          dataPointBloc: bloc,
        );
      },
    );
  }
}

class _Slider extends StatefulWidget {
  final SliderTriggerAction sliderTriggerAction;
  final dynamic value;
  final DataPointBloc dataPointBloc;

  const _Slider(
      {Key? key,
      required this.sliderTriggerAction,
      required this.value,
      required this.dataPointBloc})
      : super(key: key);

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  double? vTemp;

  @override
  void initState() {
    vTemp = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double value = widget.value is double
        ? widget.value
        : (widget.value is int
            ? widget.value.toDouble()
            : widget.sliderTriggerAction.min.toDouble());
    if (value > widget.sliderTriggerAction.max ||
        value < widget.sliderTriggerAction.min) {
      return Text(
          "Error: " + value.toString() + " smaller or greater than min or max");
    }
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: CustomSliderThumbValueCircle(thumbRadius: 16, max: widget.sliderTriggerAction.max),


      ),
      child: Slider(

        value: vTemp ?? value,
        min: widget.sliderTriggerAction.min.toDouble(),
        max: widget.sliderTriggerAction.max.toDouble(),
        divisions: widget.sliderTriggerAction.steps,
        onChanged: (d) {
          setState(() {
            vTemp = d;
          });
        },
        label: vTemp == null
            ? value.round().toString()
            : vTemp!.round().toString(),
        onChangeEnd: (d) {
          setState(() {
            vTemp = null;
          });
          widget.dataPointBloc
              .add(DataPointValueUpdateRequest(value: d.round()));
        },
      ),
    );
  }
}
