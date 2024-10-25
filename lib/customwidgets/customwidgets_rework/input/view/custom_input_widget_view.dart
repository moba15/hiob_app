import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/input/theme/custom_input_widget_theme.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CustomInputWidgetView extends StatefulWidget {
  final CustomInputWidget customInputWidget;
  const CustomInputWidgetView({Key? key, required this.customInputWidget})
      : super(key: key);

  @override
  State<CustomInputWidgetView> createState() => _CustomInputWidgetViewState();
}

class _CustomInputWidgetViewState extends State<CustomInputWidgetView> {
  DataPointBloc? bloc;
  @override
  void initState() {
    if (widget.customInputWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customInputWidget.dataPoint!);
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomInputWidgetView oldWidget) {
    bloc?.close();
    bloc = null;
    if (widget.customInputWidget.dataPoint != null) {
      bloc = DataPointBloc(widget.customInputWidget.dataPoint!);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.customInputWidget.dataPoint == null || bloc == null) {
      return const Text("Device not found");
    }

    /*DataPointBloc bloc context.select<DataPointBloc, DataPointBloc>((value) {
      if (value.dataPoint == customInputWidget.dataPoint) {
        return value;
      }
      throw ErrorDescription("No bloc found for dataPoint");
    });*/
    if (!widget.customInputWidget.fullSize) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: BlocBuilder<DataPointBloc, DataPointState>(
          bloc: bloc,
          builder: (context, state) {
            TextEditingController textEditingController =
                TextEditingController();
            if (widget.customInputWidget.customInputDisplayConentType ==
                CustomInputDisplayConentType.value) {
              textEditingController.text = state.value.toString();
            }
            const onChanged = null;
            final onSubmitted =
                widget.customInputWidget.customInputSendMethod ==
                        CustomInputSendMethod.onSubmitted
                    ? send
                    : null;
            final hintText =
                widget.customInputWidget.customInputDisplayConentType ==
                        CustomInputDisplayConentType.hintText
                    ? state.value.toString()
                    : null;
            final String labelText = widget.customInputWidget.label == null ||
                    widget.customInputWidget.label!.isEmpty
                ? widget.customInputWidget.name
                : widget.customInputWidget.label!;
            final Text label = Text(
              labelText,
              style: (widget.customInputWidget.customTheme
                      as CustomInputWidgetTheme?)
                  ?.labelTheme
                  .textStyle,
            );
            return ListTile(
                onLongPress: () {
                  widget.customInputWidget.customPopupmenu?.tryOpen(context);
                },
                title: label,
                trailing: FractionallySizedBox(
                  widthFactor: 0.4,
                  child: TextField(
                    controller: textEditingController,
                    onChanged: (v) =>
                        onChanged != null ? onChanged(v, bloc) : null,
                    onSubmitted: (v) =>
                        onSubmitted != null ? onSubmitted(v, bloc!) : null,
                    decoration: InputDecoration(
                        hintText: hintText,
                        labelStyle: (widget.customInputWidget.customTheme
                                as CustomInputWidgetTheme?)
                            ?.labelTheme
                            .textStyle,
                        labelText: labelText,
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                ));
          },
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: BlocBuilder<DataPointBloc, DataPointState>(
          bloc: bloc,
          builder: (context, state) {
            TextEditingController textEditingController =
                TextEditingController();
            if (widget.customInputWidget.customInputDisplayConentType ==
                CustomInputDisplayConentType.value) {
              textEditingController.text = state.value.toString();
            }
            const onChanged = null;
            final onSubmitted =
                widget.customInputWidget.customInputSendMethod ==
                        CustomInputSendMethod.onSubmitted
                    ? send
                    : null;
            final hintText =
                widget.customInputWidget.customInputDisplayConentType ==
                        CustomInputDisplayConentType.hintText
                    ? state.value.toString()
                    : null;
            final Text label = widget.customInputWidget.label == null ||
                    widget.customInputWidget.label!.isEmpty
                ? Text(
                    widget.customInputWidget.name,
                    style: (widget.customInputWidget.customTheme
                            as CustomInputWidgetTheme?)
                        ?.labelTheme
                        .textStyle,
                  )
                : Text(
                    widget.customInputWidget.label!,
                    style: (widget.customInputWidget.customTheme
                            as CustomInputWidgetTheme?)
                        ?.labelTheme
                        .textStyle,
                  );
            return TextField(
              controller: textEditingController,
              onChanged: (v) => onChanged != null ? onChanged(v, bloc) : null,
              onSubmitted: (v) =>
                  onSubmitted != null ? onSubmitted(v, bloc!) : null,
              decoration: InputDecoration(
                  hintText: hintText,
                  label: label,
                  floatingLabelBehavior: FloatingLabelBehavior.always),
            );
          },
        ),
      );
    }
  }

  void send(String value, DataPointBloc bloc) {
    bloc.add(DataPointValueUpdateRequest(oldValue: value, value: value));
  }
}
