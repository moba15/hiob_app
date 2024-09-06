import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';

class CustomTableWidgetView extends StatefulWidget {
  final CustomTableWidget customTableWidget;
  const CustomTableWidgetView({Key? key, required this.customTableWidget})
      : super(key: key);

  @override
  State<CustomTableWidgetView> createState() => _CustomTableWidgetViewState();
}

class _CustomTableWidgetViewState extends State<CustomTableWidgetView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
