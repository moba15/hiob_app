//
//  Generated code. Do not modify.
//  source: config_sync/config_sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'config_sync.pbenum.dart';

export 'config_sync.pbenum.dart';

class AvailableConfigsRequest extends $pb.GeneratedMessage {
  factory AvailableConfigsRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  AvailableConfigsRequest._() : super();
  factory AvailableConfigsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvailableConfigsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AvailableConfigsRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvailableConfigsRequest clone() =>
      AvailableConfigsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvailableConfigsRequest copyWith(
          void Function(AvailableConfigsRequest) updates) =>
      super.copyWith((message) => updates(message as AvailableConfigsRequest))
          as AvailableConfigsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailableConfigsRequest create() => AvailableConfigsRequest._();
  AvailableConfigsRequest createEmptyInstance() => create();
  static $pb.PbList<AvailableConfigsRequest> createRepeated() =>
      $pb.PbList<AvailableConfigsRequest>();
  @$core.pragma('dart2js:noInline')
  static AvailableConfigsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvailableConfigsRequest>(create);
  static AvailableConfigsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class AvailableConfigsResponse extends $pb.GeneratedMessage {
  factory AvailableConfigsResponse({
    $core.Iterable<$core.String>? configNames,
  }) {
    final $result = create();
    if (configNames != null) {
      $result.configNames.addAll(configNames);
    }
    return $result;
  }
  AvailableConfigsResponse._() : super();
  factory AvailableConfigsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AvailableConfigsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AvailableConfigsResponse',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'configNames', protoName: 'configNames')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AvailableConfigsResponse clone() =>
      AvailableConfigsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AvailableConfigsResponse copyWith(
          void Function(AvailableConfigsResponse) updates) =>
      super.copyWith((message) => updates(message as AvailableConfigsResponse))
          as AvailableConfigsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AvailableConfigsResponse create() => AvailableConfigsResponse._();
  AvailableConfigsResponse createEmptyInstance() => create();
  static $pb.PbList<AvailableConfigsResponse> createRepeated() =>
      $pb.PbList<AvailableConfigsResponse>();
  @$core.pragma('dart2js:noInline')
  static AvailableConfigsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AvailableConfigsResponse>(create);
  static AvailableConfigsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get configNames => $_getList(0);
}

class ConfigSyncUpRequest extends $pb.GeneratedMessage {
  factory ConfigSyncUpRequest({
    $core.String? userId,
    Config? config,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (config != null) {
      $result.config = config;
    }
    return $result;
  }
  ConfigSyncUpRequest._() : super();
  factory ConfigSyncUpRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigSyncUpRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigSyncUpRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOM<Config>(3, _omitFieldNames ? '' : 'config', subBuilder: Config.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigSyncUpRequest clone() => ConfigSyncUpRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigSyncUpRequest copyWith(void Function(ConfigSyncUpRequest) updates) =>
      super.copyWith((message) => updates(message as ConfigSyncUpRequest))
          as ConfigSyncUpRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigSyncUpRequest create() => ConfigSyncUpRequest._();
  ConfigSyncUpRequest createEmptyInstance() => create();
  static $pb.PbList<ConfigSyncUpRequest> createRepeated() =>
      $pb.PbList<ConfigSyncUpRequest>();
  @$core.pragma('dart2js:noInline')
  static ConfigSyncUpRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigSyncUpRequest>(create);
  static ConfigSyncUpRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(3)
  Config get config => $_getN(1);
  @$pb.TagNumber(3)
  set config(Config v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasConfig() => $_has(1);
  @$pb.TagNumber(3)
  void clearConfig() => clearField(3);
  @$pb.TagNumber(3)
  Config ensureConfig() => $_ensure(1);
}

class ConfigSyncUpResponse extends $pb.GeneratedMessage {
  factory ConfigSyncUpResponse({
    $core.String? userId,
    $core.bool? success,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  ConfigSyncUpResponse._() : super();
  factory ConfigSyncUpResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigSyncUpResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigSyncUpResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigSyncUpResponse clone() =>
      ConfigSyncUpResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigSyncUpResponse copyWith(void Function(ConfigSyncUpResponse) updates) =>
      super.copyWith((message) => updates(message as ConfigSyncUpResponse))
          as ConfigSyncUpResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigSyncUpResponse create() => ConfigSyncUpResponse._();
  ConfigSyncUpResponse createEmptyInstance() => create();
  static $pb.PbList<ConfigSyncUpResponse> createRepeated() =>
      $pb.PbList<ConfigSyncUpResponse>();
  @$core.pragma('dart2js:noInline')
  static ConfigSyncUpResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigSyncUpResponse>(create);
  static ConfigSyncUpResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);
}

class ConfigSyncDownRequest extends $pb.GeneratedMessage {
  factory ConfigSyncDownRequest({
    $core.String? userId,
    $core.String? configName,
    SyncType? syncType,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (configName != null) {
      $result.configName = configName;
    }
    if (syncType != null) {
      $result.syncType = syncType;
    }
    return $result;
  }
  ConfigSyncDownRequest._() : super();
  factory ConfigSyncDownRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigSyncDownRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigSyncDownRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'configName', protoName: 'configName')
    ..e<SyncType>(3, _omitFieldNames ? '' : 'syncType', $pb.PbFieldType.OE,
        protoName: 'syncType',
        defaultOrMaker: SyncType.SYNC_ALL,
        valueOf: SyncType.valueOf,
        enumValues: SyncType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigSyncDownRequest clone() =>
      ConfigSyncDownRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigSyncDownRequest copyWith(
          void Function(ConfigSyncDownRequest) updates) =>
      super.copyWith((message) => updates(message as ConfigSyncDownRequest))
          as ConfigSyncDownRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigSyncDownRequest create() => ConfigSyncDownRequest._();
  ConfigSyncDownRequest createEmptyInstance() => create();
  static $pb.PbList<ConfigSyncDownRequest> createRepeated() =>
      $pb.PbList<ConfigSyncDownRequest>();
  @$core.pragma('dart2js:noInline')
  static ConfigSyncDownRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigSyncDownRequest>(create);
  static ConfigSyncDownRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get configName => $_getSZ(1);
  @$pb.TagNumber(2)
  set configName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConfigName() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfigName() => clearField(2);

  @$pb.TagNumber(3)
  SyncType get syncType => $_getN(2);
  @$pb.TagNumber(3)
  set syncType(SyncType v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSyncType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSyncType() => clearField(3);
}

class ConfigCreateDeleteRequest extends $pb.GeneratedMessage {
  factory ConfigCreateDeleteRequest({
    $core.String? userId,
    $core.String? configName,
    $core.bool? delete,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (configName != null) {
      $result.configName = configName;
    }
    if (delete != null) {
      $result.delete = delete;
    }
    return $result;
  }
  ConfigCreateDeleteRequest._() : super();
  factory ConfigCreateDeleteRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigCreateDeleteRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigCreateDeleteRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'configName', protoName: 'configName')
    ..aOB(3, _omitFieldNames ? '' : 'delete')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigCreateDeleteRequest clone() =>
      ConfigCreateDeleteRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigCreateDeleteRequest copyWith(
          void Function(ConfigCreateDeleteRequest) updates) =>
      super.copyWith((message) => updates(message as ConfigCreateDeleteRequest))
          as ConfigCreateDeleteRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigCreateDeleteRequest create() => ConfigCreateDeleteRequest._();
  ConfigCreateDeleteRequest createEmptyInstance() => create();
  static $pb.PbList<ConfigCreateDeleteRequest> createRepeated() =>
      $pb.PbList<ConfigCreateDeleteRequest>();
  @$core.pragma('dart2js:noInline')
  static ConfigCreateDeleteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigCreateDeleteRequest>(create);
  static ConfigCreateDeleteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get configName => $_getSZ(1);
  @$pb.TagNumber(2)
  set configName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConfigName() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfigName() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get delete => $_getBF(2);
  @$pb.TagNumber(3)
  set delete($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDelete() => $_has(2);
  @$pb.TagNumber(3)
  void clearDelete() => clearField(3);
}

class ConfigCreateDeleteResponse extends $pb.GeneratedMessage {
  factory ConfigCreateDeleteResponse({
    $core.String? userId,
    $core.Iterable<$core.String>? configNames,
    $core.bool? success,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (configNames != null) {
      $result.configNames.addAll(configNames);
    }
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  ConfigCreateDeleteResponse._() : super();
  factory ConfigCreateDeleteResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigCreateDeleteResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigCreateDeleteResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..pPS(2, _omitFieldNames ? '' : 'configNames', protoName: 'configNames')
    ..aOB(3, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigCreateDeleteResponse clone() =>
      ConfigCreateDeleteResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigCreateDeleteResponse copyWith(
          void Function(ConfigCreateDeleteResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ConfigCreateDeleteResponse))
          as ConfigCreateDeleteResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigCreateDeleteResponse create() => ConfigCreateDeleteResponse._();
  ConfigCreateDeleteResponse createEmptyInstance() => create();
  static $pb.PbList<ConfigCreateDeleteResponse> createRepeated() =>
      $pb.PbList<ConfigCreateDeleteResponse>();
  @$core.pragma('dart2js:noInline')
  static ConfigCreateDeleteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigCreateDeleteResponse>(create);
  static ConfigCreateDeleteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get configNames => $_getList(1);

  @$pb.TagNumber(3)
  $core.bool get success => $_getBF(2);
  @$pb.TagNumber(3)
  set success($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSuccess() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccess() => clearField(3);
}

class Config extends $pb.GeneratedMessage {
  factory Config({
    $core.String? name,
    $core.String? screens,
    $core.String? templates,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (screens != null) {
      $result.screens = screens;
    }
    if (templates != null) {
      $result.templates = templates;
    }
    return $result;
  }
  Config._() : super();
  factory Config.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Config.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Config',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'screens')
    ..aOS(3, _omitFieldNames ? '' : 'templates')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Config clone() => Config()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Config copyWith(void Function(Config) updates) =>
      super.copyWith((message) => updates(message as Config)) as Config;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Config create() => Config._();
  Config createEmptyInstance() => create();
  static $pb.PbList<Config> createRepeated() => $pb.PbList<Config>();
  @$core.pragma('dart2js:noInline')
  static Config getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Config>(create);
  static Config? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get screens => $_getSZ(1);
  @$pb.TagNumber(2)
  set screens($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasScreens() => $_has(1);
  @$pb.TagNumber(2)
  void clearScreens() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get templates => $_getSZ(2);
  @$pb.TagNumber(3)
  set templates($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTemplates() => $_has(2);
  @$pb.TagNumber(3)
  void clearTemplates() => clearField(3);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
