// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_webview_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomWebViewWidget _$CustomWebViewWidgetFromJson(Map<String, dynamic> json) {
  return _CustomWebViewWidget.fromJson(json);
}

/// @nodoc
mixin _$CustomWebViewWidget {
  CustomWidgetTypeDeprecated get type => throw _privateConstructorUsedError;
  set type(CustomWidgetTypeDeprecated value) =>
      throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  bool get image => throw _privateConstructorUsedError;
  set image(bool value) => throw _privateConstructorUsedError;
  bool get enabledZoom => throw _privateConstructorUsedError;
  set enabledZoom(bool value) => throw _privateConstructorUsedError;
  bool get enableInlineScroll => throw _privateConstructorUsedError;
  set enableInlineScroll(bool value) => throw _privateConstructorUsedError;
  String? get dataPoint => throw _privateConstructorUsedError;
  set dataPoint(String? value) => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  set url(String? value) => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  set height(int value) => throw _privateConstructorUsedError;
  CustomPopupmenu? get customPopupmenu => throw _privateConstructorUsedError;
  set customPopupmenu(CustomPopupmenu? value) =>
      throw _privateConstructorUsedError;
  CustomThemeForWidget? get customTheme => throw _privateConstructorUsedError;
  set customTheme(CustomThemeForWidget? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomWebViewWidget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomWebViewWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomWebViewWidgetCopyWith<CustomWebViewWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomWebViewWidgetCopyWith<$Res> {
  factory $CustomWebViewWidgetCopyWith(
    CustomWebViewWidget value,
    $Res Function(CustomWebViewWidget) then,
  ) = _$CustomWebViewWidgetCopyWithImpl<$Res, CustomWebViewWidget>;
  @useResult
  $Res call({
    CustomWidgetTypeDeprecated type,
    String id,
    String name,
    bool image,
    bool enabledZoom,
    bool enableInlineScroll,
    String? dataPoint,
    String? url,
    int height,
    CustomPopupmenu? customPopupmenu,
    CustomThemeForWidget? customTheme,
  });

  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class _$CustomWebViewWidgetCopyWithImpl<$Res, $Val extends CustomWebViewWidget>
    implements $CustomWebViewWidgetCopyWith<$Res> {
  _$CustomWebViewWidgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomWebViewWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? enabledZoom = null,
    Object? enableInlineScroll = null,
    Object? dataPoint = freezed,
    Object? url = freezed,
    Object? height = null,
    Object? customPopupmenu = freezed,
    Object? customTheme = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as CustomWidgetTypeDeprecated,
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as bool,
            enabledZoom: null == enabledZoom
                ? _value.enabledZoom
                : enabledZoom // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableInlineScroll: null == enableInlineScroll
                ? _value.enableInlineScroll
                : enableInlineScroll // ignore: cast_nullable_to_non_nullable
                      as bool,
            dataPoint: freezed == dataPoint
                ? _value.dataPoint
                : dataPoint // ignore: cast_nullable_to_non_nullable
                      as String?,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int,
            customPopupmenu: freezed == customPopupmenu
                ? _value.customPopupmenu
                : customPopupmenu // ignore: cast_nullable_to_non_nullable
                      as CustomPopupmenu?,
            customTheme: freezed == customTheme
                ? _value.customTheme
                : customTheme // ignore: cast_nullable_to_non_nullable
                      as CustomThemeForWidget?,
          )
          as $Val,
    );
  }

  /// Create a copy of CustomWebViewWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu {
    if (_value.customPopupmenu == null) {
      return null;
    }

    return $CustomPopupmenuCopyWith<$Res>(_value.customPopupmenu!, (value) {
      return _then(_value.copyWith(customPopupmenu: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomWebViewWidgetImplCopyWith<$Res>
    implements $CustomWebViewWidgetCopyWith<$Res> {
  factory _$$CustomWebViewWidgetImplCopyWith(
    _$CustomWebViewWidgetImpl value,
    $Res Function(_$CustomWebViewWidgetImpl) then,
  ) = __$$CustomWebViewWidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CustomWidgetTypeDeprecated type,
    String id,
    String name,
    bool image,
    bool enabledZoom,
    bool enableInlineScroll,
    String? dataPoint,
    String? url,
    int height,
    CustomPopupmenu? customPopupmenu,
    CustomThemeForWidget? customTheme,
  });

  @override
  $CustomPopupmenuCopyWith<$Res>? get customPopupmenu;
}

/// @nodoc
class __$$CustomWebViewWidgetImplCopyWithImpl<$Res>
    extends _$CustomWebViewWidgetCopyWithImpl<$Res, _$CustomWebViewWidgetImpl>
    implements _$$CustomWebViewWidgetImplCopyWith<$Res> {
  __$$CustomWebViewWidgetImplCopyWithImpl(
    _$CustomWebViewWidgetImpl _value,
    $Res Function(_$CustomWebViewWidgetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomWebViewWidget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? enabledZoom = null,
    Object? enableInlineScroll = null,
    Object? dataPoint = freezed,
    Object? url = freezed,
    Object? height = null,
    Object? customPopupmenu = freezed,
    Object? customTheme = freezed,
  }) {
    return _then(
      _$CustomWebViewWidgetImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as CustomWidgetTypeDeprecated,
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as bool,
        enabledZoom: null == enabledZoom
            ? _value.enabledZoom
            : enabledZoom // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableInlineScroll: null == enableInlineScroll
            ? _value.enableInlineScroll
            : enableInlineScroll // ignore: cast_nullable_to_non_nullable
                  as bool,
        dataPoint: freezed == dataPoint
            ? _value.dataPoint
            : dataPoint // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int,
        customPopupmenu: freezed == customPopupmenu
            ? _value.customPopupmenu
            : customPopupmenu // ignore: cast_nullable_to_non_nullable
                  as CustomPopupmenu?,
        customTheme: freezed == customTheme
            ? _value.customTheme
            : customTheme // ignore: cast_nullable_to_non_nullable
                  as CustomThemeForWidget?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomWebViewWidgetImpl extends _CustomWebViewWidget {
  _$CustomWebViewWidgetImpl({
    this.type = CustomWidgetTypeDeprecated.webViewNew,
    required this.id,
    required this.name,
    this.image = false,
    this.enabledZoom = false,
    this.enableInlineScroll = false,
    required this.dataPoint,
    this.url,
    this.height = 500,
    this.customPopupmenu,
    this.customTheme,
  }) : super._();

  factory _$CustomWebViewWidgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomWebViewWidgetImplFromJson(json);

  @override
  @JsonKey()
  CustomWidgetTypeDeprecated type;
  @override
  String id;
  @override
  String name;
  @override
  @JsonKey()
  bool image;
  @override
  @JsonKey()
  bool enabledZoom;
  @override
  @JsonKey()
  bool enableInlineScroll;
  @override
  String? dataPoint;
  @override
  String? url;
  @override
  @JsonKey()
  int height;
  @override
  CustomPopupmenu? customPopupmenu;
  @override
  CustomThemeForWidget? customTheme;

  @override
  String toString() {
    return 'CustomWebViewWidget(type: $type, id: $id, name: $name, image: $image, enabledZoom: $enabledZoom, enableInlineScroll: $enableInlineScroll, dataPoint: $dataPoint, url: $url, height: $height, customPopupmenu: $customPopupmenu, customTheme: $customTheme)';
  }

  /// Create a copy of CustomWebViewWidget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomWebViewWidgetImplCopyWith<_$CustomWebViewWidgetImpl> get copyWith =>
      __$$CustomWebViewWidgetImplCopyWithImpl<_$CustomWebViewWidgetImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomWebViewWidgetImplToJson(this);
  }
}

abstract class _CustomWebViewWidget extends CustomWebViewWidget
    implements CustomWidget {
  factory _CustomWebViewWidget({
    CustomWidgetTypeDeprecated type,
    required String id,
    required String name,
    bool image,
    bool enabledZoom,
    bool enableInlineScroll,
    required String? dataPoint,
    String? url,
    int height,
    CustomPopupmenu? customPopupmenu,
    CustomThemeForWidget? customTheme,
  }) = _$CustomWebViewWidgetImpl;
  _CustomWebViewWidget._() : super._();

  factory _CustomWebViewWidget.fromJson(Map<String, dynamic> json) =
      _$CustomWebViewWidgetImpl.fromJson;

  @override
  CustomWidgetTypeDeprecated get type;
  set type(CustomWidgetTypeDeprecated value);
  @override
  String get id;
  set id(String value);
  @override
  String get name;
  set name(String value);
  @override
  bool get image;
  set image(bool value);
  @override
  bool get enabledZoom;
  set enabledZoom(bool value);
  @override
  bool get enableInlineScroll;
  set enableInlineScroll(bool value);
  @override
  String? get dataPoint;
  set dataPoint(String? value);
  @override
  String? get url;
  set url(String? value);
  @override
  int get height;
  set height(int value);
  @override
  CustomPopupmenu? get customPopupmenu;
  set customPopupmenu(CustomPopupmenu? value);
  @override
  CustomThemeForWidget? get customTheme;
  set customTheme(CustomThemeForWidget? value);

  /// Create a copy of CustomWebViewWidget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomWebViewWidgetImplCopyWith<_$CustomWebViewWidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
