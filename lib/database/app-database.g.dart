// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app-database.dart';

// ignore_for_file: type=lint
class $StatesTableTable extends StatesTable
    with TableInfo<$StatesTableTable, StatesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _parentMeta = const VerificationMeta('parent');
  @override
  late final GeneratedColumn<String> parent = GeneratedColumn<String>(
    'parent',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES states_table (id)',
    ),
  );
  static const VerificationMeta _stateNameMeta = const VerificationMeta(
    'stateName',
  );
  @override
  late final GeneratedColumn<String> stateName = GeneratedColumn<String>(
    'state_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateDescMeta = const VerificationMeta(
    'stateDesc',
  );
  @override
  late final GeneratedColumn<String> stateDesc = GeneratedColumn<String>(
    'state_desc',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateTypeMeta = const VerificationMeta(
    'stateType',
  );
  @override
  late final GeneratedColumn<String> stateType = GeneratedColumn<String>(
    'state_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _readMeta = const VerificationMeta('read');
  @override
  late final GeneratedColumn<bool> read = GeneratedColumn<bool>(
    'read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("read" IN (0, 1))',
    ),
  );
  static const VerificationMeta _writeMeta = const VerificationMeta('write');
  @override
  late final GeneratedColumn<bool> write = GeneratedColumn<bool>(
    'write',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("write" IN (0, 1))',
    ),
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stepMeta = const VerificationMeta('step');
  @override
  late final GeneratedColumn<int> step = GeneratedColumn<int>(
    'step',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _maxMeta = const VerificationMeta('max');
  @override
  late final GeneratedColumn<int> max = GeneratedColumn<int>(
    'max',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _minMeta = const VerificationMeta('min');
  @override
  late final GeneratedColumn<int> min = GeneratedColumn<int>(
    'min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parent,
    stateName,
    stateDesc,
    stateType,
    read,
    write,
    role,
    unit,
    step,
    max,
    min,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'states_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StatesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('parent')) {
      context.handle(
        _parentMeta,
        parent.isAcceptableOrUnknown(data['parent']!, _parentMeta),
      );
    }
    if (data.containsKey('state_name')) {
      context.handle(
        _stateNameMeta,
        stateName.isAcceptableOrUnknown(data['state_name']!, _stateNameMeta),
      );
    }
    if (data.containsKey('state_desc')) {
      context.handle(
        _stateDescMeta,
        stateDesc.isAcceptableOrUnknown(data['state_desc']!, _stateDescMeta),
      );
    }
    if (data.containsKey('state_type')) {
      context.handle(
        _stateTypeMeta,
        stateType.isAcceptableOrUnknown(data['state_type']!, _stateTypeMeta),
      );
    }
    if (data.containsKey('read')) {
      context.handle(
        _readMeta,
        read.isAcceptableOrUnknown(data['read']!, _readMeta),
      );
    } else if (isInserting) {
      context.missing(_readMeta);
    }
    if (data.containsKey('write')) {
      context.handle(
        _writeMeta,
        write.isAcceptableOrUnknown(data['write']!, _writeMeta),
      );
    } else if (isInserting) {
      context.missing(_writeMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('step')) {
      context.handle(
        _stepMeta,
        step.isAcceptableOrUnknown(data['step']!, _stepMeta),
      );
    }
    if (data.containsKey('max')) {
      context.handle(
        _maxMeta,
        max.isAcceptableOrUnknown(data['max']!, _maxMeta),
      );
    }
    if (data.containsKey('min')) {
      context.handle(
        _minMeta,
        min.isAcceptableOrUnknown(data['min']!, _minMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  StatesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      parent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent'],
      ),
      stateName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_name'],
      ),
      stateDesc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_desc'],
      ),
      stateType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state_type'],
      ),
      read: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}read'],
      )!,
      write: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}write'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      step: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}step'],
      ),
      max: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max'],
      ),
      min: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}min'],
      ),
    );
  }

  @override
  $StatesTableTable createAlias(String alias) {
    return $StatesTableTable(attachedDatabase, alias);
  }
}

class StatesTableData extends DataClass implements Insertable<StatesTableData> {
  final String id;
  final String? parent;
  final String? stateName;
  final String? stateDesc;
  final String? stateType;
  final bool read;
  final bool write;
  final String? role;
  final String? unit;
  final int? step;
  final int? max;
  final int? min;
  const StatesTableData({
    required this.id,
    this.parent,
    this.stateName,
    this.stateDesc,
    this.stateType,
    required this.read,
    required this.write,
    this.role,
    this.unit,
    this.step,
    this.max,
    this.min,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || parent != null) {
      map['parent'] = Variable<String>(parent);
    }
    if (!nullToAbsent || stateName != null) {
      map['state_name'] = Variable<String>(stateName);
    }
    if (!nullToAbsent || stateDesc != null) {
      map['state_desc'] = Variable<String>(stateDesc);
    }
    if (!nullToAbsent || stateType != null) {
      map['state_type'] = Variable<String>(stateType);
    }
    map['read'] = Variable<bool>(read);
    map['write'] = Variable<bool>(write);
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || step != null) {
      map['step'] = Variable<int>(step);
    }
    if (!nullToAbsent || max != null) {
      map['max'] = Variable<int>(max);
    }
    if (!nullToAbsent || min != null) {
      map['min'] = Variable<int>(min);
    }
    return map;
  }

  StatesTableCompanion toCompanion(bool nullToAbsent) {
    return StatesTableCompanion(
      id: Value(id),
      parent: parent == null && nullToAbsent
          ? const Value.absent()
          : Value(parent),
      stateName: stateName == null && nullToAbsent
          ? const Value.absent()
          : Value(stateName),
      stateDesc: stateDesc == null && nullToAbsent
          ? const Value.absent()
          : Value(stateDesc),
      stateType: stateType == null && nullToAbsent
          ? const Value.absent()
          : Value(stateType),
      read: Value(read),
      write: Value(write),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      step: step == null && nullToAbsent ? const Value.absent() : Value(step),
      max: max == null && nullToAbsent ? const Value.absent() : Value(max),
      min: min == null && nullToAbsent ? const Value.absent() : Value(min),
    );
  }

  factory StatesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatesTableData(
      id: serializer.fromJson<String>(json['id']),
      parent: serializer.fromJson<String?>(json['parent']),
      stateName: serializer.fromJson<String?>(json['stateName']),
      stateDesc: serializer.fromJson<String?>(json['stateDesc']),
      stateType: serializer.fromJson<String?>(json['stateType']),
      read: serializer.fromJson<bool>(json['read']),
      write: serializer.fromJson<bool>(json['write']),
      role: serializer.fromJson<String?>(json['role']),
      unit: serializer.fromJson<String?>(json['unit']),
      step: serializer.fromJson<int?>(json['step']),
      max: serializer.fromJson<int?>(json['max']),
      min: serializer.fromJson<int?>(json['min']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parent': serializer.toJson<String?>(parent),
      'stateName': serializer.toJson<String?>(stateName),
      'stateDesc': serializer.toJson<String?>(stateDesc),
      'stateType': serializer.toJson<String?>(stateType),
      'read': serializer.toJson<bool>(read),
      'write': serializer.toJson<bool>(write),
      'role': serializer.toJson<String?>(role),
      'unit': serializer.toJson<String?>(unit),
      'step': serializer.toJson<int?>(step),
      'max': serializer.toJson<int?>(max),
      'min': serializer.toJson<int?>(min),
    };
  }

  StatesTableData copyWith({
    String? id,
    Value<String?> parent = const Value.absent(),
    Value<String?> stateName = const Value.absent(),
    Value<String?> stateDesc = const Value.absent(),
    Value<String?> stateType = const Value.absent(),
    bool? read,
    bool? write,
    Value<String?> role = const Value.absent(),
    Value<String?> unit = const Value.absent(),
    Value<int?> step = const Value.absent(),
    Value<int?> max = const Value.absent(),
    Value<int?> min = const Value.absent(),
  }) => StatesTableData(
    id: id ?? this.id,
    parent: parent.present ? parent.value : this.parent,
    stateName: stateName.present ? stateName.value : this.stateName,
    stateDesc: stateDesc.present ? stateDesc.value : this.stateDesc,
    stateType: stateType.present ? stateType.value : this.stateType,
    read: read ?? this.read,
    write: write ?? this.write,
    role: role.present ? role.value : this.role,
    unit: unit.present ? unit.value : this.unit,
    step: step.present ? step.value : this.step,
    max: max.present ? max.value : this.max,
    min: min.present ? min.value : this.min,
  );
  StatesTableData copyWithCompanion(StatesTableCompanion data) {
    return StatesTableData(
      id: data.id.present ? data.id.value : this.id,
      parent: data.parent.present ? data.parent.value : this.parent,
      stateName: data.stateName.present ? data.stateName.value : this.stateName,
      stateDesc: data.stateDesc.present ? data.stateDesc.value : this.stateDesc,
      stateType: data.stateType.present ? data.stateType.value : this.stateType,
      read: data.read.present ? data.read.value : this.read,
      write: data.write.present ? data.write.value : this.write,
      role: data.role.present ? data.role.value : this.role,
      unit: data.unit.present ? data.unit.value : this.unit,
      step: data.step.present ? data.step.value : this.step,
      max: data.max.present ? data.max.value : this.max,
      min: data.min.present ? data.min.value : this.min,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatesTableData(')
          ..write('id: $id, ')
          ..write('parent: $parent, ')
          ..write('stateName: $stateName, ')
          ..write('stateDesc: $stateDesc, ')
          ..write('stateType: $stateType, ')
          ..write('read: $read, ')
          ..write('write: $write, ')
          ..write('role: $role, ')
          ..write('unit: $unit, ')
          ..write('step: $step, ')
          ..write('max: $max, ')
          ..write('min: $min')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parent,
    stateName,
    stateDesc,
    stateType,
    read,
    write,
    role,
    unit,
    step,
    max,
    min,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatesTableData &&
          other.id == this.id &&
          other.parent == this.parent &&
          other.stateName == this.stateName &&
          other.stateDesc == this.stateDesc &&
          other.stateType == this.stateType &&
          other.read == this.read &&
          other.write == this.write &&
          other.role == this.role &&
          other.unit == this.unit &&
          other.step == this.step &&
          other.max == this.max &&
          other.min == this.min);
}

class StatesTableCompanion extends UpdateCompanion<StatesTableData> {
  final Value<String> id;
  final Value<String?> parent;
  final Value<String?> stateName;
  final Value<String?> stateDesc;
  final Value<String?> stateType;
  final Value<bool> read;
  final Value<bool> write;
  final Value<String?> role;
  final Value<String?> unit;
  final Value<int?> step;
  final Value<int?> max;
  final Value<int?> min;
  final Value<int> rowid;
  const StatesTableCompanion({
    this.id = const Value.absent(),
    this.parent = const Value.absent(),
    this.stateName = const Value.absent(),
    this.stateDesc = const Value.absent(),
    this.stateType = const Value.absent(),
    this.read = const Value.absent(),
    this.write = const Value.absent(),
    this.role = const Value.absent(),
    this.unit = const Value.absent(),
    this.step = const Value.absent(),
    this.max = const Value.absent(),
    this.min = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StatesTableCompanion.insert({
    required String id,
    this.parent = const Value.absent(),
    this.stateName = const Value.absent(),
    this.stateDesc = const Value.absent(),
    this.stateType = const Value.absent(),
    required bool read,
    required bool write,
    this.role = const Value.absent(),
    this.unit = const Value.absent(),
    this.step = const Value.absent(),
    this.max = const Value.absent(),
    this.min = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       read = Value(read),
       write = Value(write);
  static Insertable<StatesTableData> custom({
    Expression<String>? id,
    Expression<String>? parent,
    Expression<String>? stateName,
    Expression<String>? stateDesc,
    Expression<String>? stateType,
    Expression<bool>? read,
    Expression<bool>? write,
    Expression<String>? role,
    Expression<String>? unit,
    Expression<int>? step,
    Expression<int>? max,
    Expression<int>? min,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parent != null) 'parent': parent,
      if (stateName != null) 'state_name': stateName,
      if (stateDesc != null) 'state_desc': stateDesc,
      if (stateType != null) 'state_type': stateType,
      if (read != null) 'read': read,
      if (write != null) 'write': write,
      if (role != null) 'role': role,
      if (unit != null) 'unit': unit,
      if (step != null) 'step': step,
      if (max != null) 'max': max,
      if (min != null) 'min': min,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StatesTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? parent,
    Value<String?>? stateName,
    Value<String?>? stateDesc,
    Value<String?>? stateType,
    Value<bool>? read,
    Value<bool>? write,
    Value<String?>? role,
    Value<String?>? unit,
    Value<int?>? step,
    Value<int?>? max,
    Value<int?>? min,
    Value<int>? rowid,
  }) {
    return StatesTableCompanion(
      id: id ?? this.id,
      parent: parent ?? this.parent,
      stateName: stateName ?? this.stateName,
      stateDesc: stateDesc ?? this.stateDesc,
      stateType: stateType ?? this.stateType,
      read: read ?? this.read,
      write: write ?? this.write,
      role: role ?? this.role,
      unit: unit ?? this.unit,
      step: step ?? this.step,
      max: max ?? this.max,
      min: min ?? this.min,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (parent.present) {
      map['parent'] = Variable<String>(parent.value);
    }
    if (stateName.present) {
      map['state_name'] = Variable<String>(stateName.value);
    }
    if (stateDesc.present) {
      map['state_desc'] = Variable<String>(stateDesc.value);
    }
    if (stateType.present) {
      map['state_type'] = Variable<String>(stateType.value);
    }
    if (read.present) {
      map['read'] = Variable<bool>(read.value);
    }
    if (write.present) {
      map['write'] = Variable<bool>(write.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (step.present) {
      map['step'] = Variable<int>(step.value);
    }
    if (max.present) {
      map['max'] = Variable<int>(max.value);
    }
    if (min.present) {
      map['min'] = Variable<int>(min.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatesTableCompanion(')
          ..write('id: $id, ')
          ..write('parent: $parent, ')
          ..write('stateName: $stateName, ')
          ..write('stateDesc: $stateDesc, ')
          ..write('stateType: $stateType, ')
          ..write('read: $read, ')
          ..write('write: $write, ')
          ..write('role: $role, ')
          ..write('unit: $unit, ')
          ..write('step: $step, ')
          ..write('max: $max, ')
          ..write('min: $min, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StatesTableTable statesTable = $StatesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [statesTable];
}

typedef $$StatesTableTableCreateCompanionBuilder =
    StatesTableCompanion Function({
      required String id,
      Value<String?> parent,
      Value<String?> stateName,
      Value<String?> stateDesc,
      Value<String?> stateType,
      required bool read,
      required bool write,
      Value<String?> role,
      Value<String?> unit,
      Value<int?> step,
      Value<int?> max,
      Value<int?> min,
      Value<int> rowid,
    });
typedef $$StatesTableTableUpdateCompanionBuilder =
    StatesTableCompanion Function({
      Value<String> id,
      Value<String?> parent,
      Value<String?> stateName,
      Value<String?> stateDesc,
      Value<String?> stateType,
      Value<bool> read,
      Value<bool> write,
      Value<String?> role,
      Value<String?> unit,
      Value<int?> step,
      Value<int?> max,
      Value<int?> min,
      Value<int> rowid,
    });

final class $$StatesTableTableReferences
    extends BaseReferences<_$AppDatabase, $StatesTableTable, StatesTableData> {
  $$StatesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StatesTableTable _parentTable(_$AppDatabase db) =>
      db.statesTable.createAlias(
        $_aliasNameGenerator(db.statesTable.parent, db.statesTable.id),
      );

  $$StatesTableTableProcessedTableManager? get parent {
    final $_column = $_itemColumn<String>('parent');
    if ($_column == null) return null;
    final manager = $$StatesTableTableTableManager(
      $_db,
      $_db.statesTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StatesTableTableFilterComposer
    extends Composer<_$AppDatabase, $StatesTableTable> {
  $$StatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateName => $composableBuilder(
    column: $table.stateName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateDesc => $composableBuilder(
    column: $table.stateDesc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stateType => $composableBuilder(
    column: $table.stateType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get read => $composableBuilder(
    column: $table.read,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get write => $composableBuilder(
    column: $table.write,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get step => $composableBuilder(
    column: $table.step,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get max => $composableBuilder(
    column: $table.max,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get min => $composableBuilder(
    column: $table.min,
    builder: (column) => ColumnFilters(column),
  );

  $$StatesTableTableFilterComposer get parent {
    final $$StatesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parent,
      referencedTable: $db.statesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatesTableTableFilterComposer(
            $db: $db,
            $table: $db.statesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StatesTableTable> {
  $$StatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateName => $composableBuilder(
    column: $table.stateName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateDesc => $composableBuilder(
    column: $table.stateDesc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stateType => $composableBuilder(
    column: $table.stateType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get read => $composableBuilder(
    column: $table.read,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get write => $composableBuilder(
    column: $table.write,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get step => $composableBuilder(
    column: $table.step,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get max => $composableBuilder(
    column: $table.max,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get min => $composableBuilder(
    column: $table.min,
    builder: (column) => ColumnOrderings(column),
  );

  $$StatesTableTableOrderingComposer get parent {
    final $$StatesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parent,
      referencedTable: $db.statesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatesTableTableOrderingComposer(
            $db: $db,
            $table: $db.statesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatesTableTable> {
  $$StatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get stateName =>
      $composableBuilder(column: $table.stateName, builder: (column) => column);

  GeneratedColumn<String> get stateDesc =>
      $composableBuilder(column: $table.stateDesc, builder: (column) => column);

  GeneratedColumn<String> get stateType =>
      $composableBuilder(column: $table.stateType, builder: (column) => column);

  GeneratedColumn<bool> get read =>
      $composableBuilder(column: $table.read, builder: (column) => column);

  GeneratedColumn<bool> get write =>
      $composableBuilder(column: $table.write, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get step =>
      $composableBuilder(column: $table.step, builder: (column) => column);

  GeneratedColumn<int> get max =>
      $composableBuilder(column: $table.max, builder: (column) => column);

  GeneratedColumn<int> get min =>
      $composableBuilder(column: $table.min, builder: (column) => column);

  $$StatesTableTableAnnotationComposer get parent {
    final $$StatesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parent,
      referencedTable: $db.statesTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.statesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatesTableTable,
          StatesTableData,
          $$StatesTableTableFilterComposer,
          $$StatesTableTableOrderingComposer,
          $$StatesTableTableAnnotationComposer,
          $$StatesTableTableCreateCompanionBuilder,
          $$StatesTableTableUpdateCompanionBuilder,
          (StatesTableData, $$StatesTableTableReferences),
          StatesTableData,
          PrefetchHooks Function({bool parent})
        > {
  $$StatesTableTableTableManager(_$AppDatabase db, $StatesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> parent = const Value.absent(),
                Value<String?> stateName = const Value.absent(),
                Value<String?> stateDesc = const Value.absent(),
                Value<String?> stateType = const Value.absent(),
                Value<bool> read = const Value.absent(),
                Value<bool> write = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<int?> step = const Value.absent(),
                Value<int?> max = const Value.absent(),
                Value<int?> min = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatesTableCompanion(
                id: id,
                parent: parent,
                stateName: stateName,
                stateDesc: stateDesc,
                stateType: stateType,
                read: read,
                write: write,
                role: role,
                unit: unit,
                step: step,
                max: max,
                min: min,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> parent = const Value.absent(),
                Value<String?> stateName = const Value.absent(),
                Value<String?> stateDesc = const Value.absent(),
                Value<String?> stateType = const Value.absent(),
                required bool read,
                required bool write,
                Value<String?> role = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<int?> step = const Value.absent(),
                Value<int?> max = const Value.absent(),
                Value<int?> min = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatesTableCompanion.insert(
                id: id,
                parent: parent,
                stateName: stateName,
                stateDesc: stateDesc,
                stateType: stateType,
                read: read,
                write: write,
                role: role,
                unit: unit,
                step: step,
                max: max,
                min: min,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StatesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({parent = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (parent) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.parent,
                                referencedTable: $$StatesTableTableReferences
                                    ._parentTable(db),
                                referencedColumn: $$StatesTableTableReferences
                                    ._parentTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StatesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatesTableTable,
      StatesTableData,
      $$StatesTableTableFilterComposer,
      $$StatesTableTableOrderingComposer,
      $$StatesTableTableAnnotationComposer,
      $$StatesTableTableCreateCompanionBuilder,
      $$StatesTableTableUpdateCompanionBuilder,
      (StatesTableData, $$StatesTableTableReferences),
      StatesTableData,
      PrefetchHooks Function({bool parent})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StatesTableTableTableManager get statesTable =>
      $$StatesTableTableTableManager(_db, _db.statesTable);
}
