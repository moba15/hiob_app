enum DataPackageType {
  requestEnums,
  enumPackage,
  iobStateChanged,
  iobStateChangeRequest,
  enumUpdateRequest,
  enumUpdate,
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
      content: {"id": "enum.app.*"});
}

