import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/custom_divisionline_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';

import '../../../../manager/manager.dart';

class CustomGroupWidgetView extends StatelessWidget {
  final CustomGroupWidget customGroupWidget;
  const CustomGroupWidgetView({Key? key, required this.customGroupWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExpansionTile(
        onExpansionChanged: (v) {
          if (context.read<Manager>().generalManager.vibrateEnabled) {
            HapticFeedback.lightImpact();
          }
        },
        leading: customGroupWidget.iconID != null
            ? Icon(IconData(
                int.tryParse(customGroupWidget.iconID!, radix: 16) ?? 0,
                fontFamily: "MaterialIcons"))
            : null,
        initiallyExpanded: customGroupWidget.isExtended,
        textColor: Theme.of(context).colorScheme.onSurface,
        title: Text(
          customGroupWidget.name ?? "No Group Name Set",
          style: const TextStyle(fontSize: 25),
        ),
        children: customGroupWidget.templates.map((e) {
          if (e is CustomWidgetTemplate) {
            return e.customWidget.widget;
          } else if (e is CustomDivisionLineWidget) {
            return e.widget;
          } else {
            return const Text("Error 404");
          }
        }).toList(),
      ),
    ]);
  }
}
