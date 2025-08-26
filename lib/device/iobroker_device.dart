import 'device.dart';

class IoBrokerDevice extends Device {
  IoBrokerDevice({
    required super.id,
    required super.name,
    required super.iconWrapper,
    required super.lastUpdated,
    required super.overrideDeviceStatus,
    required this.objectID,
    super.dataPoints,
  }) : super(type: DeviceType.ioBroker);
  String objectID;
}
