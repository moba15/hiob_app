import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/theme/custom_button_widget_theme.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/device/bloc/device_bloc.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/manager.dart';

class CustomButtonWidgetView extends StatelessWidget {
  final CustomButtonWidget customButtonWidget;

  const CustomButtonWidgetView({Key? key, required this.customButtonWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (customButtonWidget.dataPoint == null) {
      return ListTile(
        visualDensity: VisualDensity.compact,
        title: Text(customButtonWidget.labelOrName),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error Device Not Found")));
        },
      );
    }
    DataPoint? dataPoint = customButtonWidget.dataPoint;

    if (dataPoint == null) {
      return SwitchListTile(
        visualDensity: VisualDensity.compact,
        value: false,
        onChanged: (v) => {},
        title: Text(customButtonWidget.name),
        subtitle: const Text("No State found"),
      );
    }
    /*DataPointBloc dataPointBloc =
        context.select<DataPointBloc, DataPointBloc>((e) {
      if (e.dataPoint == customButtonWidget.dataPoint) return e;
      throw ErrorDescription("No datapoint bloc was found");
    });*/
    DataPointBloc dataPointBloc = DataPointBloc(dataPoint);
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: dataPointBloc,
      builder: (context, state) {
        return CustomButtonWidgetDeviceView(
          text: customButtonWidget.labelOrName,
          buttonLabel: customButtonWidget.buttonLabel ?? "Press",
          dataPoint: customButtonWidget.dataPoint!,
          tryOpenPopup: customButtonWidget.tryOpenPopupmenu,
          customButtonWidgetTheme:
              customButtonWidget.customTheme as CustomButtonWidgetTheme?,
        );
      },
    );
  }
}

class CustomButtonWidgetDeviceView extends StatefulWidget {
  final String text;
  final String buttonLabel;
  final CustomButtonWidgetTheme? customButtonWidgetTheme;
  final bool Function(BuildContext) tryOpenPopup;
  final DataPoint dataPoint;
  const CustomButtonWidgetDeviceView(
      {Key? key,
      required this.text,
      required this.buttonLabel,
      required this.dataPoint,
      required this.tryOpenPopup,
      required this.customButtonWidgetTheme})
      : super(key: key);

  @override
  State<CustomButtonWidgetDeviceView> createState() =>
      _CustomButtonWidgetDeviceViewState();
}

class _CustomButtonWidgetDeviceViewState
    extends State<CustomButtonWidgetDeviceView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late DataPointBloc _bloc;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 80),
        lowerBound: 0,
        upperBound: 0.15);
    _bloc = DataPointBloc(widget.dataPoint);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: _bloc,
      builder: (context, state) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTapDown: (details) => startAnimation(),
          onTapCancel: () => startAnimationRev(),
          child: ListTile(
              visualDensity: VisualDensity.compact,
              onTap: () {
                if (!widget.tryOpenPopup(context)) {
                  _bloc.add(DataPointValueUpdateRequest(
                      value: !(_bloc.state.value == true),
                      oldValue: _bloc.state.value));
                  if (Manager().generalManager.vibrateEnabled) {
                //    Vibrate.feedback(FeedbackType.light);
                  }
                }
              },
              title: Row(
                children: [
                  Flexible(
                    child: Text(
                      widget.text,
                      overflow: TextOverflow.clip,
                      style:
                          widget.customButtonWidgetTheme?.labelTheme.textStyle,
                    ),
                  ),
                  if (_bloc.dataPoint.device?.getDeviceStatus() !=
                      DeviceStatus.ready)
                    const Flexible(
                      child: Text(
                        " U/A",
                        style: TextStyle(color: Colors.red),
                        overflow: TextOverflow.clip,
                      ),
                    )
                ],
              ),
              //subtitle: bloc.dataPoint.device?.getDeviceStatus() != DeviceStatus.ready  ? const  Text("U/A", style: TextStyle(color: Colors.red, fontSize: 12),) : null,
              trailing: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1 - _animationController.value,
                      child: child,
                    );
                  },
                  child: OutlinedButton(
                    child: Text(widget.buttonLabel),
                    onPressed: () async {
                      _bloc.add(DataPointValueUpdateRequest(
                          value: true, oldValue: _bloc.state.value == true));
                      if (Manager().generalManager.vibrateEnabled) {
                    //    Vibrate.feedback(FeedbackType.light);
                      }
                    },
                  ))),
        );
      },
    );
  }

  void startAnimation() {
    _animationController.forward();
  }

  void startAnimationRev() {
    _animationController.reverse();
  }
}
