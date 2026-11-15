class DeviceInterface {
  String id;

  String? name;
  String? desc;
  String? stateType;
  bool? read;
  bool? write;
  String? role;
  int? step;
  int? min;
  int? max;

  DeviceInterface({
    required this.id,
    this.name,
    this.desc,
    this.stateType,
    this.read,
    this.write,
    this.role,
    this.max,
    this.min,
    this.step,
  });
}
