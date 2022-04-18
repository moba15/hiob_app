import 'dart:async';
import 'dart:convert';

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
  String ip = "10.0.2.2";
  int port = 8090;

  DateTime? lastEnumUpdate;
  List<Enum> enums = [];

  final StreamController statusStreamController = StreamController();
  final StreamController<bool> connectionStatusStreamController = StreamController.broadcast(); //TODO: Kein Broadcast
  final StreamController<EnumUpdateState> enumsUpdateStateStreamController = StreamController.broadcast(); //TODO: Export into Cubit structure
  bool isUpdating = false;
  IoBrokerManager({required this.fileManager});

  void load() async {

    if((await fileManager.containsKey(key))) {
      Map<String, dynamic>? settings = await fileManager.getMap(key);
      ip = settings?["ip"] ?? "10.0.2.2";
      port = settings?["port"] ?? 8090;
    } else {
      ip =  "10.0.2.2";
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
    this.ip = ip;
    await fileManager.writeJSON(key, {
      "ip": ip,
      "port": port,
    });
  }

  void changePort(int port) async {
    this.port = port;
    await fileManager.writeJSON(key, {
      "ip": ip,
      "port": port,
    });
  }

  void updateEnums() {
    enumsUpdateStateStreamController.add(EnumUpdateState.loading);
    isUpdating = true;
    Manager.instance?.connectionManager.sendMsg(EnumUpdateRequestIobPackage());

  }

  void enumUpdate({required Map<String, dynamic> rawData}) {
    enums.clear();
    List<dynamic> enumsListRaw = jsonDecode(rawData["enums"]);
    for(Map<String, dynamic> enumRaw in enumsListRaw) {
      enums.add(Enum.fromJSON(enumRaw));
    }
    lastEnumUpdate = DateTime.now();
    fileManager.writeJSON(enumKey, {"lastUpdated": lastEnumUpdate?.millisecondsSinceEpoch, "enums": enums});
    enumsUpdateStateStreamController.add(EnumUpdateState.finished);
    isUpdating = false;
  }


  List<Enum> getEnumChilds(String currentID) {
    for(Enum e in enums) {
      return enums.where((element) {
      return element.id.startsWith(currentID) &&  element.id.replaceAll(currentID, "").split(".").length == 2;
    }).toList();
    }
    return [];
  }

  void exportEnumsToDevice() {
    for(Enum e in enums) {
      DeviceManager deviceManager = Manager.instance!.deviceManager;
      if(e.members.isNotEmpty) {
        if(deviceManager.devicesList.where((element) => element.name == e.name).isEmpty) {
          IoBrokerDevice device = IoBrokerDevice(
              id: Manager.instance!.getRandString(12),
              name: e.name,
              iconID: "ee98",
              lastUpdated: DateTime.now(),
              objectID: "");
          device.dataPoints = e.members.map((el) =>
              DataPoint(name: el
                  .split(".")
                  .last, device: device, id: el)).toList();
          deviceManager.addDevice(device);
        } else {
          Device device = deviceManager.devicesList.firstWhere((element) => element.name == e.name);
          if(device is IoBrokerDevice) {
            device.dataPoints ??= [];
            List<String> dataPoints = device.dataPoints?.map((e) => e.id).toList() ?? [];
            for(String d in e.members) {
              if(!dataPoints.contains(d)) {
                device.dataPoints?.add(DataPoint(name: d.split(".").last, device: device, id: d ));
                deviceManager.editDevice(device);
              }
            }
          }
        }
      }
    }
  }
}