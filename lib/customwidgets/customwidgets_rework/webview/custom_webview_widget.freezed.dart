// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_webview_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomWebViewWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); bool get image; set image(bool value); bool get enabledZoom; set enabledZoom(bool value); bool get enableInlineScroll; set enableInlineScroll(bool value); String? get dataPoint; set dataPoint(String? value); String? get url; set url(String? value); int get height; set height(int value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value); CustomThemeForWidget? get customTheme; set customTheme(CustomThemeForWidget? value);
/// Create a copy of CustomWebViewWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomWebViewWidgetCopyWith<CustomWebViewWidget> get copyWith => _$CustomWebViewWidgetCopyWithImpl<CustomWebViewWidget>(this as CustomWebViewWidget, _$identity);

  /// Serializes this CustomWebViewWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomWebViewWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, image: $image, enabledZoom: $enabledZoom, enableInlineScroll: $enableInlineScroll, dataPoint: $dataPoint, url: $url, height: $height, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class $CustomWebViewWidgetCopyWith<$Res>  {
  factory $CustomWebViewWidgetCopyWith(CustomWebViewWidget value, $Res Function(CustomWebViewWidget) _then) = _$CustomWebViewWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, bool image, bool enabledZoom, bool enableInlineScroll, String? dataPoint, String? url, int height, CustomPopupmenu? customPopupmenu, CustomThemeForWidget? customTheme
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomWebViewWidgetCopyWithImpl<$Res>
    implements $CustomWebViewWidgetCopyWith<$Res> {
  _$CustomWebViewWidgetCopyWithImpl(this._self, this._then);

  final CustomWebViewWidget _self;
  final $Res Function(CustomWebViewWidget) _then;

/// Create a copy of CustomWebViewWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? image = null,Object? enabledZoom = null,Object? enableInlineScroll = null,Object? dataPoint = freezed,Object? url = freezed,Object? height = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as bool,enabledZoom: null == enabledZoom ? _self.enabledZoom : enabledZoom // ignore: cast_nullable_to_non_nullable
as bool,enableInlineScroll: null == enableInlineScroll ? _self.enableInlineScroll : enableInlineScroll // ignore: cast_nullable_to_non_nullable
as bool,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}
/// Create a copy of CustomWebViewWidget
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


/// Adds pattern-matching-related methods to [CustomWebViewWidget].
extension CustomWebViewWidgetPatterns on CustomWebViewWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomWebViewWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomWebViewWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomWebViewWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomWebViewWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomWebViewWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomWebViewWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  bool image,  bool enabledZoom,  bool enableInlineScroll,  String? dataPoint,  String? url,  int height,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomWebViewWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.image,_that.enabledZoom,_that.enableInlineScroll,_that.dataPoint,_that.url,_that.height,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  bool image,  bool enabledZoom,  bool enableInlineScroll,  String? dataPoint,  String? url,  int height,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomWebViewWidget():
return $default(_that.type,_that.id,_that.name,_that.image,_that.enabledZoom,_that.enableInlineScroll,_that.dataPoint,_that.url,_that.height,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  bool image,  bool enabledZoom,  bool enableInlineScroll,  String? dataPoint,  String? url,  int height,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomWebViewWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.image,_that.enabledZoom,_that.enableInlineScroll,_that.dataPoint,_that.url,_that.height,_that.customPopupmenu,_that.customTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomWebViewWidget extends CustomWebViewWidget implements CustomWidget {
   _CustomWebViewWidget({this.type = CustomWidgetTypeDeprecated.webViewNew, required this.id, required this.name, this.image = false, this.enabledZoom = false, this.enableInlineScroll = false, required this.dataPoint, this.url, this.height = 500, this.customPopupmenu, this.customTheme}): super._();
  factory _CustomWebViewWidget.fromJson(Map<String, dynamic> json) => _$CustomWebViewWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override@JsonKey()  bool image;
@override@JsonKey()  bool enabledZoom;
@override@JsonKey()  bool enableInlineScroll;
@override  String? dataPoint;
@override  String? url;
@override@JsonKey()  int height;
@override  CustomPopupmenu? customPopupmenu;
@override  CustomThemeForWidget? customTheme;

/// Create a copy of CustomWebViewWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomWebViewWidgetCopyWith<_CustomWebViewWidget> get copyWith => __$CustomWebViewWidgetCopyWithImpl<_CustomWebViewWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomWebViewWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomWebViewWidget(type: $type, id: $id, name: $name, image: $image, enabledZoom: $enabledZoom, enableInlineScroll: $enableInlineScroll, dataPoint: $dataPoint, url: $url, height: $height, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomWebViewWidgetCopyWith<$Res> implements $CustomWebViewWidgetCopyWith<$Res> {
  factory _$CustomWebViewWidgetCopyWith(_CustomWebViewWidget value, $Res Function(_CustomWebViewWidget) _then) = __$CustomWebViewWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, bool image, bool enabledZoom, bool enableInlineScroll, String? dataPoint, String? url, int height, CustomPopupmenu? customPopupmenu, CustomThemeForWidget? customTheme
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomWebViewWidgetCopyWithImpl<$Res>
    implements _$CustomWebViewWidgetCopyWith<$Res> {
  __$CustomWebViewWidgetCopyWithImpl(this._self, this._then);

  final _CustomWebViewWidget _self;
  final $Res Function(_CustomWebViewWidget) _then;

/// Create a copy of CustomWebViewWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? image = null,Object? enabledZoom = null,Object? enableInlineScroll = null,Object? dataPoint = freezed,Object? url = freezed,Object? height = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_CustomWebViewWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as bool,enabledZoom: null == enabledZoom ? _self.enabledZoom : enabledZoom // ignore: cast_nullable_to_non_nullable
as bool,enableInlineScroll: null == enableInlineScroll ? _self.enableInlineScroll : enableInlineScroll // ignore: cast_nullable_to_non_nullable
as bool,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}

/// Create a copy of CustomWebViewWidget
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
