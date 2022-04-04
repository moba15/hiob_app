import '../device.dart';

class DataPoint {
  dynamic value;
  String name;
  String id;
  Device? device;

  DataPoint({required this.name, required this.device, required this.id});
}
