// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_popupmenu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomPopupmenu _$CustomPopupmenuFromJson(Map<String, dynamic> json) {
  return _CustomPopupmenu.fromJson(json);
}

/// @nodoc
mixin _$CustomPopupmenu {
  @CustomWidgetConverter()
  List<CustomWidget> get customWidgets => throw _privateConstructorUsedError;
  @CustomWidgetConverter()
  set customWidgets(List<CustomWidget> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomPopupmenuCopyWith<CustomPopupmenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomPopupmenuCopyWith<$Res> {
  factory $CustomPopupmenuCopyWith(
          CustomPopupmenu value, $Res Function(CustomPopupmenu) then) =
      _$CustomPopupmenuCopyWithImpl<$Res, CustomPopupmenu>;
  @useResult
  $Res call({@CustomWidgetConverter() List<CustomWidget> customWidgets});
}

/// @nodoc
class _$CustomPopupmenuCopyWithImpl<$Res, $Val extends CustomPopupmenu>
    implements $CustomPopupmenuCopyWith<$Res> {
  _$CustomPopupmenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customWidgets = null,
  }) {
    return _then(_value.copyWith(
      customWidgets: null == customWidgets
          ? _value.customWidgets
          : customWidgets // ignore: cast_nullable_to_non_nullable
              as List<CustomWidget>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomPopupmenuImplCopyWith<$Res>
    implements $CustomPopupmenuCopyWith<$Res> {
  factory _$$CustomPopupmenuImplCopyWith(_$CustomPopupmenuImpl value,
          $Res Function(_$CustomPopupmenuImpl) then) =
      __$$CustomPopupmenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@CustomWidgetConverter() List<CustomWidget> customWidgets});
}

/// @nodoc
class __$$CustomPopupmenuImplCopyWithImpl<$Res>
    extends _$CustomPopupmenuCopyWithImpl<$Res, _$CustomPopupmenuImpl>
    implements _$$CustomPopupmenuImplCopyWith<$Res> {
  __$$CustomPopupmenuImplCopyWithImpl(
      _$CustomPopupmenuImpl _value, $Res Function(_$CustomPopupmenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customWidgets = null,
  }) {
    return _then(_$CustomPopupmenuImpl(
      customWidgets: null == customWidgets
          ? _value.customWidgets
          : customWidgets // ignore: cast_nullable_to_non_nullable
              as List<CustomWidget>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomPopupmenuImpl extends _CustomPopupmenu {
  _$CustomPopupmenuImpl({@CustomWidgetConverter() required this.customWidgets})
      : super._();

  factory _$CustomPopupmenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomPopupmenuImplFromJson(json);

  @override
  @CustomWidgetConverter()
  List<CustomWidget> customWidgets;

  @override
  String toString() {
    return 'CustomPopupmenu(customWidgets: $customWidgets)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomPopupmenuImplCopyWith<_$CustomPopupmenuImpl> get copyWith =>
      __$$CustomPopupmenuImplCopyWithImpl<_$CustomPopupmenuImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomPopupmenuImplToJson(
      this,
    );
  }
}

abstract class _CustomPopupmenu extends CustomPopupmenu {
  factory _CustomPopupmenu(
      {@CustomWidgetConverter()
      required List<CustomWidget> customWidgets}) = _$CustomPopupmenuImpl;
  _CustomPopupmenu._() : super._();

  factory _CustomPopupmenu.fromJson(Map<String, dynamic> json) =
      _$CustomPopupmenuImpl.fromJson;

  @override
  @CustomWidgetConverter()
  List<CustomWidget> get customWidgets;
  @CustomWidgetConverter()
  set customWidgets(List<CustomWidget> value);
  @override
  @JsonKey(ignore: true)
  _$$CustomPopupmenuImplCopyWith<_$CustomPopupmenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
