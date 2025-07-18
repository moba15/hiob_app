import 'package:smart_home/device/state/state.dart';

class Enum {
  String name;
  String id;
  String? icon;
  List<String> members;
  List<DataPoint> dataPointMembers;

  Enum({
    required this.name,
    required this.id,
    required this.icon,
    required this.members,
    required this.dataPointMembers,
  });
}
