// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_slider_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomSliderWidget _$CustomSliderWidgetFromJson(Map<String, dynamic> json) {
  return _CustomSliderWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomSliderWidget {
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
  int get max => throw _privateConstructorUsedError;
  set max(int value) => throw _privateConstructorUsedError;
  int get min => throw _privateConstructorUsedError;
  set min(int value) => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  set step(int value) => throw _privateConstructorUsedError;
  CustomPopupmenu? get customPopupmenu => throw _privateConstructorUsedError;
  set customPopupmenu(CustomPopupmenu? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomSliderWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomSliderWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomSliderWidgetCopyWith<CustomSliderWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomSliderWidgetCopyWith<$Res> {
  factory $CustomSliderWidgetCopyWith(
          CustomSliderWidget value, $Res Function(CustomSliderWidget) then) =
      _$CustomSliderWidgetCopyWithImpl<$Res, CustomSliderWidget>;
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      int max,
      int min,
      int step,
      CustomPopupmenu? customPopupmenu});

  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class _$CustomSliderWidgetCopyWithImpl<$Res, $Val extends CustomSliderWidget>
    implements $CustomSliderWidgetCopyWith<$Res> {
  _$CustomSliderWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomSliderWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? max = null,
    Object? min = null,
    Object? step = null,
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
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      customPopupmenu: freezed == customPopupmenu
          ? _value.customPopupmenu
          : customPopupmenu // ignore: cast_nullable_to_non_nullable
              as CustomPopupmenu?,
    ) as $Val);
  }

  /// Create a copy of CustomSliderWidget
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
abstract class _$$CustomSliderWidgetImplCopyWith<$Res>
    implements $CustomSliderWidgetCopyWith<$Res> {
  factory _$$CustomSliderWidgetImplCopyWith(_$CustomSliderWidgetImpl value,
          $Res Function(_$CustomSliderWidgetImpl) then) =
      __$$CustomSliderWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      int max,
      int min,
      int step,
      CustomPopupmenu? customPopupmenu});

  @override
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class __$$CustomSliderWidgetImplCopyWithImpl<$Res>
    extends _$CustomSliderWidgetCopyWithImpl<$Res, _$CustomSliderWidgetImpl>
    implements _$$CustomSliderWidgetImplCopyWith<$Res> {
  __$$CustomSliderWidgetImplCopyWithImpl(_$CustomSliderWidgetImpl _value,
      $Res Function(_$CustomSliderWidgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomSliderWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? max = null,
    Object? min = null,
    Object? step = null,
    Object? customPopupmenu = freezed,
  }) {
    return _then(_$CustomSliderWidgetImpl(
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
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      customPopupmenu: freezed == customPopupmenu
          ? _value.customPopupmenu
          : customPopupmenu // ignore: cast_nullable_to_non_nullable
              as CustomPopupmenu?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomSliderWidgetImpl extends _CustomSliderWidget {
  _$CustomSliderWidgetImpl(
      {this.type = CustomWidgetTypeDeprecated.slider,
      required this.id,
      required this.name,
      @DataPointIdConverter() required this.dataPoint,
      this.max = 100,
      this.min = 0,
      this.step = 10,
      this.customPopupmenu})
      : super._();

  factory _$CustomSliderWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomSliderWidgetImplFromJson(json);

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
  @JsonKey()
  int max;
  @override
  @JsonKey()
  int min;
  @override
  @JsonKey()
  int step;
  @override
  CustomPopupmenu? customPopupmenu;

  @override
  String toString() {
    return 'CustomSliderWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, max: $max, min: $min, step: $step, customPopupmenu: $customPopupmenu)';
  }

  /// Create a copy of CustomSliderWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomSliderWidgetImplCopyWith<_$CustomSliderWidgetImpl> get copyWith =>
      __$$CustomSliderWidgetImplCopyWithImpl<_$CustomSliderWidgetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomSliderWidgetImplToJson(
      this,
    );
  }
}

abstract class _CustomSliderWidget extends CustomSliderWidget
    implements CustomWidget {
  factory _CustomSliderWidget(
      {CustomWidgetTypeDeprecated type,
      required String id,
      required String name,
      @DataPointIdConverter() required DataPoint? dataPoint,
      int max,
      int min,
      int step,
      CustomPopupmenu? customPopupmenu}) = _$CustomSliderWidgetImpl;
  _CustomSliderWidget._() : super._();

  factory _CustomSliderWidget.fromJson(Map<String, dynamic> json) =
      _$CustomSliderWidgetImpl.fromJson;

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
  int get max;
  set max(int value);
  @override
  int get min;
  set min(int value);
  @override
  int get step;
  set step(int value);
  @override
  CustomPopupmenu? get customPopupmenu;
  set customPopupmenu(CustomPopupmenu? value);

  /// Create a copy of CustomSliderWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomSliderWidgetImplCopyWith<_$CustomSliderWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
