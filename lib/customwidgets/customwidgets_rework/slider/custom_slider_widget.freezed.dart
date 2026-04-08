// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_slider_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomSliderWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); String? get label; set label(String? value); String? get dataPoint; set dataPoint(String? value); int get max; set max(int value); int get min; set min(int value); int get step; set step(int value); CustomSliderWidgetUpdateStrategy? get customSliderWidgetUpdateStrategy; set customSliderWidgetUpdateStrategy(CustomSliderWidgetUpdateStrategy? value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value);@_CustomSliderThemeConverter() CustomThemeForWidget? get customTheme;@_CustomSliderThemeConverter() set customTheme(CustomThemeForWidget? value);
/// Create a copy of CustomSliderWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomSliderWidgetCopyWith<CustomSliderWidget> get copyWith => _$CustomSliderWidgetCopyWithImpl<CustomSliderWidget>(this as CustomSliderWidget, _$identity);

  /// Serializes this CustomSliderWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomSliderWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, label: $label, dataPoint: $dataPoint, max: $max, min: $min, step: $step, customSliderWidgetUpdateStrategy: $customSliderWidgetUpdateStrategy, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class $CustomSliderWidgetCopyWith<$Res>  {
  factory $CustomSliderWidgetCopyWith(CustomSliderWidget value, $Res Function(CustomSliderWidget) _then) = _$CustomSliderWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? label, String? dataPoint, int max, int min, int step, CustomSliderWidgetUpdateStrategy? customSliderWidgetUpdateStrategy, CustomPopupmenu? customPopupmenu,@_CustomSliderThemeConverter() CustomThemeForWidget? customTheme
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomSliderWidgetCopyWithImpl<$Res>
    implements $CustomSliderWidgetCopyWith<$Res> {
  _$CustomSliderWidgetCopyWithImpl(this._self, this._then);

  final CustomSliderWidget _self;
  final $Res Function(CustomSliderWidget) _then;

/// Create a copy of CustomSliderWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? label = freezed,Object? dataPoint = freezed,Object? max = null,Object? min = null,Object? step = null,Object? customSliderWidgetUpdateStrategy = freezed,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,customSliderWidgetUpdateStrategy: freezed == customSliderWidgetUpdateStrategy ? _self.customSliderWidgetUpdateStrategy : customSliderWidgetUpdateStrategy // ignore: cast_nullable_to_non_nullable
as CustomSliderWidgetUpdateStrategy?,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}
/// Create a copy of CustomSliderWidget
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


/// Adds pattern-matching-related methods to [CustomSliderWidget].
extension CustomSliderWidgetPatterns on CustomSliderWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomSliderWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomSliderWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomSliderWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomSliderWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomSliderWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomSliderWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? label,  String? dataPoint,  int max,  int min,  int step,  CustomSliderWidgetUpdateStrategy? customSliderWidgetUpdateStrategy,  CustomPopupmenu? customPopupmenu, @_CustomSliderThemeConverter()  CustomThemeForWidget? customTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomSliderWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.label,_that.dataPoint,_that.max,_that.min,_that.step,_that.customSliderWidgetUpdateStrategy,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? label,  String? dataPoint,  int max,  int min,  int step,  CustomSliderWidgetUpdateStrategy? customSliderWidgetUpdateStrategy,  CustomPopupmenu? customPopupmenu, @_CustomSliderThemeConverter()  CustomThemeForWidget? customTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomSliderWidget():
return $default(_that.type,_that.id,_that.name,_that.label,_that.dataPoint,_that.max,_that.min,_that.step,_that.customSliderWidgetUpdateStrategy,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? label,  String? dataPoint,  int max,  int min,  int step,  CustomSliderWidgetUpdateStrategy? customSliderWidgetUpdateStrategy,  CustomPopupmenu? customPopupmenu, @_CustomSliderThemeConverter()  CustomThemeForWidget? customTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomSliderWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.label,_that.dataPoint,_that.max,_that.min,_that.step,_that.customSliderWidgetUpdateStrategy,_that.customPopupmenu,_that.customTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomSliderWidget extends CustomSliderWidget implements CustomWidget {
   _CustomSliderWidget({this.type = CustomWidgetTypeDeprecated.slider, required this.id, required this.name, this.label, required this.dataPoint, this.max = 100, this.min = 0, this.step = 10, this.customSliderWidgetUpdateStrategy = CustomSliderWidgetUpdateStrategy.onFinish, this.customPopupmenu, @_CustomSliderThemeConverter() this.customTheme}): super._();
  factory _CustomSliderWidget.fromJson(Map<String, dynamic> json) => _$CustomSliderWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override  String? label;
@override  String? dataPoint;
@override@JsonKey()  int max;
@override@JsonKey()  int min;
@override@JsonKey()  int step;
@override@JsonKey()  CustomSliderWidgetUpdateStrategy? customSliderWidgetUpdateStrategy;
@override  CustomPopupmenu? customPopupmenu;
@override@_CustomSliderThemeConverter()  CustomThemeForWidget? customTheme;

/// Create a copy of CustomSliderWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomSliderWidgetCopyWith<_CustomSliderWidget> get copyWith => __$CustomSliderWidgetCopyWithImpl<_CustomSliderWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomSliderWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomSliderWidget(type: $type, id: $id, name: $name, label: $label, dataPoint: $dataPoint, max: $max, min: $min, step: $step, customSliderWidgetUpdateStrategy: $customSliderWidgetUpdateStrategy, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomSliderWidgetCopyWith<$Res> implements $CustomSliderWidgetCopyWith<$Res> {
  factory _$CustomSliderWidgetCopyWith(_CustomSliderWidget value, $Res Function(_CustomSliderWidget) _then) = __$CustomSliderWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? label, String? dataPoint, int max, int min, int step, CustomSliderWidgetUpdateStrategy? customSliderWidgetUpdateStrategy, CustomPopupmenu? customPopupmenu,@_CustomSliderThemeConverter() CustomThemeForWidget? customTheme
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomSliderWidgetCopyWithImpl<$Res>
    implements _$CustomSliderWidgetCopyWith<$Res> {
  __$CustomSliderWidgetCopyWithImpl(this._self, this._then);

  final _CustomSliderWidget _self;
  final $Res Function(_CustomSliderWidget) _then;

/// Create a copy of CustomSliderWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? label = freezed,Object? dataPoint = freezed,Object? max = null,Object? min = null,Object? step = null,Object? customSliderWidgetUpdateStrategy = freezed,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_CustomSliderWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,customSliderWidgetUpdateStrategy: freezed == customSliderWidgetUpdateStrategy ? _self.customSliderWidgetUpdateStrategy : customSliderWidgetUpdateStrategy // ignore: cast_nullable_to_non_nullable
as CustomSliderWidgetUpdateStrategy?,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}

/// Create a copy of CustomSliderWidget
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
