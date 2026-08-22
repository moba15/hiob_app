// This is a generated file - do not edit.
//
// Generated from notification/notification.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class FetchNotificationsRequest extends $pb.GeneratedMessage {
  factory FetchNotificationsRequest({
    $core.String? deviceId,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  FetchNotificationsRequest._();

  factory FetchNotificationsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchNotificationsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchNotificationsRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchNotificationsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchNotificationsRequest copyWith(
          void Function(FetchNotificationsRequest) updates) =>
      super.copyWith((message) => updates(message as FetchNotificationsRequest))
          as FetchNotificationsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchNotificationsRequest create() => FetchNotificationsRequest._();
  @$core.override
  FetchNotificationsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FetchNotificationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchNotificationsRequest>(create);
  static FetchNotificationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);
}

class NotificationContent extends $pb.GeneratedMessage {
  factory NotificationContent({
    $core.String? id,
    $core.String? title,
    $core.String? body,
    $fixnum.Int64? ts,
    $core.bool? group,
    $core.Iterable<$core.String>? data,
    $core.String? groupKey,
    $core.bool? locked,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (body != null) result.body = body;
    if (ts != null) result.ts = ts;
    if (group != null) result.group = group;
    if (data != null) result.data.addAll(data);
    if (groupKey != null) result.groupKey = groupKey;
    if (locked != null) result.locked = locked;
    return result;
  }

  NotificationContent._();

  factory NotificationContent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotificationContent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotificationContent',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'body')
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'ts', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(5, _omitFieldNames ? '' : 'group')
    ..pPS(7, _omitFieldNames ? '' : 'data')
    ..aOS(8, _omitFieldNames ? '' : 'groupKey', protoName: 'groupKey')
    ..aOB(9, _omitFieldNames ? '' : 'locked')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotificationContent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotificationContent copyWith(void Function(NotificationContent) updates) =>
      super.copyWith((message) => updates(message as NotificationContent))
          as NotificationContent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationContent create() => NotificationContent._();
  @$core.override
  NotificationContent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotificationContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotificationContent>(create);
  static NotificationContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get body => $_getSZ(2);
  @$pb.TagNumber(3)
  set body($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBody() => $_has(2);
  @$pb.TagNumber(3)
  void clearBody() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get ts => $_getI64(3);
  @$pb.TagNumber(4)
  set ts($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTs() => $_has(3);
  @$pb.TagNumber(4)
  void clearTs() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get group => $_getBF(4);
  @$pb.TagNumber(5)
  set group($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGroup() => $_has(4);
  @$pb.TagNumber(5)
  void clearGroup() => $_clearField(5);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get data => $_getList(5);

  @$pb.TagNumber(8)
  $core.String get groupKey => $_getSZ(6);
  @$pb.TagNumber(8)
  set groupKey($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasGroupKey() => $_has(6);
  @$pb.TagNumber(8)
  void clearGroupKey() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get locked => $_getBF(7);
  @$pb.TagNumber(9)
  set locked($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(9)
  $core.bool hasLocked() => $_has(7);
  @$pb.TagNumber(9)
  void clearLocked() => $_clearField(9);
}

class FetchNotificationsResponse extends $pb.GeneratedMessage {
  factory FetchNotificationsResponse({
    $core.Iterable<NotificationContent>? notifications,
  }) {
    final result = create();
    if (notifications != null) result.notifications.addAll(notifications);
    return result;
  }

  FetchNotificationsResponse._();

  factory FetchNotificationsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FetchNotificationsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FetchNotificationsResponse',
      createEmptyInstance: create)
    ..pPM<NotificationContent>(1, _omitFieldNames ? '' : 'notifications',
        subBuilder: NotificationContent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchNotificationsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FetchNotificationsResponse copyWith(
          void Function(FetchNotificationsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as FetchNotificationsResponse))
          as FetchNotificationsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchNotificationsResponse create() => FetchNotificationsResponse._();
  @$core.override
  FetchNotificationsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FetchNotificationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchNotificationsResponse>(create);
  static FetchNotificationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<NotificationContent> get notifications => $_getList(0);
}

class AckNotificationsRequest extends $pb.GeneratedMessage {
  factory AckNotificationsRequest({
    $core.String? deviceId,
    $core.Iterable<$core.String>? notificationIds,
  }) {
    final result = create();
    if (deviceId != null) result.deviceId = deviceId;
    if (notificationIds != null) result.notificationIds.addAll(notificationIds);
    return result;
  }

  AckNotificationsRequest._();

  factory AckNotificationsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AckNotificationsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AckNotificationsRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..pPS(2, _omitFieldNames ? '' : 'notificationIds',
        protoName: 'notificationIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AckNotificationsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AckNotificationsRequest copyWith(
          void Function(AckNotificationsRequest) updates) =>
      super.copyWith((message) => updates(message as AckNotificationsRequest))
          as AckNotificationsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AckNotificationsRequest create() => AckNotificationsRequest._();
  @$core.override
  AckNotificationsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AckNotificationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AckNotificationsRequest>(create);
  static AckNotificationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get notificationIds => $_getList(1);
}

class AckNotificationsResponse extends $pb.GeneratedMessage {
  factory AckNotificationsResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  AckNotificationsResponse._();

  factory AckNotificationsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AckNotificationsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AckNotificationsResponse',
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AckNotificationsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AckNotificationsResponse copyWith(
          void Function(AckNotificationsResponse) updates) =>
      super.copyWith((message) => updates(message as AckNotificationsResponse))
          as AckNotificationsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AckNotificationsResponse create() => AckNotificationsResponse._();
  @$core.override
  AckNotificationsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AckNotificationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AckNotificationsResponse>(create);
  static AckNotificationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
