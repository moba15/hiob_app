// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'async_search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AsyncSearchState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AsyncSearchState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncSearchState<$T>()';
}


}

/// @nodoc
class $AsyncSearchStateCopyWith<T,$Res>  {
$AsyncSearchStateCopyWith(AsyncSearchState<T> _, $Res Function(AsyncSearchState<T>) __);
}


/// Adds pattern-matching-related methods to [AsyncSearchState].
extension AsyncSearchStatePatterns<T> on AsyncSearchState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InitalAsyncSearchState<T> value)?  initial,TResult Function( LoadingAsyncSearchState<T> value)?  loading,TResult Function( ErrorAsyncSearchState<T> value)?  error,TResult Function( LoadedAsyncSearchState<T> value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InitalAsyncSearchState() when initial != null:
return initial(_that);case LoadingAsyncSearchState() when loading != null:
return loading(_that);case ErrorAsyncSearchState() when error != null:
return error(_that);case LoadedAsyncSearchState() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InitalAsyncSearchState<T> value)  initial,required TResult Function( LoadingAsyncSearchState<T> value)  loading,required TResult Function( ErrorAsyncSearchState<T> value)  error,required TResult Function( LoadedAsyncSearchState<T> value)  loaded,}){
final _that = this;
switch (_that) {
case InitalAsyncSearchState():
return initial(_that);case LoadingAsyncSearchState():
return loading(_that);case ErrorAsyncSearchState():
return error(_that);case LoadedAsyncSearchState():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InitalAsyncSearchState<T> value)?  initial,TResult? Function( LoadingAsyncSearchState<T> value)?  loading,TResult? Function( ErrorAsyncSearchState<T> value)?  error,TResult? Function( LoadedAsyncSearchState<T> value)?  loaded,}){
final _that = this;
switch (_that) {
case InitalAsyncSearchState() when initial != null:
return initial(_that);case LoadingAsyncSearchState() when loading != null:
return loading(_that);case ErrorAsyncSearchState() when error != null:
return error(_that);case LoadedAsyncSearchState() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String errorMsg)?  error,TResult Function( List<T> objects)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InitalAsyncSearchState() when initial != null:
return initial();case LoadingAsyncSearchState() when loading != null:
return loading();case ErrorAsyncSearchState() when error != null:
return error(_that.errorMsg);case LoadedAsyncSearchState() when loaded != null:
return loaded(_that.objects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String errorMsg)  error,required TResult Function( List<T> objects)  loaded,}) {final _that = this;
switch (_that) {
case InitalAsyncSearchState():
return initial();case LoadingAsyncSearchState():
return loading();case ErrorAsyncSearchState():
return error(_that.errorMsg);case LoadedAsyncSearchState():
return loaded(_that.objects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String errorMsg)?  error,TResult? Function( List<T> objects)?  loaded,}) {final _that = this;
switch (_that) {
case InitalAsyncSearchState() when initial != null:
return initial();case LoadingAsyncSearchState() when loading != null:
return loading();case ErrorAsyncSearchState() when error != null:
return error(_that.errorMsg);case LoadedAsyncSearchState() when loaded != null:
return loaded(_that.objects);case _:
  return null;

}
}

}

/// @nodoc


class InitalAsyncSearchState<T> implements AsyncSearchState<T> {
  const InitalAsyncSearchState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitalAsyncSearchState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncSearchState<$T>.initial()';
}


}




/// @nodoc


class LoadingAsyncSearchState<T> implements AsyncSearchState<T> {
  const LoadingAsyncSearchState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingAsyncSearchState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AsyncSearchState<$T>.loading()';
}


}




/// @nodoc


class ErrorAsyncSearchState<T> implements AsyncSearchState<T> {
  const ErrorAsyncSearchState({required this.errorMsg});
  

 final  String errorMsg;

/// Create a copy of AsyncSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorAsyncSearchStateCopyWith<T, ErrorAsyncSearchState<T>> get copyWith => _$ErrorAsyncSearchStateCopyWithImpl<T, ErrorAsyncSearchState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorAsyncSearchState<T>&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errorMsg);

@override
String toString() {
  return 'AsyncSearchState<$T>.error(errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $ErrorAsyncSearchStateCopyWith<T,$Res> implements $AsyncSearchStateCopyWith<T, $Res> {
  factory $ErrorAsyncSearchStateCopyWith(ErrorAsyncSearchState<T> value, $Res Function(ErrorAsyncSearchState<T>) _then) = _$ErrorAsyncSearchStateCopyWithImpl;
@useResult
$Res call({
 String errorMsg
});




}
/// @nodoc
class _$ErrorAsyncSearchStateCopyWithImpl<T,$Res>
    implements $ErrorAsyncSearchStateCopyWith<T, $Res> {
  _$ErrorAsyncSearchStateCopyWithImpl(this._self, this._then);

  final ErrorAsyncSearchState<T> _self;
  final $Res Function(ErrorAsyncSearchState<T>) _then;

/// Create a copy of AsyncSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMsg = null,}) {
  return _then(ErrorAsyncSearchState<T>(
errorMsg: null == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadedAsyncSearchState<T> implements AsyncSearchState<T> {
  const LoadedAsyncSearchState({required final  List<T> objects}): _objects = objects;
  

 final  List<T> _objects;
 List<T> get objects {
  if (_objects is EqualUnmodifiableListView) return _objects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_objects);
}


/// Create a copy of AsyncSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedAsyncSearchStateCopyWith<T, LoadedAsyncSearchState<T>> get copyWith => _$LoadedAsyncSearchStateCopyWithImpl<T, LoadedAsyncSearchState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedAsyncSearchState<T>&&const DeepCollectionEquality().equals(other._objects, _objects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_objects));

@override
String toString() {
  return 'AsyncSearchState<$T>.loaded(objects: $objects)';
}


}

/// @nodoc
abstract mixin class $LoadedAsyncSearchStateCopyWith<T,$Res> implements $AsyncSearchStateCopyWith<T, $Res> {
  factory $LoadedAsyncSearchStateCopyWith(LoadedAsyncSearchState<T> value, $Res Function(LoadedAsyncSearchState<T>) _then) = _$LoadedAsyncSearchStateCopyWithImpl;
@useResult
$Res call({
 List<T> objects
});




}
/// @nodoc
class _$LoadedAsyncSearchStateCopyWithImpl<T,$Res>
    implements $LoadedAsyncSearchStateCopyWith<T, $Res> {
  _$LoadedAsyncSearchStateCopyWithImpl(this._self, this._then);

  final LoadedAsyncSearchState<T> _self;
  final $Res Function(LoadedAsyncSearchState<T>) _then;

/// Create a copy of AsyncSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? objects = null,}) {
  return _then(LoadedAsyncSearchState<T>(
objects: null == objects ? _self._objects : objects // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}


}

// dart format on
