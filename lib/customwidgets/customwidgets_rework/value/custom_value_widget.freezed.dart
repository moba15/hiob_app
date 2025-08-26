// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_value_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomValueWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); String? get dataPoint; set dataPoint(String? value); String? get label; set label(String? value); Map<String, String> get valueMapper; set valueMapper(Map<String, String> value); int get round; set round(int value); String? get suffix; set suffix(String? value); String? get prefix; set prefix(String? value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value);@_CustomValueThemeConverter() CustomThemeForWidget? get customTheme;@_CustomValueThemeConverter() set customTheme(CustomThemeForWidget? value);
/// Create a copy of CustomValueWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomValueWidgetCopyWith<CustomValueWidget> get copyWith => _$CustomValueWidgetCopyWithImpl<CustomValueWidget>(this as CustomValueWidget, _$identity);

  /// Serializes this CustomValueWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomValueWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, valueMapper: $valueMapper, round: $round, suffix: $suffix, prefix: $prefix, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class $CustomValueWidgetCopyWith<$Res>  {
  factory $CustomValueWidgetCopyWith(CustomValueWidget value, $Res Function(CustomValueWidget) _then) = _$CustomValueWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? label, Map<String, String> valueMapper, int round, String? suffix, String? prefix, CustomPopupmenu? customPopupmenu,@_CustomValueThemeConverter() CustomThemeForWidget? customTheme
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomValueWidgetCopyWithImpl<$Res>
    implements $CustomValueWidgetCopyWith<$Res> {
  _$CustomValueWidgetCopyWithImpl(this._self, this._then);

  final CustomValueWidget _self;
  final $Res Function(CustomValueWidget) _then;

/// Create a copy of CustomValueWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? label = freezed,Object? valueMapper = null,Object? round = null,Object? suffix = freezed,Object? prefix = freezed,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,valueMapper: null == valueMapper ? _self.valueMapper : valueMapper // ignore: cast_nullable_to_non_nullable
as Map<String, String>,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}
/// Create a copy of CustomValueWidget
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


/// Adds pattern-matching-related methods to [CustomValueWidget].
extension CustomValueWidgetPatterns on CustomValueWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomValueWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomValueWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomValueWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomValueWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomValueWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomValueWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  Map<String, String> valueMapper,  int round,  String? suffix,  String? prefix,  CustomPopupmenu? customPopupmenu, @_CustomValueThemeConverter()  CustomThemeForWidget? customTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomValueWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.valueMapper,_that.round,_that.suffix,_that.prefix,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  Map<String, String> valueMapper,  int round,  String? suffix,  String? prefix,  CustomPopupmenu? customPopupmenu, @_CustomValueThemeConverter()  CustomThemeForWidget? customTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomValueWidget():
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.valueMapper,_that.round,_that.suffix,_that.prefix,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? label,  Map<String, String> valueMapper,  int round,  String? suffix,  String? prefix,  CustomPopupmenu? customPopupmenu, @_CustomValueThemeConverter()  CustomThemeForWidget? customTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomValueWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.label,_that.valueMapper,_that.round,_that.suffix,_that.prefix,_that.customPopupmenu,_that.customTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomValueWidget extends CustomValueWidget implements CustomWidget {
   _CustomValueWidget({this.type = CustomWidgetTypeDeprecated.valueNew, required this.id, required this.name, required this.dataPoint, this.label, this.valueMapper = const {}, this.round = 2, this.suffix, this.prefix, this.customPopupmenu, @_CustomValueThemeConverter() this.customTheme}): super._();
  factory _CustomValueWidget.fromJson(Map<String, dynamic> json) => _$CustomValueWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override  String? dataPoint;
@override  String? label;
@override@JsonKey()  Map<String, String> valueMapper;
@override@JsonKey()  int round;
@override  String? suffix;
@override  String? prefix;
@override  CustomPopupmenu? customPopupmenu;
@override@_CustomValueThemeConverter()  CustomThemeForWidget? customTheme;

/// Create a copy of CustomValueWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomValueWidgetCopyWith<_CustomValueWidget> get copyWith => __$CustomValueWidgetCopyWithImpl<_CustomValueWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomValueWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomValueWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, label: $label, valueMapper: $valueMapper, round: $round, suffix: $suffix, prefix: $prefix, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomValueWidgetCopyWith<$Res> implements $CustomValueWidgetCopyWith<$Res> {
  factory _$CustomValueWidgetCopyWith(_CustomValueWidget value, $Res Function(_CustomValueWidget) _then) = __$CustomValueWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? label, Map<String, String> valueMapper, int round, String? suffix, String? prefix, CustomPopupmenu? customPopupmenu,@_CustomValueThemeConverter() CustomThemeForWidget? customTheme
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomValueWidgetCopyWithImpl<$Res>
    implements _$CustomValueWidgetCopyWith<$Res> {
  __$CustomValueWidgetCopyWithImpl(this._self, this._then);

  final _CustomValueWidget _self;
  final $Res Function(_CustomValueWidget) _then;

/// Create a copy of CustomValueWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? label = freezed,Object? valueMapper = null,Object? round = null,Object? suffix = freezed,Object? prefix = freezed,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_CustomValueWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,valueMapper: null == valueMapper ? _self.valueMapper : valueMapper // ignore: cast_nullable_to_non_nullable
as Map<String, String>,round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as int,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}

/// Create a copy of CustomValueWidget
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
