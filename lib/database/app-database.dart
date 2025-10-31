import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_home/database/tables/states-table-database.dart';

part 'app-database.g.dart';

@DriftDatabase(tables: [StatesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor? e) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 1;
  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
