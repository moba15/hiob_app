import 'package:flutter/material.dart';
import 'package:smart_home/device/object/iobroker_object.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io' as io;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class StateDatabase {
  Database? db;
  init() async {
    WidgetsFlutterBinding.ensureInitialized();
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    final io.Directory dir = await getApplicationCacheDirectory();
    String dbPath = p.join(dir.path, "databases", "myDb2.db");

    //TODO Make extra Manager for overall Database
    db = await databaseFactory.openDatabase(dbPath);

    await db!.execute(
        "CREATE TABLE IF NOT Exists states (id TEXT PRIMARY KEY, state_name TEXT, parent_id TEXT, state_desc TEXT, stateType INTEGER)");

    Manager().talker.debug("StateDatabase | init $dbPath");
  }

  insertBatch(List<IobrokerObject> objects, {bool deleteOldData = false}) async {
    Manager()
        .talker
        .debug("StateDatabse | insertBatch deletOldData=$deleteOldData");
    if (db == null) {
      Manager().talker.error("StateDatabase | insertBatch db=null or not open");
      return;
    }
    if (deleteOldData) {
      db!.execute("DELETE FROM states WHERE TRUE");
    }
    Batch batch = db!.batch();
    for (IobrokerObject object in objects) {
      //TODO Auto generated code for this sort of stuff, just like toJSON
      batch.insert("states",
          {"id": object.id, "state_name": object.name, "parent_id": object.parent,"state_desc": object.desc, "stateType": object.stateType});
    }
    await batch.commit(exclusive: true).onError( (error, stackTrace) async {
      Manager().talker.error("StateDatabase | insertBatch error :$error");
      return [];
   },);
   
   Manager().talker.debug("StateDatabase | insertBatch insereted ${objects.length} objects");
    
  }
}
