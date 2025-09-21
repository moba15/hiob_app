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
  StreamController deviceListStreamController = StreamController.broadcast();
  bool loaded = false;
  final String key = "devices";
  HashMap<String, dynamic> currentValues = HashMap<String, dynamic>();
  StreamController<Pair<String, dynamic>> objectValueStreams =
      StreamController.broadcast();
  List<String> preDefinedFilters = [];

  DeviceManager(this.fileManager, {required this.manager}) {}

  void loadFilters() async {
    var map = await fileManager.getMap(key);
    Manager().talker.debug("XX ${preDefinedFilters.length}");
    if (map != null && map.containsKey("filters")) {
      preDefinedFilters.clear();
      for (var x in map["filters"]) {
        preDefinedFilters.add(x);
      }
      // ignore: prefer_interpolation_to_compose_strings
    } else {}
  }

  void updateFilters(List<String> filters) {
    preDefinedFilters.clear();
    preDefinedFilters.addAll(filters);
    updateData();
  }

  void updateData() {
    Map<String, dynamic> map = {"filters": preDefinedFilters};
    fileManager.writeJSON(key, map).then((value) async {
      Manager().talker.debug("fileManager.writeJSON $value");
      var map = await fileManager.getMap(key);

      Manager().talker.debug(
        "fileManager.writeJSON $value ${map!.containsKey("filters")}",
      );
    });
  }

  Future<IobrokerObject?> getIoBrokerDataPointByObjectID(
    String objectID,
  ) async {
    String query =
        "SELECT * from ${appDatabase.statesTable.actualTableName} where id = ? LIMIT 1";
    List<QueryRow> result = (await appDatabase
        .customSelect(query, variables: [Variable<String>(objectID)])
        .get());
    if (result.isEmpty) {
      Manager().talker.error(
        "DeviceManager | getIoBrokerDataPointByObjectID | $objectID not found",
      );
      return null;
    }
    QueryRow e = result[0];

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
      step: e.data["step"],
    );
  }

  Future<List<IobrokerObject>> getAllIobrokerObjects({
    required int limit,
  }) async {
    String query =
        "SELECT * from ${appDatabase.statesTable.actualTableName} LIMIT $limit";
    List<QueryRow> resultRaw = await appDatabase
        .customSelect(query, variables: [])
        .get();
    List<IobrokerObject> result = resultRaw.map((e) {
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
        step: e.data["step"],
      );
    }).toList();
    return result;
  }

  void valueChange(IobrokerObject? iobObject, dynamic value) {
    if (iobObject == null) {
      return;
    }
    currentValues[iobObject.id] = value;
    //TODO valueChange
    objectValueStreams.sink.add(
      Pair<String, dynamic>(first: iobObject.id, second: value),
    );
  }

  T? getCurrentValue<T>(String dataPointID) {
    return currentValues[dataPointID] as T?;
  }

  void subscribeToDataPointsIoB(ConnectionManager connectionManager) async {
    if (connectionManager.stateUpdateClientStub != null) {
      List<String> dataPoints = Manager().screenManager
          .getDependentDataPoints();
      for (var d in dataPoints) {}
      manager.talker.debug(
        "DeviceManager | subscribe to ${dataPoints.length} datapoints",
      );
      StreamSubscription<StatesValueUpdate>? subscription = connectionManager
          .stateUpdateClientStub
          ?.subscibe(
            StateSubscribtion(
              type: StateSubscribtion_SubscriptionType.subscripe,
              stateIds: dataPoints,
            ),
          )
          .listen(
            (value) async {
              Manager().talker.debug(
                "DeviceManager | stateSubscriptionStream | Recieved update from ${value.stateUpdates.length} states",
              );
              Manager().talker.verbose(
                "DeviceManager | stateSubscriptionStream | Recieved updates: ${value.stateUpdates.map((e) {
                  return "${e.stateId}: [${e.boolValue}, ${e.doubleValue},  ${e.stringValue}]";
                })}",
              );

              for (StateValueUpdate update in value.stateUpdates) {
                IobrokerObject? d = await getIoBrokerDataPointByObjectID(
                  update.stateId,
                );
                if (d != null) {
                  valueChange(d, update.stringValue);
                } else {
                  Manager().talker.error(
                    "DeviceManager | stateSubscriptionStream | Datapoint ${update.stateId} not found",
                  );
                }
              }
            },
            onError: (e) {
              Manager().talker.error(
                "DeviceManager | stateSubscriptionStream  | onError: $e",
              );
              Manager().connectionManager.changeConnectionStatus(
                ConnectionStatus.error,
                message: "State subscription error: $e",
              );
            },
          );
      if (subscription == null) {
        Manager().talker.error(
          "DeviceManager | unable to create StreamSubscription for subscribed Datapoints",
        );
      }
    }
  }

  Stream<SearchStateResponse>? startSearch(
    Stream<SearchStateRequest> searchStream,
  ) {
    Manager().talker.debug("DeviceManager | startSearch ");
    if (manager.connectionManager.stateUpdateClientStub != null) {
      StreamController<SearchStateResponse> t = StreamController();
      //TODO Close streams

      StreamSubscription<SearchStateResponse> subscription = manager
          .connectionManager
          .stateUpdateClientStub!
          .searchStateStream(searchStream)
          .listen((value) {
            Manager().talker.verbose(
              value.states
                  .map((e) => e.stateId)
                  .reduce((value, element) => "$value,$element"),
            );
            t.sink.add(value);
          });
      return t.stream;
    }
    return null;
  }

  Future<List<IobrokerObject>> searchIobrokerObjects(
    String search, {
    Map<String, bool> filters = const {},
  }) async {
    String filterExpression = "";
    for (MapEntry<String, bool> entry in filters.entries) {
      if (entry.value == false) {
        continue;
      }
      if (filterExpression.isNotEmpty) {
        filterExpression += " OR ";
      }

      filterExpression += "id LIKE '${entry.key}%'";
    }

    String query =
        """select * from (SELECT * from ${appDatabase.statesTable.actualTableName} where (id REGEXP ? or state_name REGEXP ? or state_desc REGEXP ?) ${filterExpression.isNotEmpty ? "AND ($filterExpression)" : ""}
        UNION
        SELECT * from ${appDatabase.statesTable.actualTableName} where (id LIKE ? or state_name LIKE ? or state_desc LIKE ?) ${filterExpression.isNotEmpty ? "AND ($filterExpression)" : ""} )as z
        ORDER BY id,state_name,state_desc LIMIT 250
        """;
    List<QueryRow> resultRaw = await appDatabase
        .customSelect(
          query,
          variables: [
            Variable<String>(search),
            Variable<String>(search),
            Variable<String>(search),
            Variable<String>("%$search%"),
            Variable<String>("%$search%"),
            Variable<String>("%$search%"),
          ],
        )
        .get()
        .onError((error, stackTrace) {
          Manager().talker.error(
            "DeviceManager | searchIobrokerObjects | Error executing SQL statement: $query",
            stackTrace,
          );

          return [];
        });

    List<IobrokerObject> result = resultRaw.map((e) {
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
        step: e.data["step"],
      );
    }).toList();
    Manager().talker.verbose(
      "DeviceManager | searchIobrokerObjects found ${result.length} results for $search",
    );
    return result;
  }

  Future<List<String>> getIobrokerAdapaters() async {
    String query = """SELECT  DISTINCT	SUBSTR(id, 1, INSTR(id, '.')-1) 
    || '.' ||
		SUBSTR(SUBSTR(id, INSTR(id, '.')+1, length(id)), 1,INSTR(SUBSTR(id, INSTR(id, '.')+1, length(id)), '.')) as adapter
    FROM states_table""";
    List<QueryRow>
    resultRaw = await appDatabase.customSelect(query).get().onError((
      error,
      stackTrace,
    ) {
      Manager().talker.error(
        "DeviceManager | searchIobrokerAdapaters | Error executing SQL statement",
        stackTrace,
      );

      return [];
    });

    List<String> result = resultRaw.map((e) {
      return e.data["adapter"] as String;
    }).toList();
    Manager().talker.verbose(
      "DeviceManager | searchIobrokerAdapaters found ${result.length} results",
    );
    return result;
  }

  void updateObjects(ConnectionManager connectionManager) async {
    if (connectionManager.stateUpdateClientStub != null) {
      Manager().talker.debug("DeviceManager | updateStates");
      AllObjectsResults allObjectsResults = await connectionManager
          .stateUpdateClientStub!
          .getAllObjects(AllObjectRequest(filterPatterns: []))
          .onError((error, stackTrace) {
            Manager().talker.error(
              "DeviceManager | updateStates $error",
              stackTrace,
            );
            return AllObjectsResults(states: {});
          });

      Set<String> localId =
          (await appDatabase
                  .customSelect(
                    "SELECT id from (${appDatabase.statesTable.actualTableName})",
                  )
                  .get())
              .map((e) => e.data["id"] as String)
              .toSet();
      Set<String> serverIds = allObjectsResults.states
          .map((e) => e.stateId)
          .toSet();
      Set<String> toDelete = localId.difference(serverIds);
      Manager().talker.debug(
        "DeviceManager | updateStates recievced ${allObjectsResults.states.length} states/objects",
      );
      List<StatesTableCompanion> rowsToInsert = allObjectsResults.states.map((
        e,
      ) {
        return StatesTableCompanion.insert(
          id: e.stateId,
          read: e.common.read,
          write: e.common.write,
          stateName: Value(e.common.name),
          stateDesc: Value(e.common.desc),
        );
      }).toList();
      appDatabase
          .batch((batch) {
            if (toDelete.isNotEmpty) {
              batch.deleteWhere(
                appDatabase.statesTable,
                (t) => t.id.isIn(toDelete.toList()),
              );
            }

            batch.insertAll(appDatabase.statesTable, [
              ...rowsToInsert,
            ], mode: InsertMode.insertOrReplace);
          })
          .onError((error, stackTrace) {
            Manager().talker.error(
              "DeviceManager | updateStates batch insert error; $error",
              stackTrace,
            );
          })
          .then((value) async {
            Manager().talker.debug(
              "DeviceManager | updateStates batch inserted ${await appDatabase.statesTable.count().getSingle()}",
            );
          });
    }
  }
}
