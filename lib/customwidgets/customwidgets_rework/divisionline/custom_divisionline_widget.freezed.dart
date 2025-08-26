// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_divisionline_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomDivisionlineWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); dynamic get thickness; set thickness(dynamic value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value); CustomThemeForWidget? get customTheme; set customTheme(CustomThemeForWidget? value);
/// Create a copy of CustomDivisionlineWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomDivisionlineWidgetCopyWith<CustomDivisionlineWidget> get copyWith => _$CustomDivisionlineWidgetCopyWithImpl<CustomDivisionlineWidget>(this as CustomDivisionlineWidget, _$identity);

  /// Serializes this CustomDivisionlineWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomDivisionlineWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, thickness: $thickness, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class $CustomDivisionlineWidgetCopyWith<$Res>  {
  factory $CustomDivisionlineWidgetCopyWith(CustomDivisionlineWidget value, $Res Function(CustomDivisionlineWidget) _then) = _$CustomDivisionlineWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, dynamic thickness, CustomPopupmenu? customPopupmenu, CustomThemeForWidget? customTheme
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomDivisionlineWidgetCopyWithImpl<$Res>
    implements $CustomDivisionlineWidgetCopyWith<$Res> {
  _$CustomDivisionlineWidgetCopyWithImpl(this._self, this._then);

  final CustomDivisionlineWidget _self;
  final $Res Function(CustomDivisionlineWidget) _then;

/// Create a copy of CustomDivisionlineWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? thickness = freezed,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thickness: freezed == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as dynamic,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}
/// Create a copy of CustomDivisionlineWidget
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


/// Adds pattern-matching-related methods to [CustomDivisionlineWidget].
extension CustomDivisionlineWidgetPatterns on CustomDivisionlineWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomDivisionlineWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomDivisionlineWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomDivisionlineWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomDivisionlineWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomDivisionlineWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomDivisionlineWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  dynamic thickness,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomDivisionlineWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.thickness,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  dynamic thickness,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomDivisionlineWidget():
return $default(_that.type,_that.id,_that.name,_that.thickness,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  dynamic thickness,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomDivisionlineWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.thickness,_that.customPopupmenu,_that.customTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomDivisionlineWidget extends CustomDivisionlineWidget implements CustomWidget {
   _CustomDivisionlineWidget({this.type = CustomWidgetTypeDeprecated.divisionLine, required this.id, required this.name, this.thickness = 1, this.customPopupmenu, this.customTheme}): super._();
  factory _CustomDivisionlineWidget.fromJson(Map<String, dynamic> json) => _$CustomDivisionlineWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override@JsonKey()  dynamic thickness;
@override  CustomPopupmenu? customPopupmenu;
@override  CustomThemeForWidget? customTheme;

/// Create a copy of CustomDivisionlineWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomDivisionlineWidgetCopyWith<_CustomDivisionlineWidget> get copyWith => __$CustomDivisionlineWidgetCopyWithImpl<_CustomDivisionlineWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomDivisionlineWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomDivisionlineWidget(type: $type, id: $id, name: $name, thickness: $thickness, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomDivisionlineWidgetCopyWith<$Res> implements $CustomDivisionlineWidgetCopyWith<$Res> {
  factory _$CustomDivisionlineWidgetCopyWith(_CustomDivisionlineWidget value, $Res Function(_CustomDivisionlineWidget) _then) = __$CustomDivisionlineWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, dynamic thickness, CustomPopupmenu? customPopupmenu, CustomThemeForWidget? customTheme
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomDivisionlineWidgetCopyWithImpl<$Res>
    implements _$CustomDivisionlineWidgetCopyWith<$Res> {
  __$CustomDivisionlineWidgetCopyWithImpl(this._self, this._then);

  final _CustomDivisionlineWidget _self;
  final $Res Function(_CustomDivisionlineWidget) _then;

/// Create a copy of CustomDivisionlineWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? thickness = freezed,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_CustomDivisionlineWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thickness: freezed == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as dynamic,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}

/// Create a copy of CustomDivisionlineWidget
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
