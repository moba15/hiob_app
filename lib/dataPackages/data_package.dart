enum DataPackageType {
  requestEnums,
  enumPackage,
  iobStateChanged,
  iobStateChangeRequest,
  enumUpdateRequest,
  enumUpdate,
  subscribeToDataPoints,
  answerSubscribeToDataPoints,
  firstPingFromIob,
  firstPingFromIob2,
  subscribeHistory,
  historyDataUpdate,
  requestLogin,
  answerLogin,
  loginDeclined,
  wrongAesKey,
  setNewAes,
  loginApproved,
  loginKey,
  requestTemplatesSettings,
  templateSettingCreate,
  uploadTemplateSetting,
  uploadTemplateSettingSuccess,
  getTemplatesSetting,
  notification,
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
  EnumsPackage({required super.content})
    : super(type: DataPackageType.enumPackage);

  List<Map<String, dynamic>> getList() {
    return content["list"];
  }
}

class StateChangedIobPackage extends DataPackage {
  StateChangedIobPackage({required super.content})
    : super(type: DataPackageType.iobStateChanged);
}

class StateChangeRequestIobPackage extends DataPackage {
  StateChangeRequestIobPackage({
    required String stateID,
    required dynamic value,
  }) : super(
         type: DataPackageType.iobStateChangeRequest,
         content: {"stateID": stateID, "value": value},
       );
}

class EnumUpdateRequestIobPackage extends DataPackage {
  EnumUpdateRequestIobPackage()
    : super(
        type: DataPackageType.enumUpdateRequest,
        content: {"id": "enum.hiob.*"},
      );
}

class SubscribeToDataPointsIobPackage extends DataPackage {
  SubscribeToDataPointsIobPackage({required List<String> dataPoints})
    : super(
        type: DataPackageType.subscribeToDataPoints,
        content: {"dataPoints": dataPoints},
      );
}

class RequestLoginPackage extends DataPackage {
  RequestLoginPackage({
    required String? deviceName,
    required String? deviceID,
    required String? key,
    required String? user,
    required String? version,
    required String? password,
  }) : super(
         type: DataPackageType.requestLogin,
         content: {
           "deviceName": deviceName,
           "deviceID": deviceID,
           "key": key,
           "version": version,
           "user": user,
           "password": password,
         },
       );
}

class LoginAnswerPackage extends DataPackage {
  LoginAnswerPackage({required String key, required suc})
    : super(type: DataPackageType.answerLogin, content: {});
}

class FirstPingFromIobPackage extends DataPackage {
  FirstPingFromIobPackage()
    : super(type: DataPackageType.firstPingFromIob, content: {});
}

class RequestTemplateSettings extends DataPackage {
  RequestTemplateSettings()
    : super(type: DataPackageType.requestTemplatesSettings, content: {});
}

class CreateTemplateSetting extends DataPackage {
  CreateTemplateSetting({required String name})
    : super(
        type: DataPackageType.templateSettingCreate,
        content: {"name": name},
      );
}

class UploadTemplateSetting extends DataPackage {
  UploadTemplateSetting({
    required String name,
    String? devicesJSON,
    String? widgetsJSON,
    String? screensJSON,
  }) : super(
         type: DataPackageType.uploadTemplateSetting,
         content: {
           "name": name,
           "devices": devicesJSON,
           "screens": screensJSON,
           "widgets": widgetsJSON,
         },
       );
}

class GetTemplateSetting extends DataPackage {
  GetTemplateSetting({
    required String name,
    required bool device,
    required bool screen,
    required bool widget,
  }) : super(
         type: DataPackageType.getTemplatesSetting,
         content: {
           "name": name,
           "device": device,
           "screen": screen,
           "widget": widget,
         },
       );
}

class SubscribeOnlyToNotifications extends DataPackage {
  SubscribeOnlyToNotifications()
    : super(type: DataPackageType.notification, content: {});
}
