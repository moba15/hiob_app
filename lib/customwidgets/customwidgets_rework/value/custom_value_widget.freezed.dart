// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_value_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomValueWidget _$CustomValueWidgetFromJson(Map<String, dynamic> json) {
  return _CustomValueWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomValueWidget {
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
  String? get label => throw _privateConstructorUsedError;
  set label(String? value) => throw _privateConstructorUsedError;
  Map<String, String> get valueMapper => throw _privateConstructorUsedError;
  set valueMapper(Map<String, String> value) =>
      throw _privateConstructorUsedError;
  CustomPopupmenu? get customPopupmenu => throw _privateConstructorUsedError;
  set customPopupmenu(CustomPopupmenu? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomValueWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomValueWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomValueWidgetCopyWith<CustomValueWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomValueWidgetCopyWith<$Res> {
  factory $CustomValueWidgetCopyWith(
          CustomValueWidget value, $Res Function(CustomValueWidget) then) =
      _$CustomValueWidgetCopyWithImpl<$Res, CustomValueWidget>;
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? label,
      Map<String, String> valueMapper,
      CustomPopupmenu? customPopupmenu});

  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class _$CustomValueWidgetCopyWithImpl<$Res, $Val extends CustomValueWidget>
    implements $CustomValueWidgetCopyWith<$Res> {
  _$CustomValueWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomValueWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? label = freezed,
    Object? valueMapper = null,
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
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      valueMapper: null == valueMapper
          ? _value.valueMapper
          : valueMapper // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      customPopupmenu: freezed == customPopupmenu
          ? _value.customPopupmenu
          : customPopupmenu // ignore: cast_nullable_to_non_nullable
              as CustomPopupmenu?,
    ) as $Val);
  }

  /// Create a copy of CustomValueWidget
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
abstract class _$$CustomValueWidgetImplCopyWith<$Res>
    implements $CustomValueWidgetCopyWith<$Res> {
  factory _$$CustomValueWidgetImplCopyWith(_$CustomValueWidgetImpl value,
          $Res Function(_$CustomValueWidgetImpl) then) =
      __$$CustomValueWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? label,
      Map<String, String> valueMapper,
      CustomPopupmenu? customPopupmenu});

  @override
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class __$$CustomValueWidgetImplCopyWithImpl<$Res>
    extends _$CustomValueWidgetCopyWithImpl<$Res, _$CustomValueWidgetImpl>
    implements _$$CustomValueWidgetImplCopyWith<$Res> {
  __$$CustomValueWidgetImplCopyWithImpl(_$CustomValueWidgetImpl _value,
      $Res Function(_$CustomValueWidgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomValueWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? label = freezed,
    Object? valueMapper = null,
    Object? customPopupmenu = freezed,
  }) {
    return _then(_$CustomValueWidgetImpl(
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
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      valueMapper: null == valueMapper
          ? _value.valueMapper
          : valueMapper // ignore: cast_nullable_to_non_nullable
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
class _$CustomValueWidgetImpl extends _CustomValueWidget {
  _$CustomValueWidgetImpl(
      {this.type = CustomWidgetTypeDeprecated.valueNew,
      required this.id,
      required this.name,
      @DataPointIdConverter() required this.dataPoint,
      this.label,
      this.valueMapper = const {},
      this.customPopupmenu})
      : super._();

  factory _$CustomValueWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomValueWidgetImplFromJson(json);

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
  String? label;
  @override
  @JsonKey()
  Map<String, String> valueMapper;
  @override
  CustomPopupmenu? customPopupmenu;

  @override
  String toString() {
    return 'CustomValueWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, valueMapper: $valueMapper, customPopupmenu: $customPopupmenu)';
  }

  /// Create a copy of CustomValueWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomValueWidgetImplCopyWith<_$CustomValueWidgetImpl> get copyWith =>
      __$$CustomValueWidgetImplCopyWithImpl<_$CustomValueWidgetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomValueWidgetImplToJson(
      this,
    );
  }
}

abstract class _CustomValueWidget extends CustomValueWidget
    implements CustomWidget {
  factory _CustomValueWidget(
      {CustomWidgetTypeDeprecated type,
      required String id,
      required String name,
      @DataPointIdConverter() required DataPoint? dataPoint,
      String? label,
      Map<String, String> valueMapper,
      CustomPopupmenu? customPopupmenu}) = _$CustomValueWidgetImpl;
  _CustomValueWidget._() : super._();

  factory _CustomValueWidget.fromJson(Map<String, dynamic> json) =
      _$CustomValueWidgetImpl.fromJson;

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
  String? get label;
  set label(String? value);
  @override
  Map<String, String> get valueMapper;
  set valueMapper(Map<String, String> value);
  @override
  CustomPopupmenu? get customPopupmenu;
  set customPopupmenu(CustomPopupmenu? value);

  /// Create a copy of CustomValueWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomValueWidgetImplCopyWith<_$CustomValueWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
