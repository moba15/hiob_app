import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/screen/screen.dart';

class ScreenView extends StatelessWidget {
  final Screen screen;
  final int numberOfRows;
  const ScreenView(
      {super.key, required this.screen, required this.numberOfRows});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        List<dynamic> templates = screen.widgetTemplates;
        List<List<dynamic>> rows = List.generate(numberOfRows, (index) {
          List<dynamic> row = [];
          for (int i = index; i < templates.length; i += numberOfRows) {
            row.add(templates[i]);
          }
          return row;
        });
        rows.removeWhere((element) => element.isEmpty);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (List<dynamic> t in rows)
              Expanded(
                child: Column(
                  children: t.map((e) {
                    if (e is CustomWidgetWrapper) {
                      return Card(
                        child: e.widget,
                      );
                    } else if (e is CustomGroupWidget) {
                      return Card(
                        child: e.widget,
                      );
                    } else {
                      return const Text("Error 404");
                    }
                  }).toList(),
                ),
              )
          ],
        );
      },
    );
  }
}
