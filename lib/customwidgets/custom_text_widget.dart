import 'package:smart_home/customAttributes/custom_string.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';

class CustomTextWidget extends CustomWidget {

  static int typeID = 0;

  late CustomString content;

  CustomTextWidget({required Map<String, dynamic> json }) : super(json: json) {
    content = CustomString(json: json["content"]);
  }


  @override
  Map<String, dynamic> toJson() {

    return {
      "typeID" : typeID,
      "content": content.toJson(),
    };
  }

}