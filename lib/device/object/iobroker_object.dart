import 'package:smart_home/model/device/device_interface.dart';

class IobrokerObject extends DeviceInterface {
  String? name;
  String? parent;
  String? desc;
  String? stateType;
  bool? read;
  bool? write;
  String? role;
  int? step;
  int? min;
  int? max;
  IobrokerObject({
    required super.id,
    required this.name,
    required this.parent,
    required this.desc,
    required this.stateType,
    required this.read,
    required this.write,
    required this.role,
    required this.max,
    required this.min,
    required this.step,
  });
}
