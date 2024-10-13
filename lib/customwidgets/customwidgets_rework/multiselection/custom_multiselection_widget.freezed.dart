// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_multiselection_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomMultiselectionWidget _$CustomMultiselectionWidgetFromJson(
    Map<String, dynamic> json) {
  return _CustomMultiselectionWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomMultiselectionWidget {
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
  Map<String, String> get selections => throw _privateConstructorUsedError;
  set selections(Map<String, String> value) =>
      throw _privateConstructorUsedError;
  DropdownMenuMode get dropdownMenuMode => throw _privateConstructorUsedError;
  set dropdownMenuMode(DropdownMenuMode value) =>
      throw _privateConstructorUsedError;
  @_CustomMultiselectionThemeConverter()
  CustomPopupmenu? get customPopupmenu => throw _privateConstructorUsedError;
  @_CustomMultiselectionThemeConverter()
  set customPopupmenu(CustomPopupmenu? value) =>
      throw _privateConstructorUsedError;
  @_CustomMultiselectionThemeConverter()
  CustomThemeForWidget? get customTheme => throw _privateConstructorUsedError;
  @_CustomMultiselectionThemeConverter()
  set customTheme(CustomThemeForWidget? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomMultiselectionWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomMultiselectionWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomMultiselectionWidgetCopyWith<CustomMultiselectionWidget>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomMultiselectionWidgetCopyWith<$Res> {
  factory $CustomMultiselectionWidgetCopyWith(CustomMultiselectionWidget value,
          $Res Function(CustomMultiselectionWidget) then) =
      _$CustomMultiselectionWidgetCopyWithImpl<$Res,
          CustomMultiselectionWidget>;
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? label,
      Map<String, String> selections,
      DropdownMenuMode dropdownMenuMode,
      @_CustomMultiselectionThemeConverter() CustomPopupmenu? customPopupmenu,
      @_CustomMultiselectionThemeConverter()
      CustomThemeForWidget? customTheme});

  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class _$CustomMultiselectionWidgetCopyWithImpl<$Res,
        $Val extends CustomMultiselectionWidget>
    implements $CustomMultiselectionWidgetCopyWith<$Res> {
  _$CustomMultiselectionWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomMultiselectionWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? label = freezed,
    Object? selections = null,
    Object? dropdownMenuMode = null,
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
      selections: null == selections
          ? _value.selections
          : selections // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      dropdownMenuMode: null == dropdownMenuMode
          ? _value.dropdownMenuMode
          : dropdownMenuMode // ignore: cast_nullable_to_non_nullable
              as DropdownMenuMode,
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

  /// Create a copy of CustomMultiselectionWidget
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
abstract class _$$CustomMultiselectionWidgetImplCopyWith<$Res>
    implements $CustomMultiselectionWidgetCopyWith<$Res> {
  factory _$$CustomMultiselectionWidgetImplCopyWith(
          _$CustomMultiselectionWidgetImpl value,
          $Res Function(_$CustomMultiselectionWidgetImpl) then) =
      __$$CustomMultiselectionWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomWidgetTypeDeprecated type,
      String id,
      String name,
      @DataPointIdConverter() DataPoint? dataPoint,
      String? label,
      Map<String, String> selections,
      DropdownMenuMode dropdownMenuMode,
      @_CustomMultiselectionThemeConverter() CustomPopupmenu? customPopupmenu,
      @_CustomMultiselectionThemeConverter()
      CustomThemeForWidget? customTheme});

  @override
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class __$$CustomMultiselectionWidgetImplCopyWithImpl<$Res>
    extends _$CustomMultiselectionWidgetCopyWithImpl<$Res,
        _$CustomMultiselectionWidgetImpl>
    implements _$$CustomMultiselectionWidgetImplCopyWith<$Res> {
  __$$CustomMultiselectionWidgetImplCopyWithImpl(
      _$CustomMultiselectionWidgetImpl _value,
      $Res Function(_$CustomMultiselectionWidgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomMultiselectionWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? dataPoint = freezed,
    Object? label = freezed,
    Object? selections = null,
    Object? dropdownMenuMode = null,
    Object? customPopupmenu = freezed,
    Object? customTheme = freezed,
  }) {
    return _then(_$CustomMultiselectionWidgetImpl(
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
      selections: null == selections
          ? _value.selections
          : selections // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      dropdownMenuMode: null == dropdownMenuMode
          ? _value.dropdownMenuMode
          : dropdownMenuMode // ignore: cast_nullable_to_non_nullable
              as DropdownMenuMode,
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
class _$CustomMultiselectionWidgetImpl extends _CustomMultiselectionWidget {
  _$CustomMultiselectionWidgetImpl(
      {this.type = CustomWidgetTypeDeprecated.multiselection,
      required this.id,
      required this.name,
      @DataPointIdConverter() required this.dataPoint,
      this.label,
      required this.selections,
      this.dropdownMenuMode = DropdownMenuMode.dropdown,
      @_CustomMultiselectionThemeConverter() this.customPopupmenu,
      @_CustomMultiselectionThemeConverter() this.customTheme})
      : super._();

  factory _$CustomMultiselectionWidgetImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CustomMultiselectionWidgetImplFromJson(json);

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
  Map<String, String> selections;
  @override
  @JsonKey()
  DropdownMenuMode dropdownMenuMode;
  @override
  @_CustomMultiselectionThemeConverter()
  CustomPopupmenu? customPopupmenu;
  @override
  @_CustomMultiselectionThemeConverter()
  CustomThemeForWidget? customTheme;

  @override
  String toString() {
    return 'CustomMultiselectionWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, selections: $selections, dropdownMenuMode: $dropdownMenuMode, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
  }

  /// Create a copy of CustomMultiselectionWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomMultiselectionWidgetImplCopyWith<_$CustomMultiselectionWidgetImpl>
      get copyWith => __$$CustomMultiselectionWidgetImplCopyWithImpl<
          _$CustomMultiselectionWidgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomMultiselectionWidgetImplToJson(
      this,
    );
  }
}

abstract class _CustomMultiselectionWidget extends CustomMultiselectionWidget
    implements CustomWidget {
  factory _CustomMultiselectionWidget(
      {CustomWidgetTypeDeprecated type,
      required String id,
      required String name,
      @DataPointIdConverter() required DataPoint? dataPoint,
      String? label,
      required Map<String, String> selections,
      DropdownMenuMode dropdownMenuMode,
      @_CustomMultiselectionThemeConverter() CustomPopupmenu? customPopupmenu,
      @_CustomMultiselectionThemeConverter()
      CustomThemeForWidget? customTheme}) = _$CustomMultiselectionWidgetImpl;
  _CustomMultiselectionWidget._() : super._();

  factory _CustomMultiselectionWidget.fromJson(Map<String, dynamic> json) =
      _$CustomMultiselectionWidgetImpl.fromJson;

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
  Map<String, String> get selections;
  set selections(Map<String, String> value);
  @override
  DropdownMenuMode get dropdownMenuMode;
  set dropdownMenuMode(DropdownMenuMode value);
  @override
  @_CustomMultiselectionThemeConverter()
  CustomPopupmenu? get customPopupmenu;
  @_CustomMultiselectionThemeConverter()
  set customPopupmenu(CustomPopupmenu? value);
  @override
  @_CustomMultiselectionThemeConverter()
  CustomThemeForWidget? get customTheme;
  @_CustomMultiselectionThemeConverter()
  set customTheme(CustomThemeForWidget? value);

  /// Create a copy of CustomMultiselectionWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomMultiselectionWidgetImplCopyWith<_$CustomMultiselectionWidgetImpl>
      get copyWith => throw _privateConstructorUsedError;
}
