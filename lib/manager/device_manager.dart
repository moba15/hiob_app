import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:ffi';

import 'package:grpc/grpc.dart';
import 'package:smart_home/dataPackages/data_package.dart';
import 'package:smart_home/database/state-database.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/device/iobroker_device.dart';
import 'package:smart_home/generated/state/state.pb.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/file_manager.dart';

import '../device/device.dart';
import 'manager.dart';

class DeviceManager {
  FileManager fileManager;
  StateDatabase stateDatabase = StateDatabase();
  Manager manager;
  List<Device> devicesList;
  StreamController deviceListStreamController = StreamController.broadcast();
  bool loaded = false;
  final String key = "devices";

  List<DataPoint> possibleDataPoints = [];

  DeviceManager(this.fileManager,
      {required this.devicesList, required this.manager});

  Future<List<Device>> loadDevices() async {
    await stateDatabase.init();

    if (loaded) {
      deviceListStreamController.add(devicesList);
      return devicesList;
    }

    List<dynamic>? l = await fileManager.getList(key);

    developer.log("Devices Raw Loaded $l",
        name: "de.bachmaiers/device_manager.dart",
        time: DateTime.now(),
        zone: Zone.current);
    if (l == null) {
      loaded = true;
      devicesList = [];
    } else {
      for (dynamic rawDevice in l) {
        Map<String, dynamic> rawMap = rawDevice;
        int? typeInt = rawMap["type"];
        if (typeInt == null) {
          throw Exception("Dumm?");
        }

        DeviceType type = DeviceType.values[typeInt];
        switch (type) {
          case DeviceType.ioBroker:
            devicesList.add(IoBrokerDevice.fromJSON(rawMap));
            break;
          default:
            throw UnimplementedError("Error");
        }
      }
    }
    loaded = true;
    sort();
    deviceListStreamController.add(devicesList);
    List<IobrokerObject> ioBObjects = [];
    for (Device d in devicesList) {
      for (DataPoint dataPoint in d.dataPoints ?? []) {
        if (ioBObjects.any(
          (element) => element.id == dataPoint.id,
        )) {
          continue;
        }
       // ioBObjects.add(IobrokerObject(
          //  id: dataPoint.id, name: dataPoint.name, parent: null, desc: "No desc", stateType: null));
      }
    }
   // stateDatabase.insertBatch(ioBObjects, deleteOldData: true);
    return devicesList;
  }

  void sort() {
    devicesList.sort(
      (a, b) => a.name.compareTo(b.name),
    );
  }

  void reload() async {
    devicesList.clear();
    List<dynamic>? l = await fileManager.getList(key);
    if (l == null) {
      loaded = true;
      devicesList = [];
    } else {
      for (dynamic rawDevice in l) {
        Map<String, dynamic> rawMap = rawDevice;
        int? typeInt = rawMap["type"];
        if (typeInt == null) {
          throw Exception("Dumm?");
        }

        DeviceType type = DeviceType.values[typeInt];
        switch (type) {
          case DeviceType.ioBroker:
            devicesList.add(IoBrokerDevice.fromJSON(rawMap));
            break;
          default:
            throw UnimplementedError("Error");
        }
      }
    }
    loaded = true;
    sort();
    deviceListStreamController.add(devicesList);
  }

  void startIdle() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      for (Device d in devicesList) {
        d.idle();
      }
    }
  }

  void loadPossibleDataPoints(Map<String, dynamic> data) {}

  bool _containsID(String id) {
    for (Device device in devicesList) {
      if (device.id == id) {
        return true;
      }
    }
    return false;
  }

  Future<bool> addDevice(Device device, bool send) async {
    while (_containsID(device.id)) {
      device.id = Manager.instance.getRandString(14);
    }
    devicesList.add(device);
    sort();
    bool suc = await fileManager.writeJSONList(key, devicesList);
    if (!suc) {
      devicesList.remove(device);
    }
    deviceListStreamController.add(devicesList);
    if (device.dataPoints != null && device.dataPoints!.isNotEmpty && send) {
      manager.connectionManager.sendMsg(SubscribeToDataPointsIobPackage(
          dataPoints: device.dataPoints!.map((e) => e.id).toList()));
    }

    return suc;
  }

  Future<bool> editDevice(Device device, bool send) async {
    sort();
    bool suc = await fileManager.writeJSONList(key, devicesList);
    deviceListStreamController.add(devicesList);
    if (device.dataPoints != null && device.dataPoints!.isNotEmpty && send) {
      manager.connectionManager.sendMsg(SubscribeToDataPointsIobPackage(
          dataPoints: device.dataPoints!.map((e) => e.id).toList()));
    }

    return suc;
  }

  Future<bool> removeDevice(Device device) async {
    devicesList.remove(device);
    bool suc = await fileManager.writeJSONList(key, devicesList);
    if (!suc) {
      devicesList.add(device);
    }
    deviceListStreamController.add(devicesList);

    return suc;
  }

  Future<bool> update() async {
    bool suc = await fileManager.writeJSONList(key, devicesList);
    deviceListStreamController.add(devicesList);
    return suc;
  }

  Future<bool> addDataPointToDevice(Device device, DataPoint dataPoint) async {
    device.addDataPoint(dataPoint);
    bool suc = await fileManager.writeJSONList(key, devicesList);
    if (!suc) {
      device.removeDataPoint(dataPoint);
    }
    deviceListStreamController.add(devicesList);
    if (device.dataPoints != null && device.dataPoints!.isNotEmpty) {
      manager.connectionManager.sendMsg(SubscribeToDataPointsIobPackage(
          dataPoints: device.dataPoints!.map((e) => e.id).toList()));
    }

    return suc;
  }

  bool existsDevice(String id) {
    return devicesList.indexWhere((element) => element.id == id) != -1;
  }

  Device? getDevice(String id) {
    for (Device d in devicesList) {
      if (d.id == id) {
        return d;
      }
    }
    return null;
  }

  IoBrokerDevice? getIoBrokerDeviceByObjectID(String objectID) {
    for (Device d in devicesList) {
      if (d is IoBrokerDevice) {
        IoBrokerDevice ioBd = d;
        if (ioBd.objectID == objectID) {
          return ioBd;
        }
      }
    }
    return null;
  }

  DataPoint? getIoBrokerDataPointByObjectID(String objectID) {
    for (Device d in devicesList) {
      for (DataPoint dataPoint in d.dataPoints ?? []) {
        if (dataPoint.id == objectID) {
          return dataPoint;
        }
      }
    }
    return null;
  }

  List<DataPoint>? getIoBrokerDataPointsByObjectID(String objectID) {
    List<DataPoint> dataPoints = [];
    for (Device d in devicesList) {
      for (DataPoint dataPoint in d.dataPoints ?? []) {
        if (dataPoint.id == objectID) {
          dataPoints.add(dataPoint);
        }
      }
    }
    return dataPoints;
  }

  void valueChange(DataPoint? dataPoint, dynamic value) {
    if (dataPoint == null) {
      return;
    }

    dataPoint.value = value;
    dataPoint.valueStreamController.add(value);
    dataPoint.device?.setFirstUpdate = true;
  }

  void subscribeToDataPointsIoB(ConnectionManager connectionManager) {
    if (connectionManager.stateUpdateClientStub != null) {
      List<String> dataPoints = [];
      for (Device device in devicesList) {
        if (device is IoBrokerDevice) {
          for (DataPoint dataPoint in device.dataPoints ?? []) {
            dataPoints.add(dataPoint.id);
          }
        }
      }
      manager.talker.debug(
          "DeviceManager | subscribe to ${dataPoints.length} datapoints");
      StreamSubscription<StatesValueUpdate>? subscription = connectionManager
          .stateUpdateClientStub
          ?.subscibe(StateSubscribtion(
              type: StateSubscribtion_SubscriptionType.subscripe,
              stateIds: dataPoints))
          .listen((value) {
        Manager().talker.debug(
            "DeviceManager | stateSubscriptionStream | Recieved update from ${value.stateUpdates.length} states");
        Manager().talker.verbose(
                "DeviceManager | stateSubscriptionStream | Recieved updates: ${value.stateUpdates.map(
              (e) {
                return "${e.stateId}: [${e.boolValue}, ${e.doubleValue}, ${e.stringValue}]";
              },
            )}");

        for (StateValueUpdate update in value.stateUpdates) {
          DataPoint? d = getIoBrokerDataPointByObjectID(update.stateId);
          if (d != null) {
            valueChange(d, update.stringValue);
          }
        }
      }, onError: (e) {
        Manager()
            .talker
            .error("DeviceManager | stateSubscriptionStream  | onError: $e");
      });
      if (subscription == null) {
        Manager().talker.error(
            "DeviceManager | unable to create StreamSubscription for subscribed Datapoints");
      }
    }
  }

  Stream<SearchStateResponse>? startSearch(
      Stream<SearchStateRequest> searchStream) {
    Manager().talker.debug("DeviceManager | startSearch ");
    if (manager.connectionManager.stateUpdateClientStub != null) {
      StreamController<SearchStateResponse> t = StreamController();
      //TODO Close streams

      StreamSubscription<SearchStateResponse> subscription = manager
          .connectionManager.stateUpdateClientStub!
          .searchStateStream(searchStream)
          .listen(
        (value) {
          Manager().talker.verbose(value.states.map((e) => e.stateId).reduce(
                (value, element) => "$value,$element",
              ));
          t.sink.add(value);
        },
      );
      return t.stream;
    }
    return null;
  }

  void updateObjects(ConnectionManager connectionManager) async {
    if (connectionManager.stateUpdateClientStub != null) {
      Manager().talker.debug("DeviceManager | updateStates");
      //TODO Possible filter
      AllObjectsResults allObjectsResults = await connectionManager
          .stateUpdateClientStub!
          .getAllObjects(AllObjectRequest())
          .onError(
        (error, stackTrace) {
          Manager()
              .talker
              .error("DeviceManager | updateStates $error", stackTrace);
          return AllObjectsResults(states: {});
        },
      );
      Manager().talker.debug(
          "DeviceManager | updateStates recievced ${allObjectsResults.states.length} states/objects");
      stateDatabase.insertBatch(
          allObjectsResults.states
              .map(
                (e) => IobrokerObject(
                    id: e.stateId, name: e.common.name, parent: null, desc: e.common.desc, stateType: e.common.type, role: e.common.type, read: e.common.read, write: e.common.write, min: e.common.min, max: e.common.max, step: e.common.step),
              )
              .toList(),
          deleteOldData: true);
    }
  }
}
