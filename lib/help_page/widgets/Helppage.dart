import 'package:flutter/material.dart';

class WidgetHelpPage extends StatefulWidget {
  const WidgetHelpPage({Key? key}) : super(key: key);

  @override
  State<WidgetHelpPage> createState() => _WidgetHelpPageState();
}

class _WidgetHelpPageState extends State<WidgetHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help"),
      ),
      body: const Text("TODO"),
    );
  }
}
