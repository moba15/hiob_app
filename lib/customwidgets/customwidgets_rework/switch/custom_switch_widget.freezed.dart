// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_switch_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomSwitchWidget _$CustomSwitchWidgetFromJson(Map<String, dynamic> json) {
  return _CustomSwitchWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomSwitchWidget {
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
  String get sendIfOn => throw _privateConstructorUsedError;
  set sendIfOn(String value) => throw _privateConstructorUsedError;
  String get sendIfOff => throw _privateConstructorUsedError;
  set sendIfOff(String value) => throw _privateConstructorUsedError;
  CustomPopupmenu? get customPopupmenu => throw _privateConstructorUsedError;
  set customPopupmenu(CustomPopupmenu? value) =>
      throw _privateConstructorUsedError;
  CustomThemeForWidget? get customTheme => throw _privateConstructorUsedError;
  set customTheme(CustomThemeForWidget? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomSwitchWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomSwitchWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomSwitchWidgetCopyWith<CustomSwitchWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomSwitchWidgetCopyWith<$Res> {
  factory $CustomSwitchWidgetCopyWith(
          CustomSwitchWidget value, $Res Function(CustomSwitchWidget) then) =
      _$CustomSwitchWidgetCopyWithImpl<$Res, CustomSwitchWidget>;
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? label,
      String sendIfOn,
      String sendIfOff,
      CustomPopupmenu? customPopupmenu,
      CustomThemeForWidget? customTheme});

  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class _$CustomSwitchWidgetCopyWithImpl<$Res, $Val extends CustomSwitchWidget>
    implements $CustomSwitchWidgetCopyWith<$Res> {
  _$CustomSwitchWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomSwitchWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? label = freezed,
    Object? sendIfOn = null,
    Object? sendIfOff = null,
    Object? customPopupmenu = freezed,
    Object? customTheme = freezed,
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
      sendIfOn: null == sendIfOn
          ? _value.sendIfOn
          : sendIfOn // ignore: cast_nullable_to_non_nullable
              as String,
      sendIfOff: null == sendIfOff
          ? _value.sendIfOff
          : sendIfOff // ignore: cast_nullable_to_non_nullable
              as String,
      customPopupmenu: freezed == customPopupmenu
          ? _value.customPopupmenu
          : customPopupmenu // ignore: cast_nullable_to_non_nullable
              as CustomPopupmenu?,
      customTheme: freezed == customTheme
          ? _value.customTheme
          : customTheme // ignore: cast_nullable_to_non_nullable
              as CustomThemeForWidget?,
    ) as $Val);
  }

  /// Create a copy of CustomSwitchWidget
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
abstract class _$$CustomSwitchWidgetImplCopyWith<$Res>
    implements $CustomSwitchWidgetCopyWith<$Res> {
  factory _$$CustomSwitchWidgetImplCopyWith(_$CustomSwitchWidgetImpl value,
          $Res Function(_$CustomSwitchWidgetImpl) then) =
      __$$CustomSwitchWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? label,
      String sendIfOn,
      String sendIfOff,
      CustomPopupmenu? customPopupmenu,
      CustomThemeForWidget? customTheme});

  @override
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class __$$CustomSwitchWidgetImplCopyWithImpl<$Res>
    extends _$CustomSwitchWidgetCopyWithImpl<$Res, _$CustomSwitchWidgetImpl>
    implements _$$CustomSwitchWidgetImplCopyWith<$Res> {
  __$$CustomSwitchWidgetImplCopyWithImpl(_$CustomSwitchWidgetImpl _value,
      $Res Function(_$CustomSwitchWidgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomSwitchWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? label = freezed,
    Object? sendIfOn = null,
    Object? sendIfOff = null,
    Object? customPopupmenu = freezed,
    Object? customTheme = freezed,
  }) {
    return _then(_$CustomSwitchWidgetImpl(
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
      sendIfOn: null == sendIfOn
          ? _value.sendIfOn
          : sendIfOn // ignore: cast_nullable_to_non_nullable
              as String,
      sendIfOff: null == sendIfOff
          ? _value.sendIfOff
          : sendIfOff // ignore: cast_nullable_to_non_nullable
              as String,
      customPopupmenu: freezed == customPopupmenu
          ? _value.customPopupmenu
          : customPopupmenu // ignore: cast_nullable_to_non_nullable
              as CustomPopupmenu?,
      customTheme: freezed == customTheme
          ? _value.customTheme
          : customTheme // ignore: cast_nullable_to_non_nullable
              as CustomThemeForWidget?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomSwitchWidgetImpl extends _CustomSwitchWidget {
  _$CustomSwitchWidgetImpl(
      {this.type = CustomWidgetTypeDeprecated.switchWidget,
      required this.id,
      required this.name,
      @DataPointIdConverter() required this.dataPoint,
      this.label,
      this.sendIfOn = "true",
      this.sendIfOff = "false",
      this.customPopupmenu,
      this.customTheme})
      : super._();

  factory _$CustomSwitchWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomSwitchWidgetImplFromJson(json);

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
  String sendIfOn;
  @override
  @JsonKey()
  String sendIfOff;
  @override
  CustomPopupmenu? customPopupmenu;
  @override
  CustomThemeForWidget? customTheme;

  @override
  String toString() {
    return 'CustomSwitchWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, sendIfOn: $sendIfOn, sendIfOff: $sendIfOff, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
  }

  /// Create a copy of CustomSwitchWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomSwitchWidgetImplCopyWith<_$CustomSwitchWidgetImpl> get copyWith =>
      __$$CustomSwitchWidgetImplCopyWithImpl<_$CustomSwitchWidgetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomSwitchWidgetImplToJson(
      this,
    );
  }
}

abstract class _CustomSwitchWidget extends CustomSwitchWidget
    implements CustomWidget {
  factory _CustomSwitchWidget(
      {CustomWidgetTypeDeprecated type,
      required String id,
      required String name,
      @DataPointIdConverter() required DataPoint? dataPoint,
      String? label,
      String sendIfOn,
      String sendIfOff,
      CustomPopupmenu? customPopupmenu,
      CustomThemeForWidget? customTheme}) = _$CustomSwitchWidgetImpl;
  _CustomSwitchWidget._() : super._();

  factory _CustomSwitchWidget.fromJson(Map<String, dynamic> json) =
      _$CustomSwitchWidgetImpl.fromJson;

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
  String get sendIfOn;
  set sendIfOn(String value);
  @override
  String get sendIfOff;
  set sendIfOff(String value);
  @override
  CustomPopupmenu? get customPopupmenu;
  set customPopupmenu(CustomPopupmenu? value);
  @override
  CustomThemeForWidget? get customTheme;
  set customTheme(CustomThemeForWidget? value);

  /// Create a copy of CustomSwitchWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomSwitchWidgetImplCopyWith<_$CustomSwitchWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
