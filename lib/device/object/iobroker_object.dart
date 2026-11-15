import 'package:smart_home/model/device/device_interface.dart';

class IobrokerObject extends DeviceInterface {
  String? parent;

  IobrokerObject({
    required super.id,
    required super.name,
    required this.parent,
    required super.desc,
    required super.stateType,
    required super.read,
    required super.write,
    required super.role,
    required super.max,
    required super.min,
    required super.step,
  });
}
