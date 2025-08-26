// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_colorpicker_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomColorPickerWidget _$CustomColorPickerWidgetFromJson(
  Map<String, dynamic> json,
) {
  return _CustomColorPickerWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomColorPickerWidget {
  CustomWidgetTypeDeprecated get type => throw _privateConstructorUsedError;
  set type(CustomWidgetTypeDeprecated value) =>
      throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String? get dataPoint => throw _privateConstructorUsedError;
  set dataPoint(String? value) => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  set label(String? value) => throw _privateConstructorUsedError;
  String get prefix => throw _privateConstructorUsedError;
  set prefix(String value) => throw _privateConstructorUsedError;
  dynamic get alpha => throw _privateConstructorUsedError;
  set alpha(dynamic value) => throw _privateConstructorUsedError;
  dynamic get shadesSelection => throw _privateConstructorUsedError;
  set shadesSelection(dynamic value) => throw _privateConstructorUsedError;
  Map<ColorPickerType, bool> get pickersEnabled =>
      throw _privateConstructorUsedError;
  set pickersEnabled(Map<ColorPickerType, bool> value) =>
      throw _privateConstructorUsedError;
  CustomPopupmenu? get customPopupmenu => throw _privateConstructorUsedError;
  set customPopupmenu(CustomPopupmenu? value) =>
      throw _privateConstructorUsedError;
  @_CustomColorpickerThemeConverter()
  CustomThemeForWidget? get customTheme => throw _privateConstructorUsedError;
  @_CustomColorpickerThemeConverter()
  set customTheme(CustomThemeForWidget? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomColorPickerWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomColorPickerWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomColorPickerWidgetCopyWith<CustomColorPickerWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomColorPickerWidgetCopyWith<$Res> {
  factory $CustomColorPickerWidgetCopyWith(
    CustomColorPickerWidget value,
    $Res Function(CustomColorPickerWidget) then,
  ) = _$CustomColorPickerWidgetCopyWithImpl<$Res, CustomColorPickerWidget>;
  @useResult
  $Res call({
    CustomWidgetTypeDeprecated type,
    String id,
    String name,
    String? dataPoint,
    String? label,
    String prefix,
    dynamic alpha,
    dynamic shadesSelection,
    Map<ColorPickerType, bool> pickersEnabled,
    CustomPopupmenu? customPopupmenu,
    @_CustomColorpickerThemeConverter() CustomThemeForWidget? customTheme,
  });

  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class _$CustomColorPickerWidgetCopyWithImpl<
  $Res,
  $Val extends CustomColorPickerWidget
>
    implements $CustomColorPickerWidgetCopyWith<$Res> {
  _$CustomColorPickerWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomColorPickerWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? label = freezed,
    Object? prefix = null,
    Object? alpha = freezed,
    Object? shadesSelection = freezed,
    Object? pickersEnabled = null,
    Object? customPopupmenu = freezed,
    Object? customTheme = freezed,
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
            dataPoint: freezed == dataPoint
                ? _value.dataPoint
                : dataPoint // ignore: cast_nullable_to_non_nullable
                      as String?,
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
            prefix: null == prefix
                ? _value.prefix
                : prefix // ignore: cast_nullable_to_non_nullable
                      as String,
            alpha: freezed == alpha
                ? _value.alpha
                : alpha // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            shadesSelection: freezed == shadesSelection
                ? _value.shadesSelection
                : shadesSelection // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            pickersEnabled: null == pickersEnabled
                ? _value.pickersEnabled
                : pickersEnabled // ignore: cast_nullable_to_non_nullable
                      as Map<ColorPickerType, bool>,
            customPopupmenu: freezed == customPopupmenu
                ? _value.customPopupmenu
                : customPopupmenu // ignore: cast_nullable_to_non_nullable
                      as CustomPopupmenu?,
            customTheme: freezed == customTheme
                ? _value.customTheme
                : customTheme // ignore: cast_nullable_to_non_nullable
                      as CustomThemeForWidget?,
          )
          as $Val,
    );
  }

  /// Create a copy of CustomColorPickerWidget
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
abstract class _$$CustomColorPickerWidgetImplCopyWith<$Res>
    implements $CustomColorPickerWidgetCopyWith<$Res> {
  factory _$$CustomColorPickerWidgetImplCopyWith(
    _$CustomColorPickerWidgetImpl value,
    $Res Function(_$CustomColorPickerWidgetImpl) then,
  ) = __$$CustomColorPickerWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CustomWidgetTypeDeprecated type,
    String id,
    String name,
    String? dataPoint,
    String? label,
    String prefix,
    dynamic alpha,
    dynamic shadesSelection,
    Map<ColorPickerType, bool> pickersEnabled,
    CustomPopupmenu? customPopupmenu,
    @_CustomColorpickerThemeConverter() CustomThemeForWidget? customTheme,
  });

  @override
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class __$$CustomColorPickerWidgetImplCopyWithImpl<$Res>
    extends
        _$CustomColorPickerWidgetCopyWithImpl<
          $Res,
          _$CustomColorPickerWidgetImpl
        >
    implements _$$CustomColorPickerWidgetImplCopyWith<$Res> {
  __$$CustomColorPickerWidgetImplCopyWithImpl(
    _$CustomColorPickerWidgetImpl _value,
    $Res Function(_$CustomColorPickerWidgetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomColorPickerWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? label = freezed,
    Object? prefix = null,
    Object? alpha = freezed,
    Object? shadesSelection = freezed,
    Object? pickersEnabled = null,
    Object? customPopupmenu = freezed,
    Object? customTheme = freezed,
  }) {
    return _then(
      _$CustomColorPickerWidgetImpl(
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
                  as String?,
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
        prefix: null == prefix
            ? _value.prefix
            : prefix // ignore: cast_nullable_to_non_nullable
                  as String,
        alpha: freezed == alpha ? _value.alpha! : alpha,
        shadesSelection: freezed == shadesSelection
            ? _value.shadesSelection!
            : shadesSelection,
        pickersEnabled: null == pickersEnabled
            ? _value.pickersEnabled
            : pickersEnabled // ignore: cast_nullable_to_non_nullable
                  as Map<ColorPickerType, bool>,
        customPopupmenu: freezed == customPopupmenu
            ? _value.customPopupmenu
            : customPopupmenu // ignore: cast_nullable_to_non_nullable
                  as CustomPopupmenu?,
        customTheme: freezed == customTheme
            ? _value.customTheme
            : customTheme // ignore: cast_nullable_to_non_nullable
                  as CustomThemeForWidget?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomColorPickerWidgetImpl extends _CustomColorPickerWidget {
  _$CustomColorPickerWidgetImpl({
    this.type = CustomWidgetTypeDeprecated.colorPicker,
    required this.id,
    required this.name,
    required this.dataPoint,
    this.label,
    this.prefix = "0x",
    this.alpha = false,
    this.shadesSelection = true,
    this.pickersEnabled = const {},
    this.customPopupmenu,
    @_CustomColorpickerThemeConverter() this.customTheme,
  }) : super._();

  factory _$CustomColorPickerWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomColorPickerWidgetImplFromJson(json);

  @override
  @JsonKey()
  CustomWidgetTypeDeprecated type;
  @override
  String id;
  @override
  String name;
  @override
  String? dataPoint;
  @override
  String? label;
  @override
  @JsonKey()
  String prefix;
  @override
  @JsonKey()
  dynamic alpha;
  @override
  @JsonKey()
  dynamic shadesSelection;
  @override
  @JsonKey()
  Map<ColorPickerType, bool> pickersEnabled;
  @override
  CustomPopupmenu? customPopupmenu;
  @override
  @_CustomColorpickerThemeConverter()
  CustomThemeForWidget? customTheme;

  @override
  String toString() {
    return 'CustomColorPickerWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, prefix: $prefix, alpha: $alpha, shadesSelection: $shadesSelection, pickersEnabled: $pickersEnabled, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
  }

  /// Create a copy of CustomColorPickerWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomColorPickerWidgetImplCopyWith<_$CustomColorPickerWidgetImpl>
  get copyWith =>
      __$$CustomColorPickerWidgetImplCopyWithImpl<
        _$CustomColorPickerWidgetImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomColorPickerWidgetImplToJson(this);
  }
}

abstract class _CustomColorPickerWidget extends CustomColorPickerWidget
    implements CustomWidget {
  factory _CustomColorPickerWidget({
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    required String? dataPoint,
    String? label,
    String prefix,
    dynamic alpha,
    dynamic shadesSelection,
    Map<ColorPickerType, bool> pickersEnabled,
    CustomPopupmenu? customPopupmenu,
    @_CustomColorpickerThemeConverter() CustomThemeForWidget? customTheme,
  }) = _$CustomColorPickerWidgetImpl;
  _CustomColorPickerWidget._() : super._();

  factory _CustomColorPickerWidget.fromJson(Map<String, dynamic> json) =
      _$CustomColorPickerWidgetImpl.fromJson;

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
  String? get dataPoint;
  set dataPoint(String? value);
  @override
  String? get label;
  set label(String? value);
  @override
  String get prefix;
  set prefix(String value);
  @override
  dynamic get alpha;
  set alpha(dynamic value);
  @override
  dynamic get shadesSelection;
  set shadesSelection(dynamic value);
  @override
  Map<ColorPickerType, bool> get pickersEnabled;
  set pickersEnabled(Map<ColorPickerType, bool> value);
  @override
  CustomPopupmenu? get customPopupmenu;
  set customPopupmenu(CustomPopupmenu? value);
  @override
  @_CustomColorpickerThemeConverter()
  CustomThemeForWidget? get customTheme;
  @_CustomColorpickerThemeConverter()
  set customTheme(CustomThemeForWidget? value);

  /// Create a copy of CustomColorPickerWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomColorPickerWidgetImplCopyWith<_$CustomColorPickerWidgetImpl>
  get copyWith => throw _privateConstructorUsedError;
}
