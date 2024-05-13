import 'dart:async';

import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
import 'package:smart_home/device/iobroker_device.dart';
import 'package:smart_home/ioBroker/enum/enum.dart';
import 'package:smart_home/manager/device_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/utils/icon_data_wrapper.dart';

import '../../device/device.dart';

enum EnumUpdateState { loading, finished, none }

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
  bool secureBox = false;
  String secureKey = "";
  bool useSecondaryAddress = false;
  String knownNetwork = "";
  String secondaryAddress = "";

  bool usePwd = true;

  bool useSecureConnection = false;

  DateTime? lastEnumUpdate;
  List<Enum> enums = [];

  final StreamController statusStreamController = StreamController();
  final StreamController<EnumUpdateState> enumsUpdateStateStreamController =
      StreamController.broadcast(); //TODO: Export into Cubit structure
  bool isUpdating = false;
  IoBrokerManager({required this.fileManager});

  void load() async {
    if ((await fileManager.containsKey(key))) {
      Map<String, dynamic>? settings = await fileManager.getMap(key);
      mainIp = settings?["ip"] ?? "10.0.2.2";
      port = settings?["port"] ?? 8090;
      user = settings?["user"] ?? "user";
      password = settings?["password"] ?? "password";
      secureBox = settings?["secureBox"] ?? false;
      secureKey = settings?["secureKey"] ?? "";
      knownNetwork = settings?["knownNetwork"] ?? "";
      secondaryAddress = settings?["secondaryAddress"] ?? "";
      useSecondaryAddress = settings?["useSecondaryAddress"] ?? false;
      useSecureConnection = settings?["useSecureConnection"] ?? false;

      usePwd = settings?["usePWD"] ?? true;
    } else {
      mainIp = "10.0.2.2";
      port = 8090;
    }

    //Load Enums
    if ((await fileManager.containsKey(enumKey))) {
      enumsUpdateStateStreamController.add(EnumUpdateState.loading);
      Map<String, dynamic>? enumsRaw = await fileManager.getMap(enumKey);
      lastEnumUpdate =
          DateTime.fromMillisecondsSinceEpoch(enumsRaw?["lastUpdated"]);
      List<dynamic> enumsListRaw = enumsRaw?["enums"] ?? [];
      for (Map<String, dynamic> enumRaw in enumsListRaw) {
        enums.add(Enum.fromJSON(enumRaw));
      }
      enumsUpdateStateStreamController.add(EnumUpdateState.finished);
    }

    statusStreamController.add(true);
    statusStreamController.close();
  }

  void changeSecurebox(bool secureBox) async {
    this.secureBox = secureBox;
    await _save();
  }

  void changeSecurekey(String secureKey) async {
    this.secureKey = secureKey;
    await _save();
  }

  void changeIp(String mainIp) async {
    this.mainIp = mainIp;
    _save();
  }

  void changePort(int port) async {
    this.port = port;
    await _save();
  }

  Future<void> _save() async {
    await fileManager.writeJSON(key, {
      "ip": mainIp,
      "port": port,
      "user": user,
      "password": password,
      "secureBox": secureBox,
      "secureKey": secureKey,
      "knownNetwork": knownNetwork,
      "secondaryAddress": secondaryAddress,
      "useSecondaryAddress": useSecondaryAddress,
      "usePWD": usePwd,
      "useSecureConnection": useSecureConnection
    });
  }

  void changeUser(String user) async {
    this.user = user;
    _save();
  }

  void changePassword(String password) async {
    this.password = password;
    _save();
  }

  void changeKnownNetwork(String knownNetwork) async {
    this.knownNetwork = knownNetwork;
    _save();
  }

  void changeSecondaryAddress(String secondaryAddress) async {
    this.secondaryAddress = secondaryAddress;
    _save();
  }

  void changeUseSecondaryAddress(bool useSecondaryAddress) async {
    this.useSecondaryAddress = useSecondaryAddress;
    _save();
  }

  void changeUsePWD(bool usePwd) {
    this.usePwd = usePwd;
    _save();
  }

  void changeUseSecureCon(bool useSecCon) {
    useSecureConnection = useSecCon;
    _save();
  }

  void updateEnums() {
    enumsUpdateStateStreamController.add(EnumUpdateState.loading);
    isUpdating = true;
    Manager.instance.connectionManager.sendMsg(EnumUpdateRequestIobPackage());
  }

  void enumUpdate({required Map<String, dynamic> rawData}) {
    enums.clear();
    //log("Enum Update " + encoder.convert(rawData));

    List<dynamic> enumsListRaw = rawData["enums"];
    // FlutterLogs.logInfo("iobrokerManager", "enumUpdate", "rawData: " + rawData["enums"].toString());
    for (Map<String, dynamic> enumRaw in enumsListRaw) {
      enums.add(Enum.fromJSON(enumRaw));
    }
    lastEnumUpdate = DateTime.now();

    fileManager.writeJSON(enumKey, {
      "lastUpdated": lastEnumUpdate?.millisecondsSinceEpoch,
      "enums": enums
    });
    enumsUpdateStateStreamController.add(EnumUpdateState.finished);
    isUpdating = false;
  }

  void enumsClear() {
    enums.clear();

    lastEnumUpdate = null;
    fileManager.writeJSON(enumKey, {
      "lastUpdated": lastEnumUpdate?.millisecondsSinceEpoch,
      "enums": enums
    });
    enumsUpdateStateStreamController.add(EnumUpdateState.finished);
    isUpdating = false;
  }

  List<Enum> getEnumChildren(String currentID) {
    return enums.where((element) {
      return element.id.startsWith(currentID) &&
          element.id.replaceAll(currentID, "").split(".").length == 2;
    }).toList();
  }

  void syncEnumsToDevice() {
    DeviceManager deviceManager = Manager.instance.deviceManager;
    for (Enum e in enums) {
      if (e.dataPointMembers.isNotEmpty) {
        if (!deviceManager.devicesList
            .any((element) => element.name == e.name)) {
          IoBrokerDevice device = IoBrokerDevice(
              id: Manager.instance.getRandString(12),
              name: e.name,
              overrideDeviceStatus: false,
              iconWrapper: const IconWrapper(),
              lastUpdated: DateTime.now(),
              objectID: "");
          device.dataPoints = e.dataPointMembers
            ..forEach((element) {
              element.device = device;
            });
          deviceManager.addDevice(device, false);
        } else {
          Device device = deviceManager.devicesList
              .firstWhere((element) => element.name == e.name);
          if (device is IoBrokerDevice) {
            device.dataPoints ??= [];
            for (DataPoint d in e.dataPointMembers) {
              if (!device.dataPoints!.any((element) => element.id == d.id)) {
                device.dataPoints?.add(d..device = device);
                deviceManager.editDevice(device, false);
              } else {
                DataPoint dataPoint = device.dataPoints!
                    .firstWhere((element) => element.id == d.id);
                dataPoint.otherDetails = d.otherDetails;
                dataPoint.name = d.name;
                dataPoint.type = d.type;
                dataPoint.role = d.role;

                deviceManager.editDevice(device, false);
              }
            }
          }
        }
      }
    }
    List<Device> removeDevice = [];
    Map<Device, List<DataPoint>> deleteDataPoint = {};
    for (Device device in deviceManager.devicesList) {
      if (!enums.any((element) => device.name == element.name)) {
        removeDevice.add(device);
        continue;
      }

      if (device.dataPoints != null && device.dataPoints!.isNotEmpty) {
        deleteDataPoint[device] = device.dataPoints!
            .where((element) => !enums
                .firstWhere((e2) => e2.name == device.name)
                .dataPointMembers
                .any((e) => e.id == element.id))
            .toList();
      }
    }
    for (Device d in removeDevice) {
      deviceManager.removeDevice(d);
    }
    for (Device d in deleteDataPoint.keys) {
      if (d.dataPoints != null &&
          deleteDataPoint[d] != null &&
          deleteDataPoint[d]!.isNotEmpty) {
        d.dataPoints!.removeWhere(
            (element) => deleteDataPoint[d]!.any((e) => e.id == element.id));
      }
    }

    deviceManager.subscribeToDataPointsIoB(Manager.instance.connectionManager);
  }
}
