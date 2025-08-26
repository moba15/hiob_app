// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_table_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomTableWidget {

 dynamic get isAbleToPopupMenu; dynamic get hasCustomTheme; CustomWidgetTypeDeprecated get type; set type(CustomWidgetTypeDeprecated value); String get id; set id(String value); String get name; set name(String value); String? get dataPoint; set dataPoint(String? value); String? get header; set header(String? value); bool get sortAsc; set sortAsc(bool value); int get initalSortColumn; set initalSortColumn(int value); bool get initialSortEnabled; set initialSortEnabled(bool value); int get elementsPerPage; set elementsPerPage(int value); Map<String, String> get columns; set columns(Map<String, String> value); CustomPopupmenu? get customPopupmenu; set customPopupmenu(CustomPopupmenu? value); CustomThemeForWidget? get customTheme; set customTheme(CustomThemeForWidget? value);
/// Create a copy of CustomTableWidget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomTableWidgetCopyWith<CustomTableWidget> get copyWith => _$CustomTableWidgetCopyWithImpl<CustomTableWidget>(this as CustomTableWidget, _$identity);

  /// Serializes this CustomTableWidget to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'CustomTableWidget(isAbleToPopupMenu: $isAbleToPopupMenu, hasCustomTheme: $hasCustomTheme, type: $type, id: $id, name: $name, dataPoint: $dataPoint, header: $header, sortAsc: $sortAsc, initalSortColumn: $initalSortColumn, initialSortEnabled: $initialSortEnabled, elementsPerPage: $elementsPerPage, columns: $columns, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class $CustomTableWidgetCopyWith<$Res>  {
  factory $CustomTableWidgetCopyWith(CustomTableWidget value, $Res Function(CustomTableWidget) _then) = _$CustomTableWidgetCopyWithImpl;
@useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? header, bool sortAsc, int initalSortColumn, bool initialSortEnabled, int elementsPerPage, Map<String, String> columns, CustomPopupmenu? customPopupmenu, CustomThemeForWidget? customTheme
});


$CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class _$CustomTableWidgetCopyWithImpl<$Res>
    implements $CustomTableWidgetCopyWith<$Res> {
  _$CustomTableWidgetCopyWithImpl(this._self, this._then);

  final CustomTableWidget _self;
  final $Res Function(CustomTableWidget) _then;

/// Create a copy of CustomTableWidget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? header = freezed,Object? sortAsc = null,Object? initalSortColumn = null,Object? initialSortEnabled = null,Object? elementsPerPage = null,Object? columns = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as String?,sortAsc: null == sortAsc ? _self.sortAsc : sortAsc // ignore: cast_nullable_to_non_nullable
as bool,initalSortColumn: null == initalSortColumn ? _self.initalSortColumn : initalSortColumn // ignore: cast_nullable_to_non_nullable
as int,initialSortEnabled: null == initialSortEnabled ? _self.initialSortEnabled : initialSortEnabled // ignore: cast_nullable_to_non_nullable
as bool,elementsPerPage: null == elementsPerPage ? _self.elementsPerPage : elementsPerPage // ignore: cast_nullable_to_non_nullable
as int,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as Map<String, String>,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}
/// Create a copy of CustomTableWidget
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


/// Adds pattern-matching-related methods to [CustomTableWidget].
extension CustomTableWidgetPatterns on CustomTableWidget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomTableWidget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomTableWidget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomTableWidget value)  $default,){
final _that = this;
switch (_that) {
case _CustomTableWidget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomTableWidget value)?  $default,){
final _that = this;
switch (_that) {
case _CustomTableWidget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? header,  bool sortAsc,  int initalSortColumn,  bool initialSortEnabled,  int elementsPerPage,  Map<String, String> columns,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomTableWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.header,_that.sortAsc,_that.initalSortColumn,_that.initialSortEnabled,_that.elementsPerPage,_that.columns,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? header,  bool sortAsc,  int initalSortColumn,  bool initialSortEnabled,  int elementsPerPage,  Map<String, String> columns,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)  $default,) {final _that = this;
switch (_that) {
case _CustomTableWidget():
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.header,_that.sortAsc,_that.initalSortColumn,_that.initialSortEnabled,_that.elementsPerPage,_that.columns,_that.customPopupmenu,_that.customTheme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomWidgetTypeDeprecated type,  String id,  String name,  String? dataPoint,  String? header,  bool sortAsc,  int initalSortColumn,  bool initialSortEnabled,  int elementsPerPage,  Map<String, String> columns,  CustomPopupmenu? customPopupmenu,  CustomThemeForWidget? customTheme)?  $default,) {final _that = this;
switch (_that) {
case _CustomTableWidget() when $default != null:
return $default(_that.type,_that.id,_that.name,_that.dataPoint,_that.header,_that.sortAsc,_that.initalSortColumn,_that.initialSortEnabled,_that.elementsPerPage,_that.columns,_that.customPopupmenu,_that.customTheme);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomTableWidget extends CustomTableWidget implements CustomWidget {
   _CustomTableWidget({this.type = CustomWidgetTypeDeprecated.tableNew, required this.id, required this.name, required this.dataPoint, this.header, this.sortAsc = false, this.initalSortColumn = 0, this.initialSortEnabled = false, this.elementsPerPage = 10, required this.columns, this.customPopupmenu, this.customTheme}): super._();
  factory _CustomTableWidget.fromJson(Map<String, dynamic> json) => _$CustomTableWidgetFromJson(json);

@override@JsonKey()  CustomWidgetTypeDeprecated type;
@override  String id;
@override  String name;
@override  String? dataPoint;
@override  String? header;
@override@JsonKey()  bool sortAsc;
@override@JsonKey()  int initalSortColumn;
@override@JsonKey()  bool initialSortEnabled;
@override@JsonKey()  int elementsPerPage;
@override  Map<String, String> columns;
@override  CustomPopupmenu? customPopupmenu;
@override  CustomThemeForWidget? customTheme;

/// Create a copy of CustomTableWidget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomTableWidgetCopyWith<_CustomTableWidget> get copyWith => __$CustomTableWidgetCopyWithImpl<_CustomTableWidget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomTableWidgetToJson(this, );
}



@override
String toString() {
  return 'CustomTableWidget(type: $type, id: $id, name: $name, dataPoint: $dataPoint, header: $header, sortAsc: $sortAsc, initalSortColumn: $initalSortColumn, initialSortEnabled: $initialSortEnabled, elementsPerPage: $elementsPerPage, columns: $columns, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
}


}

/// @nodoc
abstract mixin class _$CustomTableWidgetCopyWith<$Res> implements $CustomTableWidgetCopyWith<$Res> {
  factory _$CustomTableWidgetCopyWith(_CustomTableWidget value, $Res Function(_CustomTableWidget) _then) = __$CustomTableWidgetCopyWithImpl;
@override @useResult
$Res call({
 CustomWidgetTypeDeprecated type, String id, String name, String? dataPoint, String? header, bool sortAsc, int initalSortColumn, bool initialSortEnabled, int elementsPerPage, Map<String, String> columns, CustomPopupmenu? customPopupmenu, CustomThemeForWidget? customTheme
});


@override $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;

}
/// @nodoc
class __$CustomTableWidgetCopyWithImpl<$Res>
    implements _$CustomTableWidgetCopyWith<$Res> {
  __$CustomTableWidgetCopyWithImpl(this._self, this._then);

  final _CustomTableWidget _self;
  final $Res Function(_CustomTableWidget) _then;

/// Create a copy of CustomTableWidget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? name = null,Object? dataPoint = freezed,Object? header = freezed,Object? sortAsc = null,Object? initalSortColumn = null,Object? initialSortEnabled = null,Object? elementsPerPage = null,Object? columns = null,Object? customPopupmenu = freezed,Object? customTheme = freezed,}) {
  return _then(_CustomTableWidget(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CustomWidgetTypeDeprecated,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dataPoint: freezed == dataPoint ? _self.dataPoint : dataPoint // ignore: cast_nullable_to_non_nullable
as String?,header: freezed == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as String?,sortAsc: null == sortAsc ? _self.sortAsc : sortAsc // ignore: cast_nullable_to_non_nullable
as bool,initalSortColumn: null == initalSortColumn ? _self.initalSortColumn : initalSortColumn // ignore: cast_nullable_to_non_nullable
as int,initialSortEnabled: null == initialSortEnabled ? _self.initialSortEnabled : initialSortEnabled // ignore: cast_nullable_to_non_nullable
as bool,elementsPerPage: null == elementsPerPage ? _self.elementsPerPage : elementsPerPage // ignore: cast_nullable_to_non_nullable
as int,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as Map<String, String>,customPopupmenu: freezed == customPopupmenu ? _self.customPopupmenu : customPopupmenu // ignore: cast_nullable_to_non_nullable
as CustomPopupmenu?,customTheme: freezed == customTheme ? _self.customTheme : customTheme // ignore: cast_nullable_to_non_nullable
as CustomThemeForWidget?,
  ));
}

/// Create a copy of CustomTableWidget
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
