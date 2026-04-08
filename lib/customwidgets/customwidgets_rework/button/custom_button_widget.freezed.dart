// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_button_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomButtonWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value);@_CustomButtonThemeConverter() CustomThemeForWidget? get customTheme;@_CustomButtonThemeConverter() set customTheme(CustomThemeForWidget? value); String? get label; set label(String? value); String? get dataPoint; set dataPoint(String? value); String? get buttonLabel; set buttonLabel(String? value);
/// Create a copy of CustomButtonWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomButtonWidgetCopyWith<CustomButtonWidget> get copyWith => _$CustomButtonWidgetCopyWithImpl<CustomButtonWidget>(this as CustomButtonWidget, _$identity);

  /// Serializes this CustomButtonWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomButtonWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, customPopupmenu: $customPopupmenu, customTheme: $customTheme, label: $label, dataPoint: $dataPoint, buttonLabel: $buttonLabel)';
}


}

/// @nodoc
abstract mixin class $CustomButtonWidgetCopyWith<$Res>  {
  factory $CustomButtonWidgetCopyWith(CustomButtonWidget value, $Res Function(CustomButtonWidget) _then) = _$CustomButtonWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, CustomPopupmenu? customPopupmenu,@_CustomButtonThemeConverter() CustomThemeForWidget? customTheme, String? label, String? dataPoint, String? buttonLabel
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomButtonWidgetCopyWithImpl<$Res>
    implements $CustomButtonWidgetCopyWith<$Res> {
  _$CustomButtonWidgetCopyWithImpl(this._self, this._then);

  final CustomButtonWidget _self;
  final $Res Function(CustomButtonWidget) _then;

/// Create a copy of CustomButtonWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,Object? label = freezed,Object? dataPoint = freezed,Object? buttonLabel = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,buttonLabel: freezed == buttonLabel ? _self.buttonLabel : buttonLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CustomButtonWidget
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


/// Adds pattern-matching-related methods to [CustomButtonWidget].
extension CustomButtonWidgetPatterns on CustomButtonWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomButtonWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomButtonWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomButtonWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomButtonWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomButtonWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomButtonWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  CustomPopupmenu? customPopupmenu, @_CustomButtonThemeConverter()  CustomThemeForWidget? customTheme,  String? label,  String? dataPoint,  String? buttonLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomButtonWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.customPopupmenu,_that.customTheme,_that.label,_that.dataPoint,_that.buttonLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  CustomPopupmenu? customPopupmenu, @_CustomButtonThemeConverter()  CustomThemeForWidget? customTheme,  String? label,  String? dataPoint,  String? buttonLabel)  $default,) {final _that = this;
switch (_that) {
case _CustomButtonWidget():
return $default(_that.type,_that.id,_that.name,_that.customPopupmenu,_that.customTheme,_that.label,_that.dataPoint,_that.buttonLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  CustomPopupmenu? customPopupmenu, @_CustomButtonThemeConverter()  CustomThemeForWidget? customTheme,  String? label,  String? dataPoint,  String? buttonLabel)?  $default,) {final _that = this;
switch (_that) {
case _CustomButtonWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.customPopupmenu,_that.customTheme,_that.label,_that.dataPoint,_that.buttonLabel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomButtonWidget extends CustomButtonWidget implements CustomWidget {
   _CustomButtonWidget({this.type = CustomWidgetTypeDeprecated.button, required this.id, required this.name, this.customPopupmenu, @_CustomButtonThemeConverter() this.customTheme, this.label, required this.dataPoint, this.buttonLabel}): super._();
  factory _CustomButtonWidget.fromJson(Map<String, dynamic> json) => _$CustomButtonWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override  CustomPopupmenu? customPopupmenu;
@override@_CustomButtonThemeConverter()  CustomThemeForWidget? customTheme;
@override  String? label;
@override  String? dataPoint;
@override  String? buttonLabel;

/// Create a copy of CustomButtonWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomButtonWidgetCopyWith<_CustomButtonWidget> get copyWith => __$CustomButtonWidgetCopyWithImpl<_CustomButtonWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomButtonWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomButtonWidget(type: $type, id: $id, name: $name, customPopupmenu: $customPopupmenu, customTheme: $customTheme, label: $label, dataPoint: $dataPoint, buttonLabel: $buttonLabel)';
}


}

/// @nodoc
abstract mixin class _$CustomButtonWidgetCopyWith<$Res> implements $CustomButtonWidgetCopyWith<$Res> {
  factory _$CustomButtonWidgetCopyWith(_CustomButtonWidget value, $Res Function(_CustomButtonWidget) _then) = __$CustomButtonWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, CustomPopupmenu? customPopupmenu,@_CustomButtonThemeConverter() CustomThemeForWidget? customTheme, String? label, String? dataPoint, String? buttonLabel
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomButtonWidgetCopyWithImpl<$Res>
    implements _$CustomButtonWidgetCopyWith<$Res> {
  __$CustomButtonWidgetCopyWithImpl(this._self, this._then);

  final _CustomButtonWidget _self;
  final $Res Function(_CustomButtonWidget) _then;

/// Create a copy of CustomButtonWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,Object? label = freezed,Object? dataPoint = freezed,Object? buttonLabel = freezed,}) {
  return _then(_CustomButtonWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,buttonLabel: freezed == buttonLabel ? _self.buttonLabel : buttonLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CustomButtonWidget
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
