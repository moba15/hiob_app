import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_widget.dart';

class GraphWidgetSettings extends CustomWidgetSettingStatefulWidget {
  final GraphWidget graphWidget;
  const GraphWidgetSettings({Key? key, required this.graphWidget}) : super(key: key);

  @override
  State<GraphWidgetSettings> createState() => _GraphWidgetSettingsState();

  @override
  // TODO: implement customWidget
  CustomWidget get customWidget => graphWidget;

  @override
  // TODO: implement showKeys
  List<GlobalKey<State<StatefulWidget>>> get showKeys => throw UnimplementedError();

  @override
  bool validate() {
    // TODO: implement validate
    throw true;
  }
}

class _GraphWidgetSettingsState extends State<GraphWidgetSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20), 
        child: Column(
          children: [
            DropdownButton(items: items, onChanged: onChanged)
          ],
        )
    );
  }
}
