import 'package:smart_home/customAttributes/custom_attributes.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';

class CustomTextWidget extends CustomWidget {
  static const String typeID = "custom_text:widget";
  final CustomTextAttribute text;

  CustomTextWidget({required this.text, required name})
      : super(name: name, type: typeID, settings: {"text": text.toJson()});

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
