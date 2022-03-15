import 'dart:async';

import 'package:smart_home/customwidgets/custom_widget.dart';

class CustomWidgetManager {
  final List<CustomWidget> templates = [];
  final StreamController<List<CustomWidget>> templatesStreamController =
      StreamController.broadcast();

  CustomWidgetManager();

  Future<void> loadTemplates() async {
    templatesStreamController.add(templates);
  }
}