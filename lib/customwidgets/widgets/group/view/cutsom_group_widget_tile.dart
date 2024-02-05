import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/customwidgets/widgets/group/view/settings/custom_group_widget_settings.dart';

class CustomGroupWidgetTile extends StatelessWidget {
  final CustomGroupWidget customGroupWidget;
  const CustomGroupWidgetTile({Key? key, required this.customGroupWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(customGroupWidget.name ?? "No Name Set for Group"),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => CustomGroupWidgetSettingsPage(
                      customGroupWidget: customGroupWidget,
                    )));
      },
      subtitle: const Text("Group"),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
    );
  }
}
