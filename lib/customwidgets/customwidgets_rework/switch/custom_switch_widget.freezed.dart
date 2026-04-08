// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_switch_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomSwitchWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); String? get dataPoint; set dataPoint(String? value); String? get label; set label(String? value); String get sendIfOn; set sendIfOn(String value); String get sendIfOff; set sendIfOff(String value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value);@_CustomSwitchThemeConverter() CustomThemeForWidget? get customTheme;@_CustomSwitchThemeConverter() set customTheme(CustomThemeForWidget? value);
/// Create a copy of CustomSwitchWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomSwitchWidgetCopyWith<CustomSwitchWidget> get copyWith => _$CustomSwitchWidgetCopyWithImpl<CustomSwitchWidget>(this as CustomSwitchWidget, _$identity);

  /// Serializes this CustomSwitchWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomSwitchWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, sendIfOn: $sendIfOn, sendIfOff: $sendIfOff, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class $CustomSwitchWidgetCopyWith<$Res>  {
  factory $CustomSwitchWidgetCopyWith(CustomSwitchWidget value, $Res Function(CustomSwitchWidget) _then) = _$CustomSwitchWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? label, String sendIfOn, String sendIfOff, CustomPopupmenu? customPopupmenu,@_CustomSwitchThemeConverter() CustomThemeForWidget? customTheme
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomSwitchWidgetCopyWithImpl<$Res>
    implements $CustomSwitchWidgetCopyWith<$Res> {
  _$CustomSwitchWidgetCopyWithImpl(this._self, this._then);

  final CustomSwitchWidget _self;
  final $Res Function(CustomSwitchWidget) _then;

/// Create a copy of CustomSwitchWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? label = freezed,Object? sendIfOn = null,Object? sendIfOff = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,sendIfOn: null == sendIfOn ? _self.sendIfOn : sendIfOn // ignore: cast_nullable_to_non_nullable
as String,sendIfOff: null == sendIfOff ? _self.sendIfOff : sendIfOff // ignore: cast_nullable_to_non_nullable
as String,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}
/// Create a copy of CustomSwitchWidget
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


/// Adds pattern-matching-related methods to [CustomSwitchWidget].
extension CustomSwitchWidgetPatterns on CustomSwitchWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomSwitchWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomSwitchWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomSwitchWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomSwitchWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomSwitchWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomSwitchWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  String sendIfOn,  String sendIfOff,  CustomPopupmenu? customPopupmenu, @_CustomSwitchThemeConverter()  CustomThemeForWidget? customTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomSwitchWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.sendIfOn,_that.sendIfOff,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  String sendIfOn,  String sendIfOff,  CustomPopupmenu? customPopupmenu, @_CustomSwitchThemeConverter()  CustomThemeForWidget? customTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomSwitchWidget():
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.sendIfOn,_that.sendIfOff,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  String sendIfOn,  String sendIfOff,  CustomPopupmenu? customPopupmenu, @_CustomSwitchThemeConverter()  CustomThemeForWidget? customTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomSwitchWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.sendIfOn,_that.sendIfOff,_that.customPopupmenu,_that.customTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomSwitchWidget extends CustomSwitchWidget implements CustomWidget {
   _CustomSwitchWidget({this.type = CustomWidgetTypeDeprecated.switchWidget, required this.id, required this.name, required this.dataPoint, this.label, this.sendIfOn = "true", this.sendIfOff = "false", this.customPopupmenu, @_CustomSwitchThemeConverter() this.customTheme}): super._();
  factory _CustomSwitchWidget.fromJson(Map<String, dynamic> json) => _$CustomSwitchWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override  String? dataPoint;
@override  String? label;
@override@JsonKey()  String sendIfOn;
@override@JsonKey()  String sendIfOff;
@override  CustomPopupmenu? customPopupmenu;
@override@_CustomSwitchThemeConverter()  CustomThemeForWidget? customTheme;

/// Create a copy of CustomSwitchWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomSwitchWidgetCopyWith<_CustomSwitchWidget> get copyWith => __$CustomSwitchWidgetCopyWithImpl<_CustomSwitchWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomSwitchWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomSwitchWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, sendIfOn: $sendIfOn, sendIfOff: $sendIfOff, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomSwitchWidgetCopyWith<$Res> implements $CustomSwitchWidgetCopyWith<$Res> {
  factory _$CustomSwitchWidgetCopyWith(_CustomSwitchWidget value, $Res Function(_CustomSwitchWidget) _then) = __$CustomSwitchWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? label, String sendIfOn, String sendIfOff, CustomPopupmenu? customPopupmenu,@_CustomSwitchThemeConverter() CustomThemeForWidget? customTheme
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomSwitchWidgetCopyWithImpl<$Res>
    implements _$CustomSwitchWidgetCopyWith<$Res> {
  __$CustomSwitchWidgetCopyWithImpl(this._self, this._then);

  final _CustomSwitchWidget _self;
  final $Res Function(_CustomSwitchWidget) _then;

/// Create a copy of CustomSwitchWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? label = freezed,Object? sendIfOn = null,Object? sendIfOff = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_CustomSwitchWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,sendIfOn: null == sendIfOn ? _self.sendIfOn : sendIfOn // ignore: cast_nullable_to_non_nullable
as String,sendIfOff: null == sendIfOff ? _self.sendIfOff : sendIfOff // ignore: cast_nullable_to_non_nullable
as String,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}

/// Create a copy of CustomSwitchWidget
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
