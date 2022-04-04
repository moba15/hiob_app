import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/device/bloc/device_bloc.dart';

import '../../../device/device.dart';
import '../../../manager/manager.dart';

class SimpleSwitchWidgetView extends StatelessWidget {
  final CustomSimpleSwitchWidget customSimpleSwitchWidget;

  SimpleSwitchWidgetView({Key? key, required this.customSimpleSwitchWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Device? device = customSimpleSwitchWidget
        .getDevice(context.read<Manager>().deviceManager);
    if (device == null) {
      return SwitchListTile(
        value: false,
        onChanged: (v) => {},
        title: Text(customSimpleSwitchWidget.text ?? "null"),
      );
    }

    return BlocProvider(
      create: (_) => DeviceBloc(device, t: DateTime.now()),
      child: SimpleSwitchWidgetDeviceView(
        text: customSimpleSwitchWidget.text ?? "null",
      ),
    );
  }
}

class SimpleSwitchWidgetDeviceView extends StatelessWidget {
  final String text;

  const SimpleSwitchWidgetDeviceView({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<DeviceBloc>();
    return Card(
        child: SwitchListTile(
      value: bloc.state.value == true,
      onChanged: (v) {
        bloc.add(DeviceValueUpdateRequest(value: v));
      },
      title: Text(text),
    ));
  }
}
