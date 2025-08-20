import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/shapes/sldier/custom_slider_thumb_value.dart';
import 'package:smart_home/utils/theme.dart';

class CustomWebViewWidgetSettingView extends CustomWidgetSettingStatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewWidgetSettingView({
    Key? key,
    required this.customWebViewWidget,
  }) : super(key: key);

  @override
  State<CustomWebViewWidgetSettingView> createState() =>
      _CustomWebViewWidgetSettingViewState();

  @override
  CustomWidget get customWidget => customWebViewWidget;

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
    return customWebViewWidget.dataPoint != null ||
        (customWebViewWidget.url != null &&
            customWebViewWidget.url!.isNotEmpty);
  }
}

class _CustomWebViewWidgetSettingViewState
    extends State<CustomWebViewWidgetSettingView> {
  late TextEditingController urlLabelEditingController;
  late CustomWidgetBlocCubit c;

  @override
  void initState() {
    urlLabelEditingController = TextEditingController(
      text: widget.customWebViewWidget.url,
    );
    super.initState();
  }

  @override
  void dispose() {
    urlLabelEditingController.dispose();
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
            child: DeviceSelection(
              onDeviceSelected: (d) => {c.update(widget.customWebViewWidget)},
              onDataPointSelected: (d) => {
                widget.customWebViewWidget.dataPoint = d,
                c.update(widget.customWebViewWidget),
              },
              dataPointLabel: "Datapoint (optional)",
              deviceLabel: "Device (optional)",
              customWidgetManager: Manager().customWidgetManager,
              selectedDataPoint: widget.customWebViewWidget.dataPoint,
              selectedDevice: widget.customWebViewWidget.dataPoint?.device,
            ),
          ),
          InputFieldContainer.inputContainer(
            child: TextField(
              controller: urlLabelEditingController,
              decoration: const InputDecoration(label: Text("URL (optional)")),
              onChanged: (s) => {
                widget.customWebViewWidget.url = s,
                c.update(widget.customWebViewWidget),
              },
            ),
          ),
          InputFieldContainer.inputContainer(
            child: SwitchListTile(
              value: widget.customWebViewWidget.enabledZoom,
              onChanged: (bool? v) {
                setState(() {
                  widget.customWebViewWidget.enabledZoom = v ?? false;
                });
                c.update(widget.customWebViewWidget);
              },
              title: const Text("Zoom"),
            ),
          ),
          InputFieldContainer.inputContainer(
            child: SwitchListTile(
              value: widget.customWebViewWidget.enableInlineScroll,
              onChanged: (bool? v) {
                setState(() {
                  widget.customWebViewWidget.enableInlineScroll = v ?? false;
                });
                c.update(widget.customWebViewWidget);
              },
              title: const Text("Inline scrolling"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.customWebViewWidget.height--;
                  });
                  c.update(widget.customWebViewWidget);
                },
                child: const Text("-"),
              ),
              Expanded(
                child: InputFieldContainer.inputContainer(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: CustomSliderThumbValueCircle(
                        thumbRadius: 16,
                        max: 2000,
                        min: 100,
                      ),
                    ),
                    child: Slider(
                      value: widget.customWebViewWidget.height.toDouble(),
                      onChanged: (d) {
                        setState(() {
                          widget.customWebViewWidget.height = d.toInt();
                        });
                        c.update(widget.customWebViewWidget);
                      },
                      max: 2000,
                      min: widget.customWebViewWidget.height.toDouble() < 100
                          ? widget.customWebViewWidget.height.toDouble()
                          : 100,
                      divisions: 1900,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    widget.customWebViewWidget.height++;
                  });
                  c.update(widget.customWebViewWidget);
                },
                child: const Text("+"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
