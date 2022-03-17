import 'package:smart_home/customAttributes/custom_attributes.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';

class CustomTextWidget extends CustomWidget {
  static const List<CustomAttribute> attributes = [];
  static const String typeID = "custom_text:widget";
  CustomTextAttribute? text;

  CustomTextWidget({required this.text, required name})
      : super(name: name, type: typeID, settings: {"text": text?.toJson()});

  CustomTextWidget.edit() : super.edit();

  @override
  Map<String, dynamic> toJson() => {
        "type": typeID,
        "text": text,
      };

  factory CustomTextWidget.fromJson(Map<String, dynamic> json) =>
      CustomTextWidget(
        text: CustomTextAttribute(data: "assayed"),
        name: json["name"], //TODO: Finish From JSON ZCgRaLnf2Xsy5wGQN2pD
      );
}
