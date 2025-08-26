// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_multiselection_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomMultiselectionWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); String? get dataPoint; set dataPoint(String? value); String? get label; set label(String? value); Map<String, String> get selections; set selections(Map<String, String> value); DropdownMenuMode get dropdownMenuMode; set dropdownMenuMode(DropdownMenuMode value);@_CustomMultiselectionThemeConverter() CustomPopupmenu? get customPopupmenu;@_CustomMultiselectionThemeConverter() set customPopupmenu(CustomPopupmenu? value);@_CustomMultiselectionThemeConverter() CustomThemeForWidget? get customTheme;@_CustomMultiselectionThemeConverter() set customTheme(CustomThemeForWidget? value);
/// Create a copy of CustomMultiselectionWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomMultiselectionWidgetCopyWith<CustomMultiselectionWidget> get copyWith => _$CustomMultiselectionWidgetCopyWithImpl<CustomMultiselectionWidget>(this as CustomMultiselectionWidget, _$identity);

  /// Serializes this CustomMultiselectionWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomMultiselectionWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, selections: $selections, dropdownMenuMode: $dropdownMenuMode, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class $CustomMultiselectionWidgetCopyWith<$Res>  {
  factory $CustomMultiselectionWidgetCopyWith(CustomMultiselectionWidget value, $Res Function(CustomMultiselectionWidget) _then) = _$CustomMultiselectionWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? label, Map<String, String> selections, DropdownMenuMode dropdownMenuMode,@_CustomMultiselectionThemeConverter() CustomPopupmenu? customPopupmenu,@_CustomMultiselectionThemeConverter() CustomThemeForWidget? customTheme
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomMultiselectionWidgetCopyWithImpl<$Res>
    implements $CustomMultiselectionWidgetCopyWith<$Res> {
  _$CustomMultiselectionWidgetCopyWithImpl(this._self, this._then);

  final CustomMultiselectionWidget _self;
  final $Res Function(CustomMultiselectionWidget) _then;

/// Create a copy of CustomMultiselectionWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? label = freezed,Object? selections = null,Object? dropdownMenuMode = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as Map<String, String>,dropdownMenuMode: null == dropdownMenuMode ? _self.dropdownMenuMode : dropdownMenuMode // ignore: cast_nullable_to_non_nullable
as DropdownMenuMode,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}
/// Create a copy of CustomMultiselectionWidget
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


/// Adds pattern-matching-related methods to [CustomMultiselectionWidget].
extension CustomMultiselectionWidgetPatterns on CustomMultiselectionWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomMultiselectionWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomMultiselectionWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomMultiselectionWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomMultiselectionWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomMultiselectionWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomMultiselectionWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  Map<String, String> selections,  DropdownMenuMode dropdownMenuMode, @_CustomMultiselectionThemeConverter()  CustomPopupmenu? customPopupmenu, @_CustomMultiselectionThemeConverter()  CustomThemeForWidget? customTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomMultiselectionWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.selections,_that.dropdownMenuMode,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  Map<String, String> selections,  DropdownMenuMode dropdownMenuMode, @_CustomMultiselectionThemeConverter()  CustomPopupmenu? customPopupmenu, @_CustomMultiselectionThemeConverter()  CustomThemeForWidget? customTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomMultiselectionWidget():
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.selections,_that.dropdownMenuMode,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  Map<String, String> selections,  DropdownMenuMode dropdownMenuMode, @_CustomMultiselectionThemeConverter()  CustomPopupmenu? customPopupmenu, @_CustomMultiselectionThemeConverter()  CustomThemeForWidget? customTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomMultiselectionWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.selections,_that.dropdownMenuMode,_that.customPopupmenu,_that.customTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomMultiselectionWidget extends CustomMultiselectionWidget implements CustomWidget {
   _CustomMultiselectionWidget({this.type = CustomWidgetTypeDeprecated.multiselection, required this.id, required this.name, required this.dataPoint, this.label, required this.selections, this.dropdownMenuMode = DropdownMenuMode.dropdown, @_CustomMultiselectionThemeConverter() this.customPopupmenu, @_CustomMultiselectionThemeConverter() this.customTheme}): super._();
  factory _CustomMultiselectionWidget.fromJson(Map<String, dynamic> json) => _$CustomMultiselectionWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override  String? dataPoint;
@override  String? label;
@override  Map<String, String> selections;
@override@JsonKey()  DropdownMenuMode dropdownMenuMode;
@override@_CustomMultiselectionThemeConverter()  CustomPopupmenu? customPopupmenu;
@override@_CustomMultiselectionThemeConverter()  CustomThemeForWidget? customTheme;

/// Create a copy of CustomMultiselectionWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomMultiselectionWidgetCopyWith<_CustomMultiselectionWidget> get copyWith => __$CustomMultiselectionWidgetCopyWithImpl<_CustomMultiselectionWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomMultiselectionWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomMultiselectionWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, selections: $selections, dropdownMenuMode: $dropdownMenuMode, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomMultiselectionWidgetCopyWith<$Res> implements $CustomMultiselectionWidgetCopyWith<$Res> {
  factory _$CustomMultiselectionWidgetCopyWith(_CustomMultiselectionWidget value, $Res Function(_CustomMultiselectionWidget) _then) = __$CustomMultiselectionWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? label, Map<String, String> selections, DropdownMenuMode dropdownMenuMode,@_CustomMultiselectionThemeConverter() CustomPopupmenu? customPopupmenu,@_CustomMultiselectionThemeConverter() CustomThemeForWidget? customTheme
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomMultiselectionWidgetCopyWithImpl<$Res>
    implements _$CustomMultiselectionWidgetCopyWith<$Res> {
  __$CustomMultiselectionWidgetCopyWithImpl(this._self, this._then);

  final _CustomMultiselectionWidget _self;
  final $Res Function(_CustomMultiselectionWidget) _then;

/// Create a copy of CustomMultiselectionWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? label = freezed,Object? selections = null,Object? dropdownMenuMode = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_CustomMultiselectionWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,selections: null == selections ? _self.selections : selections // ignore: cast_nullable_to_non_nullable
as Map<String, String>,dropdownMenuMode: null == dropdownMenuMode ? _self.dropdownMenuMode : dropdownMenuMode // ignore: cast_nullable_to_non_nullable
as DropdownMenuMode,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}

/// Create a copy of CustomMultiselectionWidget
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
