import 'package:flutter/material.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/divisionline/custom_divisionline_widget.dart';

class CustomDivisionlineWidgetView extends StatefulWidget {
  final CustomDivisionlineWidget customDivisionlineWidget;
  const CustomDivisionlineWidgetView(
      {Key? key, required this.customDivisionlineWidget})
      : super(key: key);

  @override
  State<CustomDivisionlineWidgetView> createState() =>
      _CustomDivisionlineWidgetViewState();
}

class _CustomDivisionlineWidgetViewState
    extends State<CustomDivisionlineWidgetView> {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: widget.customDivisionlineWidget.thickness.toDouble(),
    );
  }
}
