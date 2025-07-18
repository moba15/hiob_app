part of 'custom_attributes.dart';

class CustomDeviceAttribute extends CustomAttribute<Device> {
  static String typeID = "customText";

  CustomDeviceAttribute({required Device device}) : super(data: device);

  @override
  Map<String, dynamic> toJson() => {
        "type": typeID,
        "device": data,
      };

  @override
  Widget get getSettingWidget => const CustomTextSetting();
}

class CustomDeviceSetting extends StatelessWidget {
  const CustomDeviceSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Ok");
  }
}
