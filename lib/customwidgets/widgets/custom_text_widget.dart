import 'package:smart_home/customAttributes/custom_attributes.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';

class CustomTextWidget extends CustomWidget {
  static const String typeID = "custom_text:widget";
  final CustomTextAttribute text;

  CustomTextWidget({required this.text})
      : super(type: typeID, settings: {"text": text.toJson()});

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return super.toJson();
  }

  factory CustomTextWidget.fromJson(Map<String, dynamic> json) =>
      CustomTextWidget(
        text: CustomTextAttribute(data: "asdasd"), //TODO: Finish From JSON
      );
}
