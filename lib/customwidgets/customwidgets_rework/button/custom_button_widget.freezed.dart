// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_button_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomButtonWidget _$CustomButtonWidgetFromJson(Map<String, dynamic> json) {
  return _CustomButtonWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomButtonWidget {
  CustomWidgetTypeDeprecated get type => throw _privateConstructorUsedError;
  set type(CustomWidgetTypeDeprecated value) =>
      throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  CustomPopupmenu? get customPopupmenu => throw _privateConstructorUsedError;
  set customPopupmenu(CustomPopupmenu? value) =>
      throw _privateConstructorUsedError;
  @_CustomButtonThemeConverter()
  CustomThemeForWidget? get customTheme => throw _privateConstructorUsedError;
  @_CustomButtonThemeConverter()
  set customTheme(CustomThemeForWidget? value) =>
      throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  set label(String? value) => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  DataPoint? get dataPoint => throw _privateConstructorUsedError;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value) => throw _privateConstructorUsedError;
  String? get buttonLabel => throw _privateConstructorUsedError;
  set buttonLabel(String? value) => throw _privateConstructorUsedError;

  /// Serializes this CustomButtonWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomButtonWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomButtonWidgetCopyWith<CustomButtonWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomButtonWidgetCopyWith<$Res> {
  factory $CustomButtonWidgetCopyWith(
    CustomButtonWidget value,
    $Res Function(CustomButtonWidget) then,
  ) = _$CustomButtonWidgetCopyWithImpl<$Res, CustomButtonWidget>;
  @useResult
  $Res call({
    CustomWidgetTypeDeprecated type,
    String id,
    String name,
    CustomPopupmenu? customPopupmenu,
    @_CustomButtonThemeConverter() CustomThemeForWidget? customTheme,
    String? label,
    @DataPointIdConverter() DataPoint? dataPoint,
    String? buttonLabel,
  });

  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class _$CustomButtonWidgetCopyWithImpl<$Res, $Val extends CustomButtonWidget>
    implements $CustomButtonWidgetCopyWith<$Res> {
  _$CustomButtonWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomButtonWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? customPopupmenu = freezed,
    Object? customTheme = freezed,
    Object? label = freezed,
    Object? dataPoint = freezed,
    Object? buttonLabel = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            customPopupmenu: freezed == customPopupmenu
                ? _value.customPopupmenu
                : customPopupmenu // ignore: cast_nullable_to_non_nullable
                      as CustomPopupmenu?,
            customTheme: freezed == customTheme
                ? _value.customTheme
                : customTheme // ignore: cast_nullable_to_non_nullable
                      as CustomThemeForWidget?,
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
            dataPoint: freezed == dataPoint
                ? _value.dataPoint
                : dataPoint // ignore: cast_nullable_to_non_nullable
                      as DataPoint?,
            buttonLabel: freezed == buttonLabel
                ? _value.buttonLabel
                : buttonLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CustomButtonWidget
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
abstract class _$$CustomButtonWidgetImplCopyWith<$Res>
    implements $CustomButtonWidgetCopyWith<$Res> {
  factory _$$CustomButtonWidgetImplCopyWith(
    _$CustomButtonWidgetImpl value,
    $Res Function(_$CustomButtonWidgetImpl) then,
  ) = __$$CustomButtonWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CustomWidgetTypeDeprecated type,
    String id,
    String name,
    CustomPopupmenu? customPopupmenu,
    @_CustomButtonThemeConverter() CustomThemeForWidget? customTheme,
    String? label,
    @DataPointIdConverter() DataPoint? dataPoint,
    String? buttonLabel,
  });

  @override
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class __$$CustomButtonWidgetImplCopyWithImpl<$Res>
    extends _$CustomButtonWidgetCopyWithImpl<$Res, _$CustomButtonWidgetImpl>
    implements _$$CustomButtonWidgetImplCopyWith<$Res> {
  __$$CustomButtonWidgetImplCopyWithImpl(
    _$CustomButtonWidgetImpl _value,
    $Res Function(_$CustomButtonWidgetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomButtonWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? customPopupmenu = freezed,
    Object? customTheme = freezed,
    Object? label = freezed,
    Object? dataPoint = freezed,
    Object? buttonLabel = freezed,
  }) {
    return _then(
      _$CustomButtonWidgetImpl(
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
        customPopupmenu: freezed == customPopupmenu
            ? _value.customPopupmenu
            : customPopupmenu // ignore: cast_nullable_to_non_nullable
                  as CustomPopupmenu?,
        customTheme: freezed == customTheme
            ? _value.customTheme
            : customTheme // ignore: cast_nullable_to_non_nullable
                  as CustomThemeForWidget?,
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
        dataPoint: freezed == dataPoint
            ? _value.dataPoint
            : dataPoint // ignore: cast_nullable_to_non_nullable
                  as DataPoint?,
        buttonLabel: freezed == buttonLabel
            ? _value.buttonLabel
            : buttonLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomButtonWidgetImpl extends _CustomButtonWidget {
  _$CustomButtonWidgetImpl({
    this.type = CustomWidgetTypeDeprecated.button,
    required this.id,
    required this.name,
    this.customPopupmenu,
    @_CustomButtonThemeConverter() this.customTheme,
    this.label,
    @DataPointIdConverter() required this.dataPoint,
    this.buttonLabel,
  }) : super._();

  factory _$CustomButtonWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomButtonWidgetImplFromJson(json);

  @override
  @JsonKey()
  CustomWidgetTypeDeprecated type;
  @override
  String id;
  @override
  String name;
  @override
  CustomPopupmenu? customPopupmenu;
  @override
  @_CustomButtonThemeConverter()
  CustomThemeForWidget? customTheme;
  @override
  String? label;
  @override
  @DataPointIdConverter()
  DataPoint? dataPoint;
  @override
  String? buttonLabel;

  @override
  String toString() {
    return 'CustomButtonWidget(type: $type, id: $id, name: $name, customPopupmenu: $customPopupmenu, customTheme: $customTheme, label: $label, dataPoint: $dataPoint, buttonLabel: $buttonLabel)';
  }

  /// Create a copy of CustomButtonWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomButtonWidgetImplCopyWith<_$CustomButtonWidgetImpl> get copyWith =>
      __$$CustomButtonWidgetImplCopyWithImpl<_$CustomButtonWidgetImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomButtonWidgetImplToJson(this);
  }
}

abstract class _CustomButtonWidget extends CustomButtonWidget
    implements CustomWidget {
  factory _CustomButtonWidget({
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    CustomPopupmenu? customPopupmenu,
    @_CustomButtonThemeConverter() CustomThemeForWidget? customTheme,
    String? label,
    @DataPointIdConverter() required DataPoint? dataPoint,
    String? buttonLabel,
  }) = _$CustomButtonWidgetImpl;
  _CustomButtonWidget._() : super._();

  factory _CustomButtonWidget.fromJson(Map<String, dynamic> json) =
      _$CustomButtonWidgetImpl.fromJson;

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
  CustomPopupmenu? get customPopupmenu;
  set customPopupmenu(CustomPopupmenu? value);
  @override
  @_CustomButtonThemeConverter()
  CustomThemeForWidget? get customTheme;
  @_CustomButtonThemeConverter()
  set customTheme(CustomThemeForWidget? value);
  @override
  String? get label;
  set label(String? value);
  @override
  @DataPointIdConverter()
  DataPoint? get dataPoint;
  @DataPointIdConverter()
  set dataPoint(DataPoint? value);
  @override
  String? get buttonLabel;
  set buttonLabel(String? value);

  /// Create a copy of CustomButtonWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomButtonWidgetImplCopyWith<_$CustomButtonWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
