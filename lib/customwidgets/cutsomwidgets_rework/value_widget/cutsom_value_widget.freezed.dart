// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cutsom_value_widget.dart';

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
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  set displayName(String value) => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  DataPoint? get dataPoint => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {String name,
      String displayName,
      @DataPointIdConverter() DataPoint? dataPoint});
}

/// @nodoc
class _$CustomValueWidgetCopyWithImpl<$Res, $Val extends CustomValueWidget>
    implements $CustomValueWidgetCopyWith<$Res> {
  _$CustomValueWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? displayName = null,
    Object? dataPoint = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoint: freezed == dataPoint
          ? _value.dataPoint
          : dataPoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
    ) as $Val);
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
      {String name,
      String displayName,
      @DataPointIdConverter() DataPoint? dataPoint});
}

/// @nodoc
class __$$CustomValueWidgetImplCopyWithImpl<$Res>
    extends _$CustomValueWidgetCopyWithImpl<$Res, _$CustomValueWidgetImpl>
    implements _$$CustomValueWidgetImplCopyWith<$Res> {
  __$$CustomValueWidgetImplCopyWithImpl(_$CustomValueWidgetImpl _value,
      $Res Function(_$CustomValueWidgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? displayName = null,
    Object? dataPoint = freezed,
  }) {
    return _then(_$CustomValueWidgetImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoint: freezed == dataPoint
          ? _value.dataPoint
          : dataPoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomValueWidgetImpl extends _CustomValueWidget {
  _$CustomValueWidgetImpl(
      {required this.name,
      required this.displayName,
      @DataPointIdConverter() required this.dataPoint})
      : super._();

  factory _$CustomValueWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomValueWidgetImplFromJson(json);

  @override
  String name;
  @override
  String displayName;
  @override
  @DataPointIdConverter()
  DataPoint? dataPoint;

  @override
  String toString() {
    return 'CustomValueWidget(name: $name, displayName: $displayName, dataPoint: $dataPoint)';
  }

  @JsonKey(ignore: true)
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
          {required String name,
          required String displayName,
          @DataPointIdConverter() required DataPoint? dataPoint}) =
      _$CustomValueWidgetImpl;
  _CustomValueWidget._() : super._();

  factory _CustomValueWidget.fromJson(Map<String, dynamic> json) =
      _$CustomValueWidgetImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  String get displayName;
  set displayName(String value);
  @override
  @DataPointIdConverter()
  DataPoint? get dataPoint;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value);
  @override
  @JsonKey(ignore: true)
  _$$CustomValueWidgetImplCopyWith<_$CustomValueWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
