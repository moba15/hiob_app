

import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';

class CustomGroupWidgetView extends StatelessWidget {
  final CustomGroupWidget customGroupWidget;
  const CustomGroupWidgetView({Key? key, required this.customGroupWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ListTile(
            title: Text(customGroupWidget.name ?? "No Group Name Set", style: TextStyle(fontSize: 25),),

          ),
          ... customGroupWidget.templates.map((e) => e.customWidget.widget).toList()
        ]
    );
  }
}
