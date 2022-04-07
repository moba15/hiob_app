import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_switch_widget.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';

import '../../../../device/device.dart';
import '../../../../manager/customise_manager.dart';

class CustomSwitchWidgetSettingWidget extends StatefulWidget {
  final CustomSimpleSwitchWidget customSwitchWidget;
  final TextEditingController nameController;


  const CustomSwitchWidgetSettingWidget({Key? key, required this.customSwitchWidget, required this.nameController}) : super(key: key);

  @override
  State<CustomSwitchWidgetSettingWidget> createState() => _CustomSwitchWidgetSettingWidgetState();
}

class _CustomSwitchWidgetSettingWidgetState extends State<CustomSwitchWidgetSettingWidget> {
  final TextEditingController valueController = TextEditingController();
  Device? currentDevice;
  DataPoint? currentDataPoint;

  @override
  void initState() {
    valueController.value = TextEditingValue(text: widget.customSwitchWidget.text ?? "");
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
      ],
    );
  }
}