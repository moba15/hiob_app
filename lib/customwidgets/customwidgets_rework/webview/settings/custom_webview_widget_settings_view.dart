import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/bloc/cubit/custom_widget_bloc_cubit.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/webview/custom_webview_widget.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/settings/common/devices/state_search_bar.dart';
import 'package:smart_home/utils/theme.dart';

class CustomWebViewWidgetSettingView extends CustomWidgetSettingStatefulWidget {
  final CustomWebViewWidget customWebViewWidget;
  const CustomWebViewWidgetSettingView(
      {super.key, required this.customWebViewWidget});

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
    urlLabelEditingController =
        TextEditingController(text: widget.customWebViewWidget.url);
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
        child: Column(children: [
          InputFieldContainer.inputContainer(
              child: StateSearchBar(
            onSelected: onSelect,
          )),
          InputFieldContainer.inputContainer(
              child: TextField(
            controller: urlLabelEditingController,
            decoration: const InputDecoration(label: Text("URL (optional)")),
            onChanged: (s) => {
              widget.customWebViewWidget.url = s,
              c.update(widget.customWebViewWidget)
            },
          )),
          InputFieldContainer.inputContainer(
              child: Slider(
            value: widget.customWebViewWidget.height.toDouble(),
            onChanged: (d) {
              setState(() {
                widget.customWebViewWidget.height = d.toInt();
              });
            },
            max: 2000,
            min: widget.customWebViewWidget.height.toDouble() < 100
                ? widget.customWebViewWidget.height.toDouble()
                : 100,
            divisions: 1900,
          ))
        ]));
  }

  void onSelect(IobrokerObject? iobrokerObject) {
    widget.customWebViewWidget.dataPoint = iobrokerObject?.id;
    c.update(widget.customWebViewWidget);
  }
}
