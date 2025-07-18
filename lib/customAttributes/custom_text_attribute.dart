part of 'custom_attributes.dart';

class CustomTextAttribute extends CustomAttribute<String> {
  static String typeID = "customText";

  CustomTextAttribute({String data = "Error 401"}) : super(data: data);

  @override
  Map<String, dynamic> toJson() => {"type": typeID, "value": data};

  @override
  Widget get getSettingWidget => const CustomTextSetting();
}

class CustomTextSetting extends StatelessWidget {
  const CustomTextSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Ok");
  }
}
