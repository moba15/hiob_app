import 'package:smart_home/customwidgets/custom_widget.dart';

class CustomWidgetTemplate {
  String id;
  CustomWidget customWidget;
  String name;

  CustomWidgetTemplate(
      {required this.id, required this.name, required this.customWidget});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "widget": customWidget.toJson(),
      };
}
