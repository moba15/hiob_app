import 'package:drift/drift.dart';

class StatesTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get parent => text().nullable().references(StatesTable, #id)();
  TextColumn get stateName => text().nullable()();
  TextColumn get stateDesc => text().nullable()();
  TextColumn get stateType => text().nullable()();
  BoolColumn get read => boolean()();
  BoolColumn get write => boolean()();
  TextColumn get role => text().nullable()();
  TextColumn get unit => text().nullable()();
  IntColumn get step => integer().nullable()();
  IntColumn get max => integer().nullable()();
  IntColumn get min => integer().nullable()();
}
