import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_simple_value_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

import '../../../../device/device.dart';
import '../../../../manager/customise_manager.dart';

class CustomSimpleValueWidgetSettingWidget extends CustomWidgetSettingStatefulWidget {
  final CustomSimpleValueWidget customSimpleValueWidget;
  const CustomSimpleValueWidgetSettingWidget({Key? key, required this.customSimpleValueWidget}) : super(key: key);

  @override
  State<CustomSimpleValueWidgetSettingWidget> createState() => _CustomSimpleValueWidgetSettingWidgetState();

  @override
  CustomWidget get customWidget => customSimpleValueWidget;

  @override
  bool validate() {
    return customSimpleValueWidget.dataPoint != null
        && customSimpleValueWidget.device != null && customSimpleValueWidget.round != null && customSimpleValueWidget.round! >= 0;
  }
}

class _CustomSimpleValueWidgetSettingWidgetState extends State<CustomSimpleValueWidgetSettingWidget> {
  final TextEditingController valueController = TextEditingController();
  Device? currentDevice;
  DataPoint? currentDataPoint;

  @override
  void initState() {
    valueController.text = widget.customSimpleValueWidget.value ?? "";
    currentDevice = widget.customSimpleValueWidget.device;
    currentDataPoint = widget.customSimpleValueWidget.dataPoint;

    super.initState();
  }

  @override
  void dispose() {
    valueController.dispose();
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
            onChanged: (s) => { widget.customSimpleValueWidget.value = s, if(s.isEmpty) widget.customSimpleValueWidget.value = null},
            decoration: const InputDecoration(labelText: "Value (optional)", hintText: "Value"),
            controller: valueController,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: TextField(
            onChanged: (s) => {widget.customSimpleValueWidget.round = int.tryParse(s) ?? 3},
            decoration: const InputDecoration(labelText: "Round to"),
            controller: TextEditingController(text: widget.customSimpleValueWidget.round.toString()),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: TextField(
            onChanged: (s) => {widget.customSimpleValueWidget.unit = s, if(s.isEmpty) widget.customSimpleValueWidget.unit = null},
            decoration: const InputDecoration(labelText: "Unit (optional)"),
            controller: TextEditingController(text: widget.customSimpleValueWidget.unit ?? ""),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
          child: Row(
            children: [

              Expanded(
                child: DeviceSelection(
                  selectedDataPoint: widget.customSimpleValueWidget.dataPoint,
                  selectedDevice: widget.customSimpleValueWidget.device,
                  onDeviceSelected: (Device? d ) {
                    if(d != currentDevice) {
                      currentDataPoint = null;
                    }
                    currentDevice = d;
                    widget.customSimpleValueWidget.dataPoint = null;
                    widget.customSimpleValueWidget.device = d;
                  },
                  onDataPointSelected: (DataPoint? d ) {
                    widget.customSimpleValueWidget.dataPoint = d;
                    String? unit = d?.getInformation("unit") ?? widget.customSimpleValueWidget.unit;
                    setState(() {
                      widget.customSimpleValueWidget.unit = unit;
                    });
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




