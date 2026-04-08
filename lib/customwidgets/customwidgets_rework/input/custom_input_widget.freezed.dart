// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_input_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomInputWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); String? get label; set label(String? value); String? get dataPoint; set dataPoint(String? value); String? get hintText; set hintText(String? value); String? get suffix; set suffix(String? value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value);@_CustomInputThemeConverter() CustomThemeForWidget? get customTheme;@_CustomInputThemeConverter() set customTheme(CustomThemeForWidget? value); CustomInputSendMethod? get customInputSendMethod; set customInputSendMethod(CustomInputSendMethod? value); CustomInputDisplayConentType? get customInputDisplayConentType; set customInputDisplayConentType(CustomInputDisplayConentType? value); bool get fullSize; set fullSize(bool value);
/// Create a copy of CustomInputWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomInputWidgetCopyWith<CustomInputWidget> get copyWith => _$CustomInputWidgetCopyWithImpl<CustomInputWidget>(this as CustomInputWidget, _$identity);

  /// Serializes this CustomInputWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomInputWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, label: $label, dataPoint: $dataPoint, hintText: $hintText, suffix: $suffix, customPopupmenu: $customPopupmenu, customTheme: $customTheme, customInputSendMethod: $customInputSendMethod, customInputDisplayConentType: $customInputDisplayConentType, fullSize: $fullSize)';
}


}

/// @nodoc
abstract mixin class $CustomInputWidgetCopyWith<$Res>  {
  factory $CustomInputWidgetCopyWith(CustomInputWidget value, $Res Function(CustomInputWidget) _then) = _$CustomInputWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? label, String? dataPoint, String? hintText, String? suffix, CustomPopupmenu? customPopupmenu,@_CustomInputThemeConverter() CustomThemeForWidget? customTheme, CustomInputSendMethod? customInputSendMethod, CustomInputDisplayConentType? customInputDisplayConentType, bool fullSize
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomInputWidgetCopyWithImpl<$Res>
    implements $CustomInputWidgetCopyWith<$Res> {
  _$CustomInputWidgetCopyWithImpl(this._self, this._then);

  final CustomInputWidget _self;
  final $Res Function(CustomInputWidget) _then;

/// Create a copy of CustomInputWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? label = freezed,Object? dataPoint = freezed,Object? hintText = freezed,Object? suffix = freezed,Object? customPopupmenu = freezed,Object? customTheme = freezed,Object? customInputSendMethod = freezed,Object? customInputDisplayConentType = freezed,Object? fullSize = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,hintText: freezed == hintText ? _self.hintText : hintText // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,customInputSendMethod: freezed == customInputSendMethod ? _self.customInputSendMethod : customInputSendMethod // ignore: cast_nullable_to_non_nullable
as CustomInputSendMethod?,customInputDisplayConentType: freezed == customInputDisplayConentType ? _self.customInputDisplayConentType : customInputDisplayConentType // ignore: cast_nullable_to_non_nullable
as CustomInputDisplayConentType?,fullSize: null == fullSize ? _self.fullSize : fullSize // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CustomInputWidget
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


/// Adds pattern-matching-related methods to [CustomInputWidget].
extension CustomInputWidgetPatterns on CustomInputWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomInputWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomInputWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomInputWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomInputWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomInputWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomInputWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? label,  String? dataPoint,  String? hintText,  String? suffix,  CustomPopupmenu? customPopupmenu, @_CustomInputThemeConverter()  CustomThemeForWidget? customTheme,  CustomInputSendMethod? customInputSendMethod,  CustomInputDisplayConentType? customInputDisplayConentType,  bool fullSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomInputWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.label,_that.dataPoint,_that.hintText,_that.suffix,_that.customPopupmenu,_that.customTheme,_that.customInputSendMethod,_that.customInputDisplayConentType,_that.fullSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? label,  String? dataPoint,  String? hintText,  String? suffix,  CustomPopupmenu? customPopupmenu, @_CustomInputThemeConverter()  CustomThemeForWidget? customTheme,  CustomInputSendMethod? customInputSendMethod,  CustomInputDisplayConentType? customInputDisplayConentType,  bool fullSize)  $default,) {final _that = this;
switch (_that) {
case _CustomInputWidget():
return $default(_that.type,_that.id,_that.name,_that.label,_that.dataPoint,_that.hintText,_that.suffix,_that.customPopupmenu,_that.customTheme,_that.customInputSendMethod,_that.customInputDisplayConentType,_that.fullSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? label,  String? dataPoint,  String? hintText,  String? suffix,  CustomPopupmenu? customPopupmenu, @_CustomInputThemeConverter()  CustomThemeForWidget? customTheme,  CustomInputSendMethod? customInputSendMethod,  CustomInputDisplayConentType? customInputDisplayConentType,  bool fullSize)?  $default,) {final _that = this;
switch (_that) {
case _CustomInputWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.label,_that.dataPoint,_that.hintText,_that.suffix,_that.customPopupmenu,_that.customTheme,_that.customInputSendMethod,_that.customInputDisplayConentType,_that.fullSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomInputWidget extends CustomInputWidget implements CustomWidget {
   _CustomInputWidget({this.type = CustomWidgetTypeDeprecated.input, required this.id, required this.name, this.label, required this.dataPoint, this.hintText, this.suffix, this.customPopupmenu, @_CustomInputThemeConverter() this.customTheme, this.customInputSendMethod, this.customInputDisplayConentType, this.fullSize = false}): super._();
  factory _CustomInputWidget.fromJson(Map<String, dynamic> json) => _$CustomInputWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override  String? label;
@override  String? dataPoint;
@override  String? hintText;
@override  String? suffix;
@override  CustomPopupmenu? customPopupmenu;
@override@_CustomInputThemeConverter()  CustomThemeForWidget? customTheme;
@override  CustomInputSendMethod? customInputSendMethod;
@override  CustomInputDisplayConentType? customInputDisplayConentType;
@override@JsonKey()  bool fullSize;

/// Create a copy of CustomInputWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomInputWidgetCopyWith<_CustomInputWidget> get copyWith => __$CustomInputWidgetCopyWithImpl<_CustomInputWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomInputWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomInputWidget(type: $type, id: $id, name: $name, label: $label, dataPoint: $dataPoint, hintText: $hintText, suffix: $suffix, customPopupmenu: $customPopupmenu, customTheme: $customTheme, customInputSendMethod: $customInputSendMethod, customInputDisplayConentType: $customInputDisplayConentType, fullSize: $fullSize)';
}


}

/// @nodoc
abstract mixin class _$CustomInputWidgetCopyWith<$Res> implements $CustomInputWidgetCopyWith<$Res> {
  factory _$CustomInputWidgetCopyWith(_CustomInputWidget value, $Res Function(_CustomInputWidget) _then) = __$CustomInputWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? label, String? dataPoint, String? hintText, String? suffix, CustomPopupmenu? customPopupmenu,@_CustomInputThemeConverter() CustomThemeForWidget? customTheme, CustomInputSendMethod? customInputSendMethod, CustomInputDisplayConentType? customInputDisplayConentType, bool fullSize
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomInputWidgetCopyWithImpl<$Res>
    implements _$CustomInputWidgetCopyWith<$Res> {
  __$CustomInputWidgetCopyWithImpl(this._self, this._then);

  final _CustomInputWidget _self;
  final $Res Function(_CustomInputWidget) _then;

/// Create a copy of CustomInputWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? label = freezed,Object? dataPoint = freezed,Object? hintText = freezed,Object? suffix = freezed,Object? customPopupmenu = freezed,Object? customTheme = freezed,Object? customInputSendMethod = freezed,Object? customInputDisplayConentType = freezed,Object? fullSize = null,}) {
  return _then(_CustomInputWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,hintText: freezed == hintText ? _self.hintText : hintText // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,customInputSendMethod: freezed == customInputSendMethod ? _self.customInputSendMethod : customInputSendMethod // ignore: cast_nullable_to_non_nullable
as CustomInputSendMethod?,customInputDisplayConentType: freezed == customInputDisplayConentType ? _self.customInputDisplayConentType : customInputDisplayConentType // ignore: cast_nullable_to_non_nullable
as CustomInputDisplayConentType?,fullSize: null == fullSize ? _self.fullSize : fullSize // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CustomInputWidget
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
