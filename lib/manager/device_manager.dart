import 'dart:async';
import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:smart_home/database/app-database.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/device/iobroker_device.dart';
import 'package:smart_home/generated/state/state.pb.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/utils/pair.dart';

import '../device/device.dart';
import 'manager.dart';

class DeviceManager {
  FileManager fileManager;
  AppDatabase appDatabase = AppDatabase(null);
  Manager manager;
  List<Device> devicesList = [];
  StreamController deviceListStreamController = StreamController.broadcast();
  bool loaded = false;
  final String key = "devices";
  HashMap<String, dynamic> currentValues = HashMap<String, dynamic>();
  StreamController<Pair<String, dynamic>> objectValueStreams =
      StreamController.broadcast();

  DeviceManager(this.fileManager,
      {required this.devicesList, required this.manager});

  Future<List<Device>> loadDevices() async {
    //TODO Load devices from ioBroker sever if possible
    deviceListStreamController.add(devicesList);
    return devicesList;
  }

  void loadPossibleDataPoints(Map<String, dynamic> data) {}

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

  DataPoint? getIoBrokerDataPointByObjectIDSync(String objectID) {
    Manager().talker.error("Should not be used");
    return null;
  }

  Future<DataPoint?> getIoBrokerDataPointByObjectID(String objectID) async {
    String query =
        "SELECT * from ${appDatabase.statesTable.actualTableName} where id = ? LIMIT 1";
    List<QueryRow> resultRaw = await appDatabase
        .customSelect(query, variables: [Variable<String>(objectID)]).get();
    if (resultRaw.isNotEmpty) {
      return DataPoint(
          id: resultRaw[0].data["id"],
          name: resultRaw[0].data["state_name"],
          role: resultRaw[0].data["role"] ?? "No Role");
    }

    Manager().talker.error(
        "DeviceManager | getIoBrokerDataPointByObjectID | $objectID not found");
    return null;
  }

  Future<List<IobrokerObject>> getAllIobrokerObjects(
      {required int limit}) async {
    String query =
        "SELECT * from ${appDatabase.statesTable.actualTableName} LIMIT $limit";
    List<QueryRow> resultRaw =
        await appDatabase.customSelect(query, variables: []).get();
    List<IobrokerObject> result = resultRaw.map(
      (e) {
        return IobrokerObject(
            id: e.data["id"],
            name: e.data["state_name"],
            parent: e.data["parent"],
            desc: e.data["state_desc"],
            stateType: e.data["stateType"],
            read: e.data["read"] == 1 ? true : false,
            write: e.data["write"] == 1 ? true : false,
            role: e.data["role"] ?? "No Role",
            max: e.data["max"],
            min: e.data["min"],
            step: e.data["step"]);
      },
    ).toList();
    return result;
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
    currentValues[dataPoint.id] = value;
    //TODO valueChange
    objectValueStreams.sink
        .add(Pair<String, dynamic>(first: dataPoint.id, second: value));
    Manager()
        .talker
        .verbose("DeviceManager | valueChange | ${dataPoint.id} to $value");
  }

  T? getCurrentValue<T>(String dataPointID) {
    return currentValues[dataPointID] as T?;
  }

  void subscribeToDataPointsIoB(ConnectionManager connectionManager) {
    if (connectionManager.stateUpdateClientStub != null) {
      List<String> dataPoints =
          Manager().screenManager.getgetDependentDataPoints();
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
          .listen((value) async {
        Manager().talker.debug(
            "DeviceManager | stateSubscriptionStream | Recieved update from ${value.stateUpdates.length} states");
        Manager().talker.verbose(
                "DeviceManager | stateSubscriptionStream | Recieved updates: ${value.stateUpdates.map(
              (e) {
                return "${e.stateId}: [${e.boolValue}, ${e.doubleValue}, ${e.stringValue}]";
              },
            )}");

        for (StateValueUpdate update in value.stateUpdates) {
          DataPoint? d = await getIoBrokerDataPointByObjectID(update.stateId);
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

  Future<List<IobrokerObject>> searchIobrokerObjects(String search,
      {bool regex = false}) async {
    String query = regex
        ? "SELECT * from ${appDatabase.statesTable.actualTableName} where id REGEXP ? or state_name REGEXP ? or state_desc REGEXP ? LIMIT 250"
        : "SELECT * from ${appDatabase.statesTable.actualTableName} where id LIKE ? or state_name LIKE ? or state_desc LIKE ? LIMIT 250";
    List<QueryRow> resultRaw =
        await appDatabase.customSelect(query, variables: [
      Variable<String>(regex ? search : "%$search%"),
      Variable<String>(regex ? search : "%$search%"),
      Variable<String>(regex ? search : "%$search%")
    ]).get();

    List<IobrokerObject> result = resultRaw.map(
      (e) {
        return IobrokerObject(
            id: e.data["id"],
            name: e.data["state_name"],
            parent: e.data["parent"],
            desc: e.data["state_desc"],
            stateType: e.data["stateType"],
            read: e.data["read"] == 1 ? true : false,
            write: e.data["write"] == 1 ? true : false,
            role: e.data["role"] ?? "No Role",
            max: e.data["max"],
            min: e.data["min"],
            step: e.data["step"]);
      },
    ).toList();
    Manager().talker.verbose(
        "DeviceManager | searchIobrokerObjects found ${result.length} results for $search");
    return result;
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
      await appDatabase.statesTable.deleteAll();
      Manager()
          .talker
          .debug("DeviceManager | updateStates cleared statesTable");
      Manager().talker.debug(
          "DeviceManager | updateStates recievced ${allObjectsResults.states.length} states/objects");
      List<StatesTableCompanion> rowsToInsert =
          allObjectsResults.states.map((e) {
        return StatesTableCompanion.insert(
            id: e.stateId,
            read: e.common.read,
            write: e.common.write,
            stateName: Value(e.common.name),
            stateDesc: Value(e.common.desc));
      }).toList();
      appDatabase.batch(
        (batch) {
          batch.insertAll(appDatabase.statesTable, [...rowsToInsert]);
        },
      ).onError(
        (error, stackTrace) {
          Manager().talker.error(
              "DeviceManager | updateStates batch insert error; $error",
              stackTrace);
        },
      ).then(
        (value) async {
          Manager().talker.debug(
              "DeviceManager | updateStates batch inserted ${await appDatabase.statesTable.count().getSingle()}");
        },
      );
    }
  }
}
