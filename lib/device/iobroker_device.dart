import 'device.dart';







class IoBrokerDevice extends Device {
  IoBrokerDevice(
      {required String id,
      required String name,
      required String iconID,
      required DateTime lastUpdated,
      required this.objectID})
      : super(
            id: id,
            name: name,
            iconID: iconID,
            lastUpdated: lastUpdated,
            type: DeviceType.ioBroker);
  String objectID;








  factory IoBrokerDevice.fromJSON(Map<String, dynamic> json) =>
      IoBrokerDevice(
        id: json["id"],
        iconID: json["iconID"],
        name: json["name"],
        objectID: json["objectID"], lastUpdated: DateTime.now(),
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "iconID": iconID,
        "objectID": objectID,
        "type": type.index,
      };


  @override
  String toString() {
    return "Device: " + toJson().toString();
  }



}