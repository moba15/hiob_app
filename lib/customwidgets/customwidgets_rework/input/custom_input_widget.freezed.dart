// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_input_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomInputWidget _$CustomInputWidgetFromJson(Map<String, dynamic> json) {
  return _CustomInputWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomInputWidget {
  CustomWidgetTypeDeprecated get type => throw _privateConstructorUsedError;
  set type(CustomWidgetTypeDeprecated value) =>
      throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  set label(String? value) => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  DataPoint? get dataPoint => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value) => throw _privateConstructorUsedError;
  String? get hintText => throw _privateConstructorUsedError;
  set hintText(String? value) => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  set suffix(String? value) => throw _privateConstructorUsedError;
  CustomPopupmenu? get customPopupmenu => throw _privateConstructorUsedError;
  set customPopupmenu(CustomPopupmenu? value) =>
      throw _privateConstructorUsedError;
  CustomInputSendMethod? get customInputSendMethod =>
      throw _privateConstructorUsedError;
  set customInputSendMethod(CustomInputSendMethod? value) =>
      throw _privateConstructorUsedError;
  CustomInputDisplayConentType? get customInputDisplayConentType =>
      throw _privateConstructorUsedError;
  set customInputDisplayConentType(CustomInputDisplayConentType? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomInputWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomInputWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomInputWidgetCopyWith<CustomInputWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomInputWidgetCopyWith<$Res> {
  factory $CustomInputWidgetCopyWith(
          CustomInputWidget value, $Res Function(CustomInputWidget) then) =
      _$CustomInputWidgetCopyWithImpl<$Res, CustomInputWidget>;
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      String? label,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? hintText,
      String? suffix,
      CustomPopupmenu? customPopupmenu,
      CustomInputSendMethod? customInputSendMethod,
      CustomInputDisplayConentType? customInputDisplayConentType});

  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class _$CustomInputWidgetCopyWithImpl<$Res, $Val extends CustomInputWidget>
    implements $CustomInputWidgetCopyWith<$Res> {
  _$CustomInputWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomInputWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? label = freezed,
    Object? dataPoint = freezed,
    Object? hintText = freezed,
    Object? suffix = freezed,
    Object? customPopupmenu = freezed,
    Object? customInputSendMethod = freezed,
    Object? customInputDisplayConentType = freezed,
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
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPoint: freezed == dataPoint
          ? _value.dataPoint
          : dataPoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
      customPopupmenu: freezed == customPopupmenu
          ? _value.customPopupmenu
          : customPopupmenu // ignore: cast_nullable_to_non_nullable
              as CustomPopupmenu?,
      customInputSendMethod: freezed == customInputSendMethod
          ? _value.customInputSendMethod
          : customInputSendMethod // ignore: cast_nullable_to_non_nullable
              as CustomInputSendMethod?,
      customInputDisplayConentType: freezed == customInputDisplayConentType
          ? _value.customInputDisplayConentType
          : customInputDisplayConentType // ignore: cast_nullable_to_non_nullable
              as CustomInputDisplayConentType?,
    ) as $Val);
  }

  /// Create a copy of CustomInputWidget
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
abstract class _$$CustomInputWidgetImplCopyWith<$Res>
    implements $CustomInputWidgetCopyWith<$Res> {
  factory _$$CustomInputWidgetImplCopyWith(_$CustomInputWidgetImpl value,
          $Res Function(_$CustomInputWidgetImpl) then) =
      __$$CustomInputWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      String? label,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? hintText,
      String? suffix,
      CustomPopupmenu? customPopupmenu,
      CustomInputSendMethod? customInputSendMethod,
      CustomInputDisplayConentType? customInputDisplayConentType});

  @override
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class __$$CustomInputWidgetImplCopyWithImpl<$Res>
    extends _$CustomInputWidgetCopyWithImpl<$Res, _$CustomInputWidgetImpl>
    implements _$$CustomInputWidgetImplCopyWith<$Res> {
  __$$CustomInputWidgetImplCopyWithImpl(_$CustomInputWidgetImpl _value,
      $Res Function(_$CustomInputWidgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomInputWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? label = freezed,
    Object? dataPoint = freezed,
    Object? hintText = freezed,
    Object? suffix = freezed,
    Object? customPopupmenu = freezed,
    Object? customInputSendMethod = freezed,
    Object? customInputDisplayConentType = freezed,
  }) {
    return _then(_$CustomInputWidgetImpl(
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
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPoint: freezed == dataPoint
          ? _value.dataPoint
          : dataPoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
      customPopupmenu: freezed == customPopupmenu
          ? _value.customPopupmenu
          : customPopupmenu // ignore: cast_nullable_to_non_nullable
              as CustomPopupmenu?,
      customInputSendMethod: freezed == customInputSendMethod
          ? _value.customInputSendMethod
          : customInputSendMethod // ignore: cast_nullable_to_non_nullable
              as CustomInputSendMethod?,
      customInputDisplayConentType: freezed == customInputDisplayConentType
          ? _value.customInputDisplayConentType
          : customInputDisplayConentType // ignore: cast_nullable_to_non_nullable
              as CustomInputDisplayConentType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomInputWidgetImpl extends _CustomInputWidget {
  _$CustomInputWidgetImpl(
      {this.type = CustomWidgetTypeDeprecated.input,
      required this.id,
      required this.name,
      this.label,
      @DataPointIdConverter() required this.dataPoint,
      this.hintText,
      this.suffix,
      this.customPopupmenu,
      this.customInputSendMethod,
      this.customInputDisplayConentType})
      : super._();

  factory _$CustomInputWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomInputWidgetImplFromJson(json);

  @override
  @JsonKey()
  CustomWidgetTypeDeprecated type;
  @override
  String id;
  @override
  String name;
  @override
  String? label;
  @override
  @DataPointIdConverter()
  DataPoint? dataPoint;
  @override
  String? hintText;
  @override
  String? suffix;
  @override
  CustomPopupmenu? customPopupmenu;
  @override
  CustomInputSendMethod? customInputSendMethod;
  @override
  CustomInputDisplayConentType? customInputDisplayConentType;

  @override
  String toString() {
    return 'CustomInputWidget(type: $type, id: $id, name: $name, label: $label, dataPoint: $dataPoint, hintText: $hintText, suffix: $suffix, customPopupmenu: $customPopupmenu, customInputSendMethod: $customInputSendMethod, customInputDisplayConentType: $customInputDisplayConentType)';
  }

  /// Create a copy of CustomInputWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomInputWidgetImplCopyWith<_$CustomInputWidgetImpl> get copyWith =>
      __$$CustomInputWidgetImplCopyWithImpl<_$CustomInputWidgetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomInputWidgetImplToJson(
      this,
    );
  }
}

abstract class _CustomInputWidget extends CustomInputWidget
    implements CustomWidget {
  factory _CustomInputWidget(
          {CustomWidgetTypeDeprecated type,
          required String id,
          required String name,
          String? label,
          @DataPointIdConverter() required DataPoint? dataPoint,
          String? hintText,
          String? suffix,
          CustomPopupmenu? customPopupmenu,
          CustomInputSendMethod? customInputSendMethod,
          CustomInputDisplayConentType? customInputDisplayConentType}) =
      _$CustomInputWidgetImpl;
  _CustomInputWidget._() : super._();

  factory _CustomInputWidget.fromJson(Map<String, dynamic> json) =
      _$CustomInputWidgetImpl.fromJson;

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
  String? get label;
  set label(String? value);
  @override
  @DataPointIdConverter()
  DataPoint? get dataPoint;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value);
  @override
  String? get hintText;
  set hintText(String? value);
  @override
  String? get suffix;
  set suffix(String? value);
  @override
  CustomPopupmenu? get customPopupmenu;
  set customPopupmenu(CustomPopupmenu? value);
  @override
  CustomInputSendMethod? get customInputSendMethod;
  set customInputSendMethod(CustomInputSendMethod? value);
  @override
  CustomInputDisplayConentType? get customInputDisplayConentType;
  set customInputDisplayConentType(CustomInputDisplayConentType? value);

  /// Create a copy of CustomInputWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomInputWidgetImplCopyWith<_$CustomInputWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
