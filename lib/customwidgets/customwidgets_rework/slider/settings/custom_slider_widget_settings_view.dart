import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/slider/custom_slider_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomSliderWidgetSettingsView extends CustomWidgetSettingStatefulWidget {
  final CustomSliderWidget customSliderWidget;
  const CustomSliderWidgetSettingsView({
    Key? key,
    required this.customSliderWidget,
  }) : super(key: key);

  @override
  State<CustomSliderWidgetSettingsView> createState() =>
      _CustomTableWidgetSettingsViewState();

  @override
  CustomWidget get customWidget => customSliderWidget;

  @override
  CustomWidgetDeprecated get customWidgetDeprecated =>
      throw UnimplementedError();

  @override
  bool get deprecated => false;

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      throw UnimplementedError();

  @override
  bool validate() {
    return customSliderWidget.dataPoint != null &&
        customSliderWidget.min < customSliderWidget.max;
  }
}

class _CustomTableWidgetSettingsViewState
    extends State<CustomSliderWidgetSettingsView> {
  late CustomWidgetBlocCubit c;
  late TextEditingController _minController, _maxController, _stepController;

  @override
  void initState() {
    _minController = TextEditingController(
      text: widget.customSliderWidget.min.toString(),
    );
    _maxController = TextEditingController(
      text: widget.customSliderWidget.max.toString(),
    );
    _stepController = TextEditingController(
      text: widget.customSliderWidget.step.toString(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    c = context.read<CustomWidgetBlocCubit>();
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: [
          InputFieldContainer.inputContainer(
            child: TextField(
              onChanged: (d) {
                widget.customSliderWidget.label = d;
                if (d.isEmpty) {
                  widget.customSliderWidget.label = null;
                }
                c.update(widget.customSliderWidget);
              },
              controller: TextEditingController()
                ..text = widget.customSliderWidget.label ?? "",
            ),
          ),
          InputFieldContainer.inputContainer(
            child: DeviceSelection(
              onDeviceSelected: (d) => {c.update(widget.customSliderWidget)},
              onDataPointSelected: (d) => {
                widget.customSliderWidget.dataPoint = d,
                c.update(widget.customSliderWidget),
              },
              customWidgetManager: Manager().customWidgetManager,
              selectedDataPoint: widget.customSliderWidget.dataPoint,
              selectedDevice: widget.customSliderWidget.dataPoint?.device,
            ),
          ),
          InputFieldContainer.inputContainer(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextField(
                    controller: _minController,
                    decoration: const InputDecoration(label: Text("Min")),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      widget.customSliderWidget.min = int.parse(value);
                      c.update(widget.customSliderWidget);
                    },
                    inputFormatters: [
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (int.tryParse(newValue.text) == null &&
                            newValue.text != "" &&
                            newValue.text != "-") {
                          return oldValue;
                        } else {
                          return newValue;
                        }
                      }),
                    ],
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: TextField(
                    controller: _maxController,
                    onChanged: (value) {
                      widget.customSliderWidget.max = int.parse(value);
                      c.update(widget.customSliderWidget);
                    },
                    decoration: const InputDecoration(label: Text("Max")),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (int.tryParse(newValue.text) == null &&
                            newValue.text != "" &&
                            newValue.text != "-") {
                          return oldValue;
                        } else {
                          return newValue;
                        }
                      }),
                    ],
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: TextField(
                    controller: _stepController,
                    decoration: const InputDecoration(label: Text("Step")),
                    onChanged: (value) {
                      widget.customSliderWidget.step = int.parse(value);
                      c.update(widget.customSliderWidget);
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (int.tryParse(newValue.text) == null &&
                            newValue.text != "" &&
                            newValue.text != "-") {
                          return oldValue;
                        } else {
                          return newValue;
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InputFieldContainer.inputContainer(
            child: DropdownButtonFormField<CustomSliderWidgetUpdateStrategy>(
              items: const [
                DropdownMenuItem(
                  value: CustomSliderWidgetUpdateStrategy.onChange,
                  child: Text("On Change"),
                ),
                DropdownMenuItem(
                  value: CustomSliderWidgetUpdateStrategy.onFinish,
                  child: Text("On Finish"),
                ),
              ],
              value: widget.customSliderWidget.customSliderWidgetUpdateStrategy,
              onChanged: (value) {
                setState(() {
                  widget.customSliderWidget.customSliderWidgetUpdateStrategy =
                      value ?? CustomSliderWidgetUpdateStrategy.onFinish;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
