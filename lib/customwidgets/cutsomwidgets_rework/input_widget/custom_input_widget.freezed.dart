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
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get hintText => throw _privateConstructorUsedError;
  set hintText(String value) => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  DataPoint? get dataPoint => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value) => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  set suffix(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {String name,
      String hintText,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? suffix});
}

/// @nodoc
class _$CustomInputWidgetCopyWithImpl<$Res, $Val extends CustomInputWidget>
    implements $CustomInputWidgetCopyWith<$Res> {
  _$CustomInputWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hintText = null,
    Object? dataPoint = freezed,
    Object? suffix = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hintText: null == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoint: freezed == dataPoint
          ? _value.dataPoint
          : dataPoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {String name,
      String hintText,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? suffix});
}

/// @nodoc
class __$$CustomInputWidgetImplCopyWithImpl<$Res>
    extends _$CustomInputWidgetCopyWithImpl<$Res, _$CustomInputWidgetImpl>
    implements _$$CustomInputWidgetImplCopyWith<$Res> {
  __$$CustomInputWidgetImplCopyWithImpl(_$CustomInputWidgetImpl _value,
      $Res Function(_$CustomInputWidgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hintText = null,
    Object? dataPoint = freezed,
    Object? suffix = freezed,
  }) {
    return _then(_$CustomInputWidgetImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hintText: null == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String,
      dataPoint: freezed == dataPoint
          ? _value.dataPoint
          : dataPoint // ignore: cast_nullable_to_non_nullable
              as DataPoint?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomInputWidgetImpl extends _CustomInputWidget {
  _$CustomInputWidgetImpl(
      {required this.name,
      required this.hintText,
      @DataPointIdConverter() required this.dataPoint,
      required this.suffix})
      : super._();

  factory _$CustomInputWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomInputWidgetImplFromJson(json);

  @override
  String name;
  @override
  String hintText;
  @override
  @DataPointIdConverter()
  DataPoint? dataPoint;
  @override
  String? suffix;

  @override
  String toString() {
    return 'CustomInputWidget(name: $name, hintText: $hintText, dataPoint: $dataPoint, suffix: $suffix)';
  }

  @JsonKey(ignore: true)
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
      {required String name,
      required String hintText,
      @DataPointIdConverter() required DataPoint? dataPoint,
      required String? suffix}) = _$CustomInputWidgetImpl;
  _CustomInputWidget._() : super._();

  factory _CustomInputWidget.fromJson(Map<String, dynamic> json) =
      _$CustomInputWidgetImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  String get hintText;
  set hintText(String value);
  @override
  @DataPointIdConverter()
  DataPoint? get dataPoint;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value);
  @override
  String? get suffix;
  set suffix(String? value);
  @override
  @JsonKey(ignore: true)
  _$$CustomInputWidgetImplCopyWith<_$CustomInputWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
