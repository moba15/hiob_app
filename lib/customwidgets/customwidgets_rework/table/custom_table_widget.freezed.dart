// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_table_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomTableWidget _$CustomTableWidgetFromJson(Map<String, dynamic> json) {
  return _CustomTableWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomTableWidget {
  CustomWidgetTypeDeprecated get type => throw _privateConstructorUsedError;
  set type(CustomWidgetTypeDeprecated value) =>
      throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  DataPoint? get dataPoint => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value) => throw _privateConstructorUsedError;
  String? get header => throw _privateConstructorUsedError;
  set header(String? value) => throw _privateConstructorUsedError;
  bool get sortAsc => throw _privateConstructorUsedError;
  set sortAsc(bool value) => throw _privateConstructorUsedError;
  int get initalSortColumn => throw _privateConstructorUsedError;
  set initalSortColumn(int value) => throw _privateConstructorUsedError;
  bool get initialSortEnabled => throw _privateConstructorUsedError;
  set initialSortEnabled(bool value) => throw _privateConstructorUsedError;
  int get elementsPerPage => throw _privateConstructorUsedError;
  set elementsPerPage(int value) => throw _privateConstructorUsedError;
  Map<String, String> get columns => throw _privateConstructorUsedError;
  set columns(Map<String, String> value) => throw _privateConstructorUsedError;
  CustomPopupmenu? get customPopupmenu => throw _privateConstructorUsedError;
  set customPopupmenu(CustomPopupmenu? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomTableWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomTableWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomTableWidgetCopyWith<CustomTableWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomTableWidgetCopyWith<$Res> {
  factory $CustomTableWidgetCopyWith(
          CustomTableWidget value, $Res Function(CustomTableWidget) then) =
      _$CustomTableWidgetCopyWithImpl<$Res, CustomTableWidget>;
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? header,
      bool sortAsc,
      int initalSortColumn,
      bool initialSortEnabled,
      int elementsPerPage,
      Map<String, String> columns,
      CustomPopupmenu? customPopupmenu});

  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class _$CustomTableWidgetCopyWithImpl<$Res, $Val extends CustomTableWidget>
    implements $CustomTableWidgetCopyWith<$Res> {
  _$CustomTableWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomTableWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? header = freezed,
    Object? sortAsc = null,
    Object? initalSortColumn = null,
    Object? initialSortEnabled = null,
    Object? elementsPerPage = null,
    Object? columns = null,
    Object? customPopupmenu = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CustomWidgetTypeDeprecated,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoint: freezed == dataPoint
          ? _value.dataPoint
          : dataPoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      sortAsc: null == sortAsc
          ? _value.sortAsc
          : sortAsc // ignore: cast_nullable_to_non_nullable
              as bool,
      initalSortColumn: null == initalSortColumn
          ? _value.initalSortColumn
          : initalSortColumn // ignore: cast_nullable_to_non_nullable
              as int,
      initialSortEnabled: null == initialSortEnabled
          ? _value.initialSortEnabled
          : initialSortEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      elementsPerPage: null == elementsPerPage
          ? _value.elementsPerPage
          : elementsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      customPopupmenu: freezed == customPopupmenu
          ? _value.customPopupmenu
          : customPopupmenu // ignore: cast_nullable_to_non_nullable
              as CustomPopupmenu?,
    ) as $Val);
  }

  /// Create a copy of CustomTableWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu {
    if (_value.customPopupmenu == null) {
      return null;
    }

    return $CustomPopupmenuCopyWith<$Res>(_value.customPopupmenu!, (value) {
      return _then(_value.copyWith(customPopupmenu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomTableWidgetImplCopyWith<$Res>
    implements $CustomTableWidgetCopyWith<$Res> {
  factory _$$CustomTableWidgetImplCopyWith(_$CustomTableWidgetImpl value,
          $Res Function(_$CustomTableWidgetImpl) then) =
      __$$CustomTableWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? header,
      bool sortAsc,
      int initalSortColumn,
      bool initialSortEnabled,
      int elementsPerPage,
      Map<String, String> columns,
      CustomPopupmenu? customPopupmenu});

  @override
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class __$$CustomTableWidgetImplCopyWithImpl<$Res>
    extends _$CustomTableWidgetCopyWithImpl<$Res, _$CustomTableWidgetImpl>
    implements _$$CustomTableWidgetImplCopyWith<$Res> {
  __$$CustomTableWidgetImplCopyWithImpl(_$CustomTableWidgetImpl _value,
      $Res Function(_$CustomTableWidgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomTableWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? header = freezed,
    Object? sortAsc = null,
    Object? initalSortColumn = null,
    Object? initialSortEnabled = null,
    Object? elementsPerPage = null,
    Object? columns = null,
    Object? customPopupmenu = freezed,
  }) {
    return _then(_$CustomTableWidgetImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CustomWidgetTypeDeprecated,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoint: freezed == dataPoint
          ? _value.dataPoint
          : dataPoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
      header: freezed == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      sortAsc: null == sortAsc
          ? _value.sortAsc
          : sortAsc // ignore: cast_nullable_to_non_nullable
              as bool,
      initalSortColumn: null == initalSortColumn
          ? _value.initalSortColumn
          : initalSortColumn // ignore: cast_nullable_to_non_nullable
              as int,
      initialSortEnabled: null == initialSortEnabled
          ? _value.initialSortEnabled
          : initialSortEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      elementsPerPage: null == elementsPerPage
          ? _value.elementsPerPage
          : elementsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      customPopupmenu: freezed == customPopupmenu
          ? _value.customPopupmenu
          : customPopupmenu // ignore: cast_nullable_to_non_nullable
              as CustomPopupmenu?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomTableWidgetImpl extends _CustomTableWidget {
  _$CustomTableWidgetImpl(
      {this.type = CustomWidgetTypeDeprecated.tableNew,
      required this.id,
      required this.name,
      @DataPointIdConverter() required this.dataPoint,
      this.header,
      this.sortAsc = false,
      this.initalSortColumn = 0,
      this.initialSortEnabled = false,
      this.elementsPerPage = 10,
      required this.columns,
      this.customPopupmenu})
      : super._();

  factory _$CustomTableWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomTableWidgetImplFromJson(json);

  @override
  @JsonKey()
  CustomWidgetTypeDeprecated type;
  @override
  String id;
  @override
  String name;
  @override
  @DataPointIdConverter()
  DataPoint? dataPoint;
  @override
  String? header;
  @override
  @JsonKey()
  bool sortAsc;
  @override
  @JsonKey()
  int initalSortColumn;
  @override
  @JsonKey()
  bool initialSortEnabled;
  @override
  @JsonKey()
  int elementsPerPage;
  @override
  Map<String, String> columns;
  @override
  CustomPopupmenu? customPopupmenu;

  @override
  String toString() {
    return 'CustomTableWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, header: $header, sortAsc: $sortAsc, initalSortColumn: $initalSortColumn, initialSortEnabled: $initialSortEnabled, elementsPerPage: $elementsPerPage, columns: $columns, customPopupmenu: $customPopupmenu)';
  }

  /// Create a copy of CustomTableWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomTableWidgetImplCopyWith<_$CustomTableWidgetImpl> get copyWith =>
      __$$CustomTableWidgetImplCopyWithImpl<_$CustomTableWidgetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomTableWidgetImplToJson(
      this,
    );
  }
}

abstract class _CustomTableWidget extends CustomTableWidget
    implements CustomWidget {
  factory _CustomTableWidget(
      {CustomWidgetTypeDeprecated type,
      required String id,
      required String name,
      @DataPointIdConverter() required DataPoint? dataPoint,
      String? header,
      bool sortAsc,
      int initalSortColumn,
      bool initialSortEnabled,
      int elementsPerPage,
      required Map<String, String> columns,
      CustomPopupmenu? customPopupmenu}) = _$CustomTableWidgetImpl;
  _CustomTableWidget._() : super._();

  factory _CustomTableWidget.fromJson(Map<String, dynamic> json) =
      _$CustomTableWidgetImpl.fromJson;

  @override
  CustomWidgetTypeDeprecated get type;
  set type(CustomWidgetTypeDeprecated value);
  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  @DataPointIdConverter()
  DataPoint? get dataPoint;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value);
  @override
  String? get header;
  set header(String? value);
  @override
  bool get sortAsc;
  set sortAsc(bool value);
  @override
  int get initalSortColumn;
  set initalSortColumn(int value);
  @override
  bool get initialSortEnabled;
  set initialSortEnabled(bool value);
  @override
  int get elementsPerPage;
  set elementsPerPage(int value);
  @override
  Map<String, String> get columns;
  set columns(Map<String, String> value);
  @override
  CustomPopupmenu? get customPopupmenu;
  set customPopupmenu(CustomPopupmenu? value);

  /// Create a copy of CustomTableWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomTableWidgetImplCopyWith<_$CustomTableWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
