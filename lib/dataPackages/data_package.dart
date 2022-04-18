enum DataPackageType {
  requestEnums,
  enumPackage,
  iobStateChanged,
  iobStateChangeRequest,
  enumUpdateRequest,
  enumUpdate,
  subscribeToDataPoints,
  firstPingFromIob,
}

class DataPackage {
  DataPackageType type;
  Map<String, dynamic> content;

  DataPackage({required this.type, required this.content});
}

class RequestEnumsPackage extends DataPackage {
  RequestEnumsPackage()
      : super(type: DataPackageType.requestEnums, content: {});
}

class EnumsPackage extends DataPackage {
  EnumsPackage({required Map<String, dynamic> content})
      : super(type: DataPackageType.enumPackage, content: content);

  List<Map<String, dynamic>> getList() {
    return content["list"];
  }
}

class StateChangedIobPackage extends DataPackage {
  StateChangedIobPackage({required Map<String, dynamic> content})
      : super(type: DataPackageType.iobStateChanged, content: content);
}

class StateChangeRequestIobPackage extends DataPackage {
  StateChangeRequestIobPackage(
      {required String stateID, required dynamic value})
      : super(
            type: DataPackageType.iobStateChangeRequest,
            content: {"stateID": stateID, "value": value});
}

class EnumUpdateRequestIobPackage extends DataPackage {
  EnumUpdateRequestIobPackage()
      : super(
      type: DataPackageType.enumUpdateRequest,
      content: {"id": "enum.hiob.*"});
}

class SubscribeToDataPointsIobPackage extends DataPackage {
  SubscribeToDataPointsIobPackage({required List<String> dataPoints})
      : super(
      type: DataPackageType.subscribeToDataPoints,
      content: {"dataPoints": dataPoints});
}

class FirstPingFromIobPackage extends DataPackage {
  FirstPingFromIobPackage()
      : super(
      type: DataPackageType.firstPingFromIob,
      content: {});
}

