import 'dart:async';
import 'dart:convert';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/device/iobroker_device.dart';
import 'package:smart_home/ioBroker/enum/enum.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';

import '../../device/device.dart';
enum EnumUpdateState {
  loading, finished,none
}

class IoBrokerManager {

  final String key = "IoBrokerSettings";
  final String enumKey = "enums";

  bool loaded = false;
  bool connected = false;
  FileManager fileManager;
  String mainIp = "10.0.2.2";
  int port = 8090;
  String user = "user";
  String password = "password";


  bool useSecondaryAddress = false;
  String knownNetwork = "";
  String secondaryAddress = "";


  DateTime? lastEnumUpdate;
  List<Enum> enums = [];

  final StreamController statusStreamController = StreamController();
  final StreamController<EnumUpdateState> enumsUpdateStateStreamController = StreamController.broadcast(); //TODO: Export into Cubit structure
  bool isUpdating = false;
  IoBrokerManager({required this.fileManager});

  void load() async {

    if((await fileManager.containsKey(key))) {
      Map<String, dynamic>? settings = await fileManager.getMap(key);
      mainIp = settings?["ip"] ?? "10.0.2.2";
      port = settings?["port"] ?? 8090;
      user = settings?["user"] ?? "user";
      password = settings?["password"] ?? "password";
      knownNetwork = settings?["knownNetwork"] ?? "";
      secondaryAddress = settings?["secondaryAddress"] ?? "";
      useSecondaryAddress = settings?["useSecondaryAddress"] ?? false;

    } else {
      mainIp =  "10.0.2.2";
      port =  8090;
    }

    //Load Enums
    if((await fileManager.containsKey(enumKey))) {
      enumsUpdateStateStreamController.add(EnumUpdateState.loading);
      Map<String, dynamic>? enumsRaw = await fileManager.getMap(enumKey);
      lastEnumUpdate = DateTime.fromMillisecondsSinceEpoch(enumsRaw?["lastUpdated"]);
      List<dynamic> enumsListRaw = enumsRaw?["enums"] ?? [];
      for(Map<String, dynamic> enumRaw in enumsListRaw) {
        enums.add(Enum.fromJSON(enumRaw));
      }
      enumsUpdateStateStreamController.add(EnumUpdateState.finished);
    }


    statusStreamController.add(true);
    statusStreamController.close();
  }


  void changeIp(String ip) async {
    this.mainIp = ip;
    await fileManager.writeJSON(key, {
      "ip": mainIp,
      "port": port,
      "user": user,
      "password": password,
      "knownNetwork": knownNetwork,
      "secondaryAddress": secondaryAddress,
      "useSecondaryAddress": useSecondaryAddress
    });
  }

  void changePort(int port) async {
    this.port = port;
    await fileManager.writeJSON(key, {
      "ip": mainIp,
      "port": port,
      "user": user,
      "password": password,
      "knownNetwork": knownNetwork,
      "secondaryAddress": secondaryAddress,
      "useSecondaryAddress": useSecondaryAddress
    });
  }


  void changeUser(String user) async {
    this.user = user;
    await fileManager.writeJSON(key, {
      "ip": mainIp,
      "port": port,
      "user": user,
      "password": password,
      "knownNetwork": knownNetwork,
      "secondaryAddress": secondaryAddress,
      "useSecondaryAddress": useSecondaryAddress
    });
  }

  void changePassword(String password) async {
    this.password = password;
    await fileManager.writeJSON(key, {
      "ip": mainIp,
      "port": port,
      "user": user,
      "password": password,
      "knownNetwork": knownNetwork,
      "secondaryAddress": secondaryAddress,
      "useSecondaryAddress":useSecondaryAddress
    });
  }

  void changeKnownNetwork(String knownNetwork) async {
    this.knownNetwork = knownNetwork;
    await fileManager.writeJSON(key, {
      "ip": mainIp,
      "port": port,
      "user": user,
      "password": password,
      "knownNetwork": knownNetwork,
      "secondaryAddress": secondaryAddress,
      "useSecondaryAddress": useSecondaryAddress,
    });
  }

  void changeSecondaryAddress(String secondaryAddress) async {
    this.secondaryAddress = secondaryAddress;
    await fileManager.writeJSON(key, {
      "ip": mainIp,
      "port": port,
      "user": user,
      "password": password,
      "knownNetwork": knownNetwork,
      "secondaryAddress": secondaryAddress,
      "useSecondaryAddress": useSecondaryAddress,
    });
  }


  void changeUseSecondaryAddress(bool useSecondaryAddress) async {
    this.useSecondaryAddress = useSecondaryAddress;
    await fileManager.writeJSON(key, {
      "ip": mainIp,
      "port": port,
      "user": user,
      "password": password,
      "knownNetwork": knownNetwork,
      "secondaryAddress": secondaryAddress,
      "useSecondaryAddress": useSecondaryAddress,
    });
  }



  void updateEnums() {
    FlutterLogs.logInfo(
      "ioBrokerManager",
      "updateEnums",
      "Update Enums started",

    );
    enumsUpdateStateStreamController.add(EnumUpdateState.loading);
    isUpdating = true;
    Manager.instance?.connectionManager.sendMsg(EnumUpdateRequestIobPackage());

  }

  void enumUpdate({required Map<String, dynamic> rawData}) {
      enums.clear();
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      //log("Enum Update " + encoder.convert(rawData));
      FlutterLogs.logInfo("iobrokerManager", "enumUpdate", "Starting enumUpdate \n" + encoder.convert(rawData));


      List<dynamic> enumsListRaw = rawData["enums"];
     // FlutterLogs.logInfo("iobrokerManager", "enumUpdate", "rawData: " + rawData["enums"].toString());
      FlutterLogs.logInfo("iobrokerManager", "enumUpdate", "enumsListRaw: " + encoder.convert(enumsListRaw));
      for (Map<String, dynamic> enumRaw in enumsListRaw) {
        enums.add(Enum.fromJSON(enumRaw));
      }
      FlutterLogs.logInfo("iobrokerManager", "enumUpdate", "added ");
      lastEnumUpdate = DateTime.now();

      fileManager.writeJSON(enumKey, {
        "lastUpdated": lastEnumUpdate?.millisecondsSinceEpoch,
        "enums": enums
      });
      FlutterLogs.logInfo("iobrokerManager", "enumUpdate", "writeJSON");
      enumsUpdateStateStreamController.add(EnumUpdateState.finished);
      isUpdating = false;

  }

  void enumsClear() {
    enums.clear();

    lastEnumUpdate = null;
    fileManager.writeJSON(enumKey, {"lastUpdated": lastEnumUpdate?.millisecondsSinceEpoch, "enums": enums});
    enumsUpdateStateStreamController.add(EnumUpdateState.finished);
    isUpdating = false;
  }


  List<Enum> getEnumChildren(String currentID) {
    return enums.where((element) {
      return element.id.startsWith(currentID) &&  element.id.replaceAll(currentID, "").split(".").length == 2;
    }).toList();
  }

  void syncEnumsToDevice() {
    DeviceManager deviceManager = Manager.instance!.deviceManager;
    for(Enum e in enums) {
      if(e.dataPointMembers.isNotEmpty) {
        if(!deviceManager.devicesList.any((element) => element.name == e.name)) {
          IoBrokerDevice device = IoBrokerDevice(id: Manager.instance!.getRandString(12), name: e.name, iconID: "ee98", lastUpdated: DateTime.now(), objectID: "");
          device.dataPoints = e.dataPointMembers..forEach((element) {element.device = device;});
          deviceManager.addDevice(device);

        } else {
          Device device = deviceManager.devicesList.firstWhere((element) => element.name == e.name);
          if(device is IoBrokerDevice) {
            device.dataPoints ??= [];
            for(DataPoint d in e.dataPointMembers) {
              if(!device.dataPoints!.any((element) => element.id == d.id)) {
                device.dataPoints?.add(d..device = device);
                deviceManager.editDevice(device);
              } else {
                DataPoint dataPoint = device.dataPoints!.firstWhere((element) => element.id == d.id);
                dataPoint.otherDetails = d.otherDetails;
                dataPoint.name = d.name;
                dataPoint.type = d.type;
                dataPoint.role = d.role;
                deviceManager.editDevice(device);

              }
            }

          }
        }
      }
    }
    List<Device> removeDevice = [];
    Map<Device, List<DataPoint>> deleteDataPoint = {};
    for(Device device in deviceManager.devicesList) {
      if(!enums.any((element) => device.name == element.name)) {
        removeDevice.add(device);
        continue;
      }


      if(device.dataPoints != null && device.dataPoints!.isNotEmpty) {
        deleteDataPoint[device] = device.dataPoints!.where((element) => !enums.firstWhere((e2) => e2.name == device.name).dataPointMembers.any((e) => e.id == element.id)).toList();


      }


    }
    for(Device d in removeDevice) {
      deviceManager.removeDevice(d);
    }
    for(Device d in deleteDataPoint.keys) {
      if(d.dataPoints != null && deleteDataPoint[d] != null && deleteDataPoint[d]!.isNotEmpty) {
        d.dataPoints!.removeWhere((element) => deleteDataPoint[d]!.any((e) => e.id == element.id));



      }
    }

    deviceManager.subscribeToDataPointsIoB(Manager.instance!.connectionManager);
  }
}