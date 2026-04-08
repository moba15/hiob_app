// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_networkplayer_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomNetworkPlayerWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; String get id; set id(String value); String get name; set name(String value); String? get url; set url(String? value); int get height; set height(int value); int get width; set width(int value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value); CustomThemeForWidget? get customTheme; set customTheme(CustomThemeForWidget? value);
/// Create a copy of CustomNetworkPlayerWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomNetworkPlayerWidgetCopyWith<CustomNetworkPlayerWidget> get copyWith => _$CustomNetworkPlayerWidgetCopyWithImpl<CustomNetworkPlayerWidget>(this as CustomNetworkPlayerWidget, _$identity);

  /// Serializes this CustomNetworkPlayerWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomNetworkPlayerWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, id: $id, name: $name, url: $url, height: $height, width: $width, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class $CustomNetworkPlayerWidgetCopyWith<$Res>  {
  factory $CustomNetworkPlayerWidgetCopyWith(CustomNetworkPlayerWidget value, $Res Function(CustomNetworkPlayerWidget) _then) = _$CustomNetworkPlayerWidgetCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? url, int height, int width, CustomPopupmenu? customPopupmenu, CustomThemeForWidget? customTheme
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomNetworkPlayerWidgetCopyWithImpl<$Res>
    implements $CustomNetworkPlayerWidgetCopyWith<$Res> {
  _$CustomNetworkPlayerWidgetCopyWithImpl(this._self, this._then);

  final CustomNetworkPlayerWidget _self;
  final $Res Function(CustomNetworkPlayerWidget) _then;

/// Create a copy of CustomNetworkPlayerWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = freezed,Object? height = null,Object? width = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}
/// Create a copy of CustomNetworkPlayerWidget
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


/// Adds pattern-matching-related methods to [CustomNetworkPlayerWidget].
extension CustomNetworkPlayerWidgetPatterns on CustomNetworkPlayerWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomNetworkPlayerWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomNetworkPlayerWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomNetworkPlayerWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomNetworkPlayerWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomNetworkPlayerWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomNetworkPlayerWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? url,  int height,  int width,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomNetworkPlayerWidget() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.height,_that.width,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? url,  int height,  int width,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomNetworkPlayerWidget():
return $default(_that.id,_that.name,_that.url,_that.height,_that.width,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? url,  int height,  int width,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomNetworkPlayerWidget() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.height,_that.width,_that.customPopupmenu,_that.customTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomNetworkPlayerWidget extends CustomNetworkPlayerWidget implements CustomWidget {
   _CustomNetworkPlayerWidget({required this.id, required this.name, this.url, this.height = 9, this.width = 16, this.customPopupmenu, this.customTheme}): super._();
  factory _CustomNetworkPlayerWidget.fromJson(Map<String, dynamic> json) => _$CustomNetworkPlayerWidgetFromJson(json);

@override  String id;
@override  String name;
@override  String? url;
@override@JsonKey()  int height;
@override@JsonKey()  int width;
@override  CustomPopupmenu? customPopupmenu;
@override  CustomThemeForWidget? customTheme;

/// Create a copy of CustomNetworkPlayerWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomNetworkPlayerWidgetCopyWith<_CustomNetworkPlayerWidget> get copyWith => __$CustomNetworkPlayerWidgetCopyWithImpl<_CustomNetworkPlayerWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomNetworkPlayerWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomNetworkPlayerWidget(id: $id, name: $name, url: $url, height: $height, width: $width, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomNetworkPlayerWidgetCopyWith<$Res> implements $CustomNetworkPlayerWidgetCopyWith<$Res> {
  factory _$CustomNetworkPlayerWidgetCopyWith(_CustomNetworkPlayerWidget value, $Res Function(_CustomNetworkPlayerWidget) _then) = __$CustomNetworkPlayerWidgetCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? url, int height, int width, CustomPopupmenu? customPopupmenu, CustomThemeForWidget? customTheme
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomNetworkPlayerWidgetCopyWithImpl<$Res>
    implements _$CustomNetworkPlayerWidgetCopyWith<$Res> {
  __$CustomNetworkPlayerWidgetCopyWithImpl(this._self, this._then);

  final _CustomNetworkPlayerWidget _self;
  final $Res Function(_CustomNetworkPlayerWidget) _then;

/// Create a copy of CustomNetworkPlayerWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = freezed,Object? height = null,Object? width = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_CustomNetworkPlayerWidget(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}

/// Create a copy of CustomNetworkPlayerWidget
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
