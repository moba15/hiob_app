import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/view/simple_switch_widget_view.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/manager/customise_manager.dart';
import 'package:smart_home/manager/device_manager.dart';

import '../../device/device.dart';

class CustomSimpleSwitchWidget extends CustomWidget {
  static const CustomWidgetType typeID = CustomWidgetType.simpleSwitch;
  String? text;
  String? deviceID;
  String? dataPointID;

  CustomSimpleSwitchWidget(
      {required this.text, required name, required this.deviceID, this.dataPointID})
      : super(
            name: name,
            type: typeID,
            settings: {"text": text, "device": deviceID});

  CustomSimpleSwitchWidget.edit() : super.edit();

  @override
  Map<String, dynamic> toJson() => {

    "type": CustomWidgetType.simpleSwitch.toString(),
    "text": text,
    "device": deviceID,
    "dataPoint": dataPointID,
  };

  factory CustomSimpleSwitchWidget.fromJson(Map<String, dynamic> json) =>
      CustomSimpleSwitchWidget(
        text: json["text"],
        name: json["name"],
        deviceID: json["device"],
        dataPointID: json["dataPoint"],
      );

  Widget get settingWidget => CustomSwitchWidgetSettingWidget(
        customSwitchWidget: this,
      );

  Device? getDevice(DeviceManager deviceManager) {
    return deviceManager.devicesList
            .where((element) => element.id == deviceID)
            .toList()
            .isEmpty
        ? null
        : deviceManager.devicesList
            .firstWhere((element) => element.id == deviceID);
  }

  DataPoint? getDataPoint(DeviceManager deviceManager) {
    return getDevice(deviceManager)?.dataPoints?.firstWhere((element) => element.id == dataPointID);
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
  DataPoint? currentDataPoint;

  void _save(CustomWidgetManager customWidgetManager) {
    customWidgetManager.save(CustomWidgetTemplate(
        name: nameController.text,
        id: customWidgetManager.manager.getRandString(12),
        customWidget: CustomSimpleSwitchWidget(
            name: nameController.text,
            text: valueController.text,
            deviceID: currentDevice?.id, dataPointID: currentDataPoint?.id)));
  }

  @override
  Widget build(BuildContext context) {
    CustomWidgetManager customWidgetManager =
        context.read<CustomWidgetManager>();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: nameController,
            onChanged: (value) =>
            widget.customSwitchWidget.name = nameController.text,
            decoration: const InputDecoration(labelText: "Name"),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: valueController,
            onChanged: (value) => widget.customSwitchWidget.text = value,
            decoration: const InputDecoration(labelText: "Value"),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: DropdownSearch<Device>(
                    items: customWidgetManager.manager.deviceManager.devicesList,
                    itemAsString: (e) => e?.name ?? "Error",
                    onChanged: (e)  {
                      if(e!=currentDevice) {
                        setState(() {
                          currentDevice = e;
                          currentDataPoint = null;
                        });
                      }

                    },
                    searchDelay: const Duration(seconds: 0),
                    showClearButton: true,
                    showAsSuffixIcons: true,
                    dropdownSearchDecoration: const InputDecoration(labelText: "Device"),


                    mode: Mode.BOTTOM_SHEET,
                    showSearchBox: true,
                    selectedItem: currentDevice,
                  ),
                ),
                Container(width: 10,),
                Expanded(
                  child: DropdownSearch<DataPoint>(
                    items: currentDevice?.dataPoints ?? [],
                    itemAsString: (e) => e?.name ?? "Error",
                    onChanged: (e) => {
                      currentDataPoint = e
                    },
                    showClearButton: true,
                    showAsSuffixIcons: true,
                    dropdownSearchDecoration: const InputDecoration(labelText: "DataPoint"),

                    mode: Mode.BOTTOM_SHEET,
                    showSearchBox: true,
                    selectedItem: currentDataPoint,
                  ),
                )
              ],
            ),
        ),


        ElevatedButton(
            onPressed: () => _save(customWidgetManager),
            child: const Text("Save")),
      ],
    );
  }
}
