import 'dart:async';
import 'dart:collection';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/database/app-database.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/generated/state/state.pbgrpc.dart';
import 'package:smart_home/manager/connection/connection_manager.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/model/device/device_interface.dart';
import 'package:smart_home/services/device/device_service_interface.dart';
import 'package:smart_home/services/logging/logging_service.dart';
import 'package:smart_home/utils/pair.dart';

class DeviceManager implements DeviceServiceInterface<IobrokerObject> {
  FileManager fileManager;
  LoggingService loggingService;
  ScreenManager screenManager;
  GeneralManager generalManager;
  AppDatabase appDatabase = AppDatabase(null);

  StreamController deviceListStreamController = StreamController.broadcast();
  bool loaded = false;
  final String key = "devices";
  HashMap<String, dynamic> currentValues = HashMap<String, dynamic>();
  final StreamController<Pair<String, dynamic>> _objectValueStreams =
      StreamController.broadcast();
  List<String> preDefinedFilters = [];

  DeviceManager(
    this.fileManager, {
    required this.loggingService,
    required this.screenManager,
    required this.generalManager,
  }) {
    _loadFilters();
  }

  void _loadFilters() async {
    var map = await fileManager.getMap(key);
    loggingService.debug("XX ${preDefinedFilters.length}");
    if (map != null && map.containsKey("filters")) {
      preDefinedFilters.clear();
      for (var x in map["filters"]) {
        preDefinedFilters.add(x);
      }
      // ignore: prefer_interpolation_to_compose_strings
    } else {}
  }

  @override
  void updateFilters(List<String> filters) {
    preDefinedFilters.clear();
    preDefinedFilters.addAll(filters);
    _updateData();
  }

  void _updateData() {
    Map<String, dynamic> map = {"filters": preDefinedFilters};
    fileManager.writeJSON(key, map).then((value) async {
      loggingService.debug("fileManager.writeJSON $value");
      var map = await fileManager.getMap(key);

      loggingService.debug(
        "fileManager.writeJSON $value ${map!.containsKey("filters")}",
      );
    });
  }

  @override
  Future<IobrokerObject?> getDeviceById({required String id}) async {
    String query =
        "SELECT * from ${appDatabase.statesTable.actualTableName} where id = ? LIMIT 1";
    List<QueryRow> result = (await appDatabase
        .customSelect(query, variables: [Variable<String>(id)])
        .get());
    if (result.isEmpty) {
      loggingService.error(
        "DeviceManager | getIoBrokerDataPointByObjectID | $id not found",
        id,
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

  @override
  Future<List<IobrokerObject>> getAllDevices({required int limit}) async {
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

  Future<bool> _controllDeviceByObject<T>(
    IobrokerObject? iobObject,
    T value,
  ) async {
    if (iobObject == null) {
      return false;
    }
    currentValues[iobObject.id] = value;
    // notify listeners
    _objectValueStreams.sink.add(
      Pair<String, dynamic>(first: iobObject.id, second: value),
    );
    // send to backend
    updateValue(iobObject.id, value);
    return true;
  }

  @override
  Future<bool> controllDevice<T>({
    required String deviceId,
    required T value,
  }) async {
    IobrokerObject? obj = await getDeviceById(id: deviceId);
    return await _controllDeviceByObject<T>(obj, value);
  }

  @override
  T? getDeviceValue<T>({required DeviceInterface device}) {
    return currentValues[device.id] as T?;
  }

  @override
  void listenToDeviceChanges({required List<DeviceInterface> devices}) async {
    final dataPoints = screenManager.getDependentDataPoints();
    loggingService.debug(
      "DeviceManager | subscribe to ${dataPoints.length} datapoints",
    );
    loggingService.warning(
      "DeviceManager | listenToDeviceChanges | subscription wiring moved out of DeviceManager during refactor",
    );
  }

  @override
  Future<List<IobrokerObject>> searchDevices({
    required String query,
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
            Variable<String>(query),
            Variable<String>(query),
            Variable<String>(query),
            Variable<String>("%$query%"),
            Variable<String>("%$query%"),
            Variable<String>("%$query%"),
          ],
        )
        .get()
        .onError((error, stackTrace) {
          loggingService.error(
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
    loggingService.verbose(
      "DeviceManager | searchIobrokerObjects found ${result.length} results for $query",
    );
    return result;
  }

  //TODO: abstract this to DeviceServiceInterface
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
      loggingService.error(
        "DeviceManager | searchIobrokerAdapaters | Error executing SQL statement",
        stackTrace,
      );

      return [];
    });

    List<String> result = resultRaw.map((e) {
      return e.data["adapter"] as String;
    }).toList();
    loggingService.verbose(
      "DeviceManager | searchIobrokerAdapaters found ${result.length} results",
    );
    return result;
  }

  void updateObjects(ConnectionManager connectionManager) async {
    if (connectionManager.stateUpdateClientStub != null) {
      loggingService.debug("DeviceManager | updateStates");
      AllObjectsResults allObjectsResults = await connectionManager
          .stateUpdateClientStub!
          .getAllObjects(AllObjectRequest(filterPatterns: []))
          .onError((error, stackTrace) {
            loggingService.error(
              "DeviceManager | updateStates $error",
              stackTrace,
            );
            generalManager.dialogStreamController.sink.add(
              (p0) => AlertDialog(
                title: const Text("Error"),
                content: const Text(
                  "Could not connect to the backend. Make sure you installed the newest Hiob adapter",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(p0).pop(),
                    child: const Text("OK"),
                  ),
                ],
              ),
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
      loggingService.debug(
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
            loggingService.error(
              "DeviceManager | updateStates batch insert error; $error",
              stackTrace,
            );
          })
          .then((value) async {
            loggingService.debug(
              "DeviceManager | updateStates batch inserted ${await appDatabase.statesTable.count().getSingle()}",
            );
          });
    }
  }

  @override
  Future<void> fetchAndUpdateDevices() {
    // TODO: implement fetchAndUpdateDevices
    throw UnimplementedError();
  }

  void updateValue(String id, Object? value) {
    throw UnimplementedError("Update value not implemented");
  }

  void valueChange(IobrokerObject d, String stringValue) {
    throw UnimplementedError("Value change not implemented");
  }

  @override
  Stream<Pair<String, dynamic>> get objectValueStream =>
      _objectValueStreams.stream;

  @override
  Future<List<String>> getSelectableFilters() async {
    return getIobrokerAdapaters();
  }
}
