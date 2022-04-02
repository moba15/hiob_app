import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/view/simple_switch_widget_view.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/device_manager.dart';

import '../../device/device.dart';

class CustomSimpleSwitchWidget extends CustomWidget {
  static const CustomWidgetType typeID = CustomWidgetType.simpleSwitch;
  String? text;
  String? device;

  CustomSimpleSwitchWidget(
      {required this.text, required name, required this.device})
      : super(
            name: name,
            type: typeID,
            settings: {"text": text, "device": device});

  CustomSimpleSwitchWidget.edit() : super.edit();

  @override
  Map<String, dynamic> toJson() => {
        "type": CustomWidgetType.simpleSwitch.toString(),
        "text": text,
        "device": device
      };

  factory CustomSimpleSwitchWidget.fromJson(Map<String, dynamic> json) =>
      CustomSimpleSwitchWidget(
        text: json["text"],
        name: json["name"],
        device: json["device"], //TODO: Finish From JSON ZCgRaLnf2Xsy5wGQN2pD
      );

  Widget get settingWidget => CustomSwitchWidgetSettingWidget(
        customSwitchWidget: this,
      );

  Device? getDevice(DeviceManager deviceManager) {
    return deviceManager.devicesList
            .where((element) => element.id == device)
            .toList()
            .isEmpty
        ? null
        : deviceManager.devicesList
            .firstWhere((element) => element.id == device);
  }

  @override
  Widget get widget => SimpleSwitchWidgetView(customSimpleSwitchWidget: this);
}

class CustomSwitchWidgetSettingWidget extends StatefulWidget {
  final CustomSimpleSwitchWidget customSwitchWidget;

  const CustomSwitchWidgetSettingWidget(
      {Key? key, required this.customSwitchWidget})
      : super(key: key);

  @override
  State<CustomSwitchWidgetSettingWidget> createState() =>
      _CustomSwitchWidgetSettingWidgetState();
}

class _CustomSwitchWidgetSettingWidgetState
    extends State<CustomSwitchWidgetSettingWidget> {
  final TextEditingController valueController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  Device? currentDevice;

  void _save(CustomWidgetManager customWidgetManager) {
    customWidgetManager.save(CustomWidgetTemplate(
        name: nameController.text,
        id: customWidgetManager.manager.getRandString(12),
        customWidget: CustomSimpleSwitchWidget(
            name: nameController.text,
            text: valueController.text,
            device: currentDevice?.id)));
  }

  @override
  Widget build(BuildContext context) {
    CustomWidgetManager customWidgetManager =
        context.read<CustomWidgetManager>();

    return Column(
      children: [
        TextField(
          controller: nameController,
          onChanged: (value) =>
              widget.customSwitchWidget.name = nameController.text,
          decoration: const InputDecoration(hintText: "Name"),
        ),
        TextField(
          controller: valueController,
          onChanged: (value) => widget.customSwitchWidget.text = value,
          decoration: const InputDecoration(hintText: "Value"),
        ),
        DropdownButtonFormField<Device>(
          items: [
            for (Device d in customWidgetManager.deviceManager.devicesList)
              DropdownMenuItem(
                child: Text(d.name),
                value: d,
              )
          ],
          value: currentDevice,
          onChanged: (Device? device) {
            setState(() {
              currentDevice = device!;
            });
          },
        ),
        ElevatedButton(
            onPressed: () => _save(customWidgetManager),
            child: const Text("Save")),
      ],
    );
  }
}
