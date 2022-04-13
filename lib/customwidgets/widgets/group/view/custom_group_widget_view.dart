

import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';

class CustomGroupWidgetView extends StatelessWidget {
  final CustomGroupWidget customGroupWidget;
  const CustomGroupWidgetView({Key? key, required this.customGroupWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("IconID " + customGroupWidget.iconID.toString());
    return Column(
        children: [
          ExpansionTile(
            leading: customGroupWidget.iconID != null ?Icon(IconData(int.tryParse(customGroupWidget.iconID!, radix: 16) ?? 0, fontFamily: "MaterialIcons")) : null,
            initiallyExpanded: customGroupWidget.isExtended,
            textColor: Theme.of(context).colorScheme.onSurface,
            title: Text(customGroupWidget.name ?? "No Group Name Set", style: const TextStyle(fontSize: 25),),
            children: customGroupWidget.templates.map((e) => e.customWidget.widget).toList(),
          ),

        ]
    );
  }
}
