import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/widgets/custom_webview_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/device_selection.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/theme.dart';

class CustomWebViewWidgetSettingWidget
    extends CustomWidgetSettingStatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  final GlobalKey urlKey = GlobalKey();
  final GlobalKey datapointKey = GlobalKey();
  final GlobalKey heightKey = GlobalKey();
  final GlobalKey javascriptKey = GlobalKey();
  CustomWebViewWidgetSettingWidget(
      {Key? key, required this.customWebViewWidget})
      : super(key: key);

  @override
  State<CustomWebViewWidgetSettingWidget> createState() =>
      _CustomSimpleValueWidgetSettingWidgetState();

  @override
  CustomWidgetDeprecated get customWidgetDeprecated => customWebViewWidget;
  @override
  // TODO: implement customWidget
  CustomWidget get customWidget => throw UnimplementedError();

  @override
  bool validate() {
    return customWebViewWidget.url != null ||
        customWebViewWidget.dataPoint != null;
  }

  @override
  List<GlobalKey<State<StatefulWidget>>> get showKeys =>
      [urlKey, datapointKey, heightKey, javascriptKey];

  @override
  // TODO: implement deprecated
  bool get deprecated => true;
}

class _CustomSimpleValueWidgetSettingWidgetState
    extends State<CustomWebViewWidgetSettingWidget> {
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    _urlController.text = widget.customWebViewWidget.url ?? "";
    super.initState();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Showcase(
              key: widget.urlKey,
              title: "Url",
              description: "The url you want to load into this widget",
              child: InputFieldContainer.inputContainer(
                child: TextField(
                  decoration: const InputDecoration(labelText: "Url"),
                  onChanged: (s) => {
                    widget.customWebViewWidget.url = s,
                    if (s.isEmpty) widget.customWebViewWidget.url = null
                  },
                  controller: _urlController,
                ),
              )),
          Showcase(
              key: widget.datapointKey,
              title: "Datapoint",
              description:
                  "If set the Url of the Datapoint will be shown and therefore also update if the datapoint updates",
              child: InputFieldContainer.inputContainer(
                child: DeviceSelection(
                  onDataPointSelected: (d) =>
                      widget.customWebViewWidget.dataPoint = d,
                  selectedDataPoint: widget.customWebViewWidget.dataPoint,
                  selectedDevice: widget.customWebViewWidget.dataPoint?.device,
                  onDeviceSelected: (d) {
                    if (d == null) {
                      widget.customWebViewWidget.dataPoint = null;
                    }
                  },
                  customWidgetManager: Manager.instance.customWidgetManager,
                ),
              )),
          Showcase(
            key: widget.heightKey,
            title: "Height",
            description: "Height of the Web View",
            child: Row(
              children: [
                const Text(
                  "Height: ",
                  style: TextStyle(fontSize: 17),
                ),
                Expanded(
                  child: Slider(
                    value: widget.customWebViewWidget.height.toDouble(),
                    max: 2000,
                    min: 100,
                    divisions: 76,
                    onChanged: (d) {
                      setState(() {
                        widget.customWebViewWidget.height = d.round();
                      });
                    },
                    label: widget.customWebViewWidget.height.toString(),
                  ),
                )
              ],
            ),
          ),
          Showcase(
            key: widget.javascriptKey,
            title: "Javascript",
            description: "Some websites need javascript to work probably",
            child: Row(
              children: [
                const Text(
                  "Javascript enabled: ",
                  style: TextStyle(fontSize: 17),
                ),
                Checkbox(
                    value: widget.customWebViewWidget.javaScript,
                    onChanged: (d) {
                      setState(() {
                        widget.customWebViewWidget.javaScript = d ?? false;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
