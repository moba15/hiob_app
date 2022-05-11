import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

import '../../../../device/device.dart';
import '../../../../manager/customise_manager.dart';

class CustomSwitchWidgetSettingWidget extends CustomWidgetSettingStatefulWidget {
  final CustomSimpleSwitchWidget customSimpleSwitchWidget;
  const CustomSwitchWidgetSettingWidget({Key? key, required this.customSimpleSwitchWidget}) : super(key: key);

  @override
  State<CustomSwitchWidgetSettingWidget> createState() => _CustomSwitchWidgetSettingWidgetState();

  @override
  CustomWidget get customWidget => customSimpleSwitchWidget;

  @override
  bool validate() {
    return customSimpleSwitchWidget.dataPoint != null
        && customSimpleSwitchWidget.device != null;
  }
}

class _CustomSwitchWidgetSettingWidgetState extends State<CustomSwitchWidgetSettingWidget> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _buttonController = TextEditingController();
  Device? currentDevice;
  DataPoint? currentDataPoint;

  @override
  void initState() {
    _valueController.value = TextEditingValue(text: widget.customSimpleSwitchWidget.value ?? "");
    _buttonController.value = TextEditingValue(text: widget.customSimpleSwitchWidget.buttonText ?? "");
    currentDevice = widget.customSimpleSwitchWidget.device;
    currentDataPoint = widget.customSimpleSwitchWidget.dataPoint;

    super.initState();
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomWidgetManager customWidgetManager = context.read<CustomWidgetManager>();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: TextField(
            onChanged: (s) => { widget.customSimpleSwitchWidget.value = s, if(s.isEmpty) widget.customSimpleSwitchWidget.value = null},
            decoration: const InputDecoration(labelText: "Value (optional)", hintText: "Value"),
            controller: _valueController,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: TextField(
            onChanged: (s) => { widget.customSimpleSwitchWidget.buttonText = s, if(s.isEmpty) widget.customSimpleSwitchWidget.buttonText = null},
            decoration: const InputDecoration(labelText: "Button Text (optional)"),
            controller: _buttonController,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: Row(
            children: [
              Expanded(
                child: DeviceSelection(
                  selectedDevice: currentDevice,
                  selectedDataPoint: currentDataPoint,
                  onDeviceSelected: (d)  {
                    if(d == null) {
                      currentDataPoint = null;
                    }
                    currentDevice = d;
                    currentDevice = d;
                    widget.customSimpleSwitchWidget.dataPoint = currentDataPoint;
                    widget.customSimpleSwitchWidget.device = d;
                  },
                  onDataPointSelected: (DataPoint? d ) {
                    widget.customSimpleSwitchWidget.dataPoint = d;
                  },
                  customWidgetManager: customWidgetManager,
                )
              ),

            ],
          ),
        ),
      ],
    );
  }
}
