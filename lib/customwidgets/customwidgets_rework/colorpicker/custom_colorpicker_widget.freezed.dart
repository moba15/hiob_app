// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_colorpicker_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomColorPickerWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); String? get dataPoint; set dataPoint(String? value); String? get label; set label(String? value); String get prefix; set prefix(String value); dynamic get alpha; set alpha(dynamic value); dynamic get shadesSelection; set shadesSelection(dynamic value); Map<ColorPickerType, bool> get pickersEnabled; set pickersEnabled(Map<ColorPickerType, bool> value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value);@_CustomColorpickerThemeConverter() CustomThemeForWidget? get customTheme;@_CustomColorpickerThemeConverter() set customTheme(CustomThemeForWidget? value);
/// Create a copy of CustomColorPickerWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomColorPickerWidgetCopyWith<CustomColorPickerWidget> get copyWith => _$CustomColorPickerWidgetCopyWithImpl<CustomColorPickerWidget>(this as CustomColorPickerWidget, _$identity);

  /// Serializes this CustomColorPickerWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomColorPickerWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, prefix: $prefix, alpha: $alpha, shadesSelection: $shadesSelection, pickersEnabled: $pickersEnabled, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class $CustomColorPickerWidgetCopyWith<$Res>  {
  factory $CustomColorPickerWidgetCopyWith(CustomColorPickerWidget value, $Res Function(CustomColorPickerWidget) _then) = _$CustomColorPickerWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? label, String prefix, dynamic alpha, dynamic shadesSelection, Map<ColorPickerType, bool> pickersEnabled, CustomPopupmenu? customPopupmenu,@_CustomColorpickerThemeConverter() CustomThemeForWidget? customTheme
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomColorPickerWidgetCopyWithImpl<$Res>
    implements $CustomColorPickerWidgetCopyWith<$Res> {
  _$CustomColorPickerWidgetCopyWithImpl(this._self, this._then);

  final CustomColorPickerWidget _self;
  final $Res Function(CustomColorPickerWidget) _then;

/// Create a copy of CustomColorPickerWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? label = freezed,Object? prefix = null,Object? alpha = freezed,Object? shadesSelection = freezed,Object? pickersEnabled = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,prefix: null == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String,alpha: freezed == alpha ? _self.alpha : alpha // ignore: cast_nullable_to_non_nullable
as dynamic,shadesSelection: freezed == shadesSelection ? _self.shadesSelection : shadesSelection // ignore: cast_nullable_to_non_nullable
as dynamic,pickersEnabled: null == pickersEnabled ? _self.pickersEnabled : pickersEnabled // ignore: cast_nullable_to_non_nullable
as Map<ColorPickerType, bool>,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}
/// Create a copy of CustomColorPickerWidget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomPopupmenuCopyWith<$Res>? get customPopupmenu {
    if (_self.customPopupmenu == null) {
    return null;
  }

  return $CustomPopupmenuCopyWith<$Res>(_self.customPopupmenu!, (value) {
    return _then(_self.copyWith(customPopupmenu: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomColorPickerWidget].
extension CustomColorPickerWidgetPatterns on CustomColorPickerWidget {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomColorPickerWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomColorPickerWidget() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomColorPickerWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomColorPickerWidget():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomColorPickerWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomColorPickerWidget() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  String prefix,  dynamic alpha,  dynamic shadesSelection,  Map<ColorPickerType, bool> pickersEnabled,  CustomPopupmenu? customPopupmenu, @_CustomColorpickerThemeConverter()  CustomThemeForWidget? customTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomColorPickerWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.prefix,_that.alpha,_that.shadesSelection,_that.pickersEnabled,_that.customPopupmenu,_that.customTheme);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  String prefix,  dynamic alpha,  dynamic shadesSelection,  Map<ColorPickerType, bool> pickersEnabled,  CustomPopupmenu? customPopupmenu, @_CustomColorpickerThemeConverter()  CustomThemeForWidget? customTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomColorPickerWidget():
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.prefix,_that.alpha,_that.shadesSelection,_that.pickersEnabled,_that.customPopupmenu,_that.customTheme);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  String prefix,  dynamic alpha,  dynamic shadesSelection,  Map<ColorPickerType, bool> pickersEnabled,  CustomPopupmenu? customPopupmenu, @_CustomColorpickerThemeConverter()  CustomThemeForWidget? customTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomColorPickerWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.prefix,_that.alpha,_that.shadesSelection,_that.pickersEnabled,_that.customPopupmenu,_that.customTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomColorPickerWidget extends CustomColorPickerWidget implements CustomWidget {
   _CustomColorPickerWidget({this.type = CustomWidgetTypeDeprecated.colorPicker, required this.id, required this.name, required this.dataPoint, this.label, this.prefix = "0x", this.alpha = false, this.shadesSelection = true, this.pickersEnabled = const {}, this.customPopupmenu, @_CustomColorpickerThemeConverter() this.customTheme}): super._();
  factory _CustomColorPickerWidget.fromJson(Map<String, dynamic> json) => _$CustomColorPickerWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override  String? dataPoint;
@override  String? label;
@override@JsonKey()  String prefix;
@override@JsonKey()  dynamic alpha;
@override@JsonKey()  dynamic shadesSelection;
@override@JsonKey()  Map<ColorPickerType, bool> pickersEnabled;
@override  CustomPopupmenu? customPopupmenu;
@override@_CustomColorpickerThemeConverter()  CustomThemeForWidget? customTheme;

/// Create a copy of CustomColorPickerWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomColorPickerWidgetCopyWith<_CustomColorPickerWidget> get copyWith => __$CustomColorPickerWidgetCopyWithImpl<_CustomColorPickerWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomColorPickerWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomColorPickerWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, prefix: $prefix, alpha: $alpha, shadesSelection: $shadesSelection, pickersEnabled: $pickersEnabled, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomColorPickerWidgetCopyWith<$Res> implements $CustomColorPickerWidgetCopyWith<$Res> {
  factory _$CustomColorPickerWidgetCopyWith(_CustomColorPickerWidget value, $Res Function(_CustomColorPickerWidget) _then) = __$CustomColorPickerWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? label, String prefix, dynamic alpha, dynamic shadesSelection, Map<ColorPickerType, bool> pickersEnabled, CustomPopupmenu? customPopupmenu,@_CustomColorpickerThemeConverter() CustomThemeForWidget? customTheme
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomColorPickerWidgetCopyWithImpl<$Res>
    implements _$CustomColorPickerWidgetCopyWith<$Res> {
  __$CustomColorPickerWidgetCopyWithImpl(this._self, this._then);

  final _CustomColorPickerWidget _self;
  final $Res Function(_CustomColorPickerWidget) _then;

/// Create a copy of CustomColorPickerWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? label = freezed,Object? prefix = null,Object? alpha = freezed,Object? shadesSelection = freezed,Object? pickersEnabled = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_CustomColorPickerWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,prefix: null == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String,alpha: freezed == alpha ? _self.alpha : alpha // ignore: cast_nullable_to_non_nullable
as dynamic,shadesSelection: freezed == shadesSelection ? _self.shadesSelection : shadesSelection // ignore: cast_nullable_to_non_nullable
as dynamic,pickersEnabled: null == pickersEnabled ? _self.pickersEnabled : pickersEnabled // ignore: cast_nullable_to_non_nullable
as Map<ColorPickerType, bool>,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}

/// Create a copy of CustomColorPickerWidget
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomPopupmenuCopyWith<$Res>? get customPopupmenu {
    if (_self.customPopupmenu == null) {
    return null;
  }

  return $CustomPopupmenuCopyWith<$Res>(_self.customPopupmenu!, (value) {
    return _then(_self.copyWith(customPopupmenu: value));
  });
}
}

// dart format on
