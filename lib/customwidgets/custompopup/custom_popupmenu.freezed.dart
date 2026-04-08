// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_popupmenu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomPopupmenu {

@CustomWidgetConverter() List<CustomWidget> get customWidgets;@CustomWidgetConverter() set customWidgets(List<CustomWidget> value);
/// Create a copy of CustomPopupmenu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomPopupmenuCopyWith<CustomPopupmenu> get copyWith => _$CustomPopupmenuCopyWithImpl<CustomPopupmenu>(this as CustomPopupmenu, _$identity);

  /// Serializes this CustomPopupmenu to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomPopupmenu(customWidgets: $customWidgets)';
}


}

/// @nodoc
abstract mixin class $CustomPopupmenuCopyWith<$Res>  {
  factory $CustomPopupmenuCopyWith(CustomPopupmenu value, $Res Function(CustomPopupmenu) _then) = _$CustomPopupmenuCopyWithImpl;
@useResult
$Res call({
@CustomWidgetConverter() List<CustomWidget> customWidgets
});




}
/// @nodoc
class _$CustomPopupmenuCopyWithImpl<$Res>
    implements $CustomPopupmenuCopyWith<$Res> {
  _$CustomPopupmenuCopyWithImpl(this._self, this._then);

  final CustomPopupmenu _self;
  final $Res Function(CustomPopupmenu) _then;

/// Create a copy of CustomPopupmenu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customWidgets = null,}) {
  return _then(_self.copyWith(
customWidgets: null == customWidgets ? _self.customWidgets : customWidgets // ignore: cast_nullable_to_non_nullable
as List<CustomWidget>,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomPopupmenu].
extension CustomPopupmenuPatterns on CustomPopupmenu {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomPopupmenu value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomPopupmenu() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomPopupmenu value)  $default,){
final _that = this;
switch (_that) {
case _CustomPopupmenu():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomPopupmenu value)?  $default,){
final _that = this;
switch (_that) {
case _CustomPopupmenu() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@CustomWidgetConverter()  List<CustomWidget> customWidgets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomPopupmenu() when $default != null:
return $default(_that.customWidgets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@CustomWidgetConverter()  List<CustomWidget> customWidgets)  $default,) {final _that = this;
switch (_that) {
case _CustomPopupmenu():
return $default(_that.customWidgets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@CustomWidgetConverter()  List<CustomWidget> customWidgets)?  $default,) {final _that = this;
switch (_that) {
case _CustomPopupmenu() when $default != null:
return $default(_that.customWidgets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomPopupmenu extends CustomPopupmenu {
   _CustomPopupmenu({@CustomWidgetConverter() required this.customWidgets}): super._();
  factory _CustomPopupmenu.fromJson(Map<String, dynamic> json) => _$CustomPopupmenuFromJson(json);

@override@CustomWidgetConverter()  List<CustomWidget> customWidgets;

/// Create a copy of CustomPopupmenu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomPopupmenuCopyWith<_CustomPopupmenu> get copyWith => __$CustomPopupmenuCopyWithImpl<_CustomPopupmenu>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomPopupmenuToJson(this, );
}



@override
String toString() {
  return 'CustomPopupmenu(customWidgets: $customWidgets)';
}


}

/// @nodoc
abstract mixin class _$CustomPopupmenuCopyWith<$Res> implements $CustomPopupmenuCopyWith<$Res> {
  factory _$CustomPopupmenuCopyWith(_CustomPopupmenu value, $Res Function(_CustomPopupmenu) _then) = __$CustomPopupmenuCopyWithImpl;
@override @useResult
$Res call({
@CustomWidgetConverter() List<CustomWidget> customWidgets
});




}
/// @nodoc
class __$CustomPopupmenuCopyWithImpl<$Res>
    implements _$CustomPopupmenuCopyWith<$Res> {
  __$CustomPopupmenuCopyWithImpl(this._self, this._then);

  final _CustomPopupmenu _self;
  final $Res Function(_CustomPopupmenu) _then;

/// Create a copy of CustomPopupmenu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customWidgets = null,}) {
  return _then(_CustomPopupmenu(
customWidgets: null == customWidgets ? _self.customWidgets : customWidgets // ignore: cast_nullable_to_non_nullable
as List<CustomWidget>,
  ));
}


}

// dart format on
