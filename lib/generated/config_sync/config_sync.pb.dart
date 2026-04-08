// This is a generated file - do not edit.
//
// Generated from config_sync/config_sync.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'config_sync.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'config_sync.pbenum.dart';

class AvailableConfigsRequest extends $pb.GeneratedMessage {
  factory AvailableConfigsRequest({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  AvailableConfigsRequest._();

  factory AvailableConfigsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AvailableConfigsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AvailableConfigsRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailableConfigsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailableConfigsRequest copyWith(
          void Function(AvailableConfigsRequest) updates) =>
      super.copyWith((message) => updates(message as AvailableConfigsRequest))
          as AvailableConfigsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailableConfigsRequest create() => AvailableConfigsRequest._();
  @$core.override
  AvailableConfigsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AvailableConfigsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvailableConfigsRequest>(create);
  static AvailableConfigsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class AvailableConfigsResponse extends $pb.GeneratedMessage {
  factory AvailableConfigsResponse({
    $core.Iterable<$core.String>? configNames,
  }) {
    final result = create();
    if (configNames != null) result.configNames.addAll(configNames);
    return result;
  }

  AvailableConfigsResponse._();

  factory AvailableConfigsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AvailableConfigsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AvailableConfigsResponse',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'configNames', protoName: 'configNames')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailableConfigsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AvailableConfigsResponse copyWith(
          void Function(AvailableConfigsResponse) updates) =>
      super.copyWith((message) => updates(message as AvailableConfigsResponse))
          as AvailableConfigsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailableConfigsResponse create() => AvailableConfigsResponse._();
  @$core.override
  AvailableConfigsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AvailableConfigsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvailableConfigsResponse>(create);
  static AvailableConfigsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get configNames => $_getList(0);
}

class ConfigSyncUpRequest extends $pb.GeneratedMessage {
  factory ConfigSyncUpRequest({
    $core.String? userId,
    Config? config,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (config != null) result.config = config;
    return result;
  }

  ConfigSyncUpRequest._();

  factory ConfigSyncUpRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConfigSyncUpRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigSyncUpRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOM<Config>(3, _omitFieldNames ? '' : 'config', subBuilder: Config.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigSyncUpRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigSyncUpRequest copyWith(void Function(ConfigSyncUpRequest) updates) =>
      super.copyWith((message) => updates(message as ConfigSyncUpRequest))
          as ConfigSyncUpRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigSyncUpRequest create() => ConfigSyncUpRequest._();
  @$core.override
  ConfigSyncUpRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConfigSyncUpRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigSyncUpRequest>(create);
  static ConfigSyncUpRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(3)
  Config get config => $_getN(1);
  @$pb.TagNumber(3)
  set config(Config value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(3)
  void clearConfig() => $_clearField(3);
  @$pb.TagNumber(3)
  Config ensureConfig() => $_ensure(1);
}

class ConfigSyncUpResponse extends $pb.GeneratedMessage {
  factory ConfigSyncUpResponse({
    $core.String? userId,
    $core.bool? success,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (success != null) result.success = success;
    return result;
  }

  ConfigSyncUpResponse._();

  factory ConfigSyncUpResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConfigSyncUpResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigSyncUpResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigSyncUpResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigSyncUpResponse copyWith(void Function(ConfigSyncUpResponse) updates) =>
      super.copyWith((message) => updates(message as ConfigSyncUpResponse))
          as ConfigSyncUpResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigSyncUpResponse create() => ConfigSyncUpResponse._();
  @$core.override
  ConfigSyncUpResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConfigSyncUpResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigSyncUpResponse>(create);
  static ConfigSyncUpResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => $_clearField(2);
}

class ConfigSyncDownRequest extends $pb.GeneratedMessage {
  factory ConfigSyncDownRequest({
    $core.String? userId,
    $core.String? configName,
    SyncType? syncType,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (configName != null) result.configName = configName;
    if (syncType != null) result.syncType = syncType;
    return result;
  }

  ConfigSyncDownRequest._();

  factory ConfigSyncDownRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConfigSyncDownRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigSyncDownRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'configName', protoName: 'configName')
    ..aE<SyncType>(3, _omitFieldNames ? '' : 'syncType',
        protoName: 'syncType', enumValues: SyncType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigSyncDownRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigSyncDownRequest copyWith(
          void Function(ConfigSyncDownRequest) updates) =>
      super.copyWith((message) => updates(message as ConfigSyncDownRequest))
          as ConfigSyncDownRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigSyncDownRequest create() => ConfigSyncDownRequest._();
  @$core.override
  ConfigSyncDownRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConfigSyncDownRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigSyncDownRequest>(create);
  static ConfigSyncDownRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get configName => $_getSZ(1);
  @$pb.TagNumber(2)
  set configName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConfigName() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfigName() => $_clearField(2);

  @$pb.TagNumber(3)
  SyncType get syncType => $_getN(2);
  @$pb.TagNumber(3)
  set syncType(SyncType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSyncType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSyncType() => $_clearField(3);
}

class ConfigCreateDeleteRequest extends $pb.GeneratedMessage {
  factory ConfigCreateDeleteRequest({
    $core.String? userId,
    $core.String? configName,
    $core.bool? delete,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (configName != null) result.configName = configName;
    if (delete != null) result.delete = delete;
    return result;
  }

  ConfigCreateDeleteRequest._();

  factory ConfigCreateDeleteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConfigCreateDeleteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigCreateDeleteRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'configName', protoName: 'configName')
    ..aOB(3, _omitFieldNames ? '' : 'delete')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigCreateDeleteRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigCreateDeleteRequest copyWith(
          void Function(ConfigCreateDeleteRequest) updates) =>
      super.copyWith((message) => updates(message as ConfigCreateDeleteRequest))
          as ConfigCreateDeleteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigCreateDeleteRequest create() => ConfigCreateDeleteRequest._();
  @$core.override
  ConfigCreateDeleteRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConfigCreateDeleteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigCreateDeleteRequest>(create);
  static ConfigCreateDeleteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get configName => $_getSZ(1);
  @$pb.TagNumber(2)
  set configName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConfigName() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfigName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get delete => $_getBF(2);
  @$pb.TagNumber(3)
  set delete($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDelete() => $_has(2);
  @$pb.TagNumber(3)
  void clearDelete() => $_clearField(3);
}

class ConfigCreateDeleteResponse extends $pb.GeneratedMessage {
  factory ConfigCreateDeleteResponse({
    $core.String? userId,
    $core.Iterable<$core.String>? configNames,
    $core.bool? success,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (configNames != null) result.configNames.addAll(configNames);
    if (success != null) result.success = success;
    return result;
  }

  ConfigCreateDeleteResponse._();

  factory ConfigCreateDeleteResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConfigCreateDeleteResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigCreateDeleteResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..pPS(2, _omitFieldNames ? '' : 'configNames', protoName: 'configNames')
    ..aOB(3, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigCreateDeleteResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfigCreateDeleteResponse copyWith(
          void Function(ConfigCreateDeleteResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ConfigCreateDeleteResponse))
          as ConfigCreateDeleteResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigCreateDeleteResponse create() => ConfigCreateDeleteResponse._();
  @$core.override
  ConfigCreateDeleteResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConfigCreateDeleteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigCreateDeleteResponse>(create);
  static ConfigCreateDeleteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get configNames => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => $_clearField(3);
}

class Config extends $pb.GeneratedMessage {
  factory Config({
    $core.String? name,
    $core.String? screens,
    $core.String? templates,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (screens != null) result.screens = screens;
    if (templates != null) result.templates = templates;
    return result;
  }

  Config._();

  factory Config.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Config.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Config',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'screens')
    ..aOS(3, _omitFieldNames ? '' : 'templates')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Config clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Config copyWith(void Function(Config) updates) =>
      super.copyWith((message) => updates(message as Config)) as Config;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Config create() => Config._();
  @$core.override
  Config createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Config getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Config>(create);
  static Config? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get screens => $_getSZ(1);
  @$pb.TagNumber(2)
  set screens($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasScreens() => $_has(1);
  @$pb.TagNumber(2)
  void clearScreens() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get templates => $_getSZ(2);
  @$pb.TagNumber(3)
  set templates($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTemplates() => $_has(2);
  @$pb.TagNumber(3)
  void clearTemplates() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
