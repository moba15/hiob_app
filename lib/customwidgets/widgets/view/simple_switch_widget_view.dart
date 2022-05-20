import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/device/datapoint/bloc/datapoint_bloc.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

import '../../../device/bloc/device_bloc.dart';
import '../../../manager/manager.dart';

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


class SimpleSwitchWidgetDeviceView extends StatefulWidget {
  final String text;
  final String buttonText;
  const SimpleSwitchWidgetDeviceView({Key? key, required this.text, required this.buttonText}) : super(key: key);

  @override
  State<SimpleSwitchWidgetDeviceView> createState() => _SimpleSwitchWidgetDeviceViewState();
}

class _SimpleSwitchWidgetDeviceViewState extends State<SimpleSwitchWidgetDeviceView> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
      lowerBound: 0,
      upperBound: 0.15
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DataPointBloc>();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (details) => startAnimation(),
      onTapCancel: () =>startAnimationRev(),
      child: ListTile(
          visualDensity: VisualDensity.compact,
          onTap: () {

            bloc.add(DataPointValueUpdateRequest(value: !(bloc.state.value == true), oldValue: bloc.state.value));
            if(context.read<Manager>().generalManager.vibrateEnabled) {
              HapticFeedback.lightImpact();
            }
          },
          title: Row(
            children: [
              Text(widget.text),
              if(bloc.dataPoint.device?.getDeviceStatus() != DeviceStatus.ready)
                const Text(" (Unavailable)", style: TextStyle(color: Colors.red),)
            ],
          ),
          //subtitle: bloc.dataPoint.device?.getDeviceStatus() != DeviceStatus.ready  ? const  Text("Unavailable", style: TextStyle(color: Colors.red, fontSize: 12),) : null,
          trailing: AnimatedBuilder(
              child: OutlinedButton(
                child: Text(widget.buttonText),
                onPressed: () async {

                  bloc.add( DataPointValueUpdateRequest(value: true, oldValue: bloc.state.value == true));
                  if(context.read<Manager>().generalManager.vibrateEnabled) {
                    HapticFeedback.lightImpact();
                  }


                },
              ),
              animation: _animationController,
              builder: (context, child)  {
                return Transform.scale(
                  child: child,
                  scale: 1 - _animationController.value,

                );
              }
          )
      ),
    );
  }

  void startAnimation() {
    print("start");
    _animationController.forward();
  }
  void startAnimationRev() {
    print("cancle");
      _animationController.reverse();
  }
}

