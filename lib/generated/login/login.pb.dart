// This is a generated file - do not edit.
//
// Generated from login/login.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'login.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'login.pbenum.dart';

class CompatibilityRequest extends $pb.GeneratedMessage {
  factory CompatibilityRequest({
    $core.String? buildnumber,
    $core.String? versionumber,
  }) {
    final result = create();
    if (buildnumber != null) result.buildnumber = buildnumber;
    if (versionumber != null) result.versionumber = versionumber;
    return result;
  }

  CompatibilityRequest._();

  factory CompatibilityRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompatibilityRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompatibilityRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'buildnumber')
    ..aOS(2, _omitFieldNames ? '' : 'versionumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompatibilityRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompatibilityRequest copyWith(void Function(CompatibilityRequest) updates) =>
      super.copyWith((message) => updates(message as CompatibilityRequest))
          as CompatibilityRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompatibilityRequest create() => CompatibilityRequest._();
  @$core.override
  CompatibilityRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompatibilityRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompatibilityRequest>(create);
  static CompatibilityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get buildnumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set buildnumber($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBuildnumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildnumber() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get versionumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set versionumber($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVersionumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionumber() => $_clearField(2);
}

class CompatibilityResponse extends $pb.GeneratedMessage {
  factory CompatibilityResponse({
    $core.bool? compatible,
  }) {
    final result = create();
    if (compatible != null) result.compatible = compatible;
    return result;
  }

  CompatibilityResponse._();

  factory CompatibilityResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CompatibilityResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompatibilityResponse',
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'compatible')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompatibilityResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CompatibilityResponse copyWith(
          void Function(CompatibilityResponse) updates) =>
      super.copyWith((message) => updates(message as CompatibilityResponse))
          as CompatibilityResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompatibilityResponse create() => CompatibilityResponse._();
  @$core.override
  CompatibilityResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CompatibilityResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompatibilityResponse>(create);
  static CompatibilityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get compatible => $_getBF(0);
  @$pb.TagNumber(1)
  set compatible($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCompatible() => $_has(0);
  @$pb.TagNumber(1)
  void clearCompatible() => $_clearField(1);
}

class FirstPing extends $pb.GeneratedMessage {
  factory FirstPing({
    $core.String? buildnumber,
    $core.String? versionumber,
  }) {
    final result = create();
    if (buildnumber != null) result.buildnumber = buildnumber;
    if (versionumber != null) result.versionumber = versionumber;
    return result;
  }

  FirstPing._();

  factory FirstPing.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FirstPing.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FirstPing',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'buildnumber')
    ..aOS(2, _omitFieldNames ? '' : 'versionumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FirstPing clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FirstPing copyWith(void Function(FirstPing) updates) =>
      super.copyWith((message) => updates(message as FirstPing)) as FirstPing;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FirstPing create() => FirstPing._();
  @$core.override
  FirstPing createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static FirstPing getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FirstPing>(create);
  static FirstPing? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get buildnumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set buildnumber($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBuildnumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildnumber() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get versionumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set versionumber($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVersionumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionumber() => $_clearField(2);
}

class LoginRequest extends $pb.GeneratedMessage {
  factory LoginRequest({
    $core.String? deviceName,
    $core.String? deviceId,
    $core.String? key,
    $core.String? user,
    $core.String? password,
  }) {
    final result = create();
    if (deviceName != null) result.deviceName = deviceName;
    if (deviceId != null) result.deviceId = deviceId;
    if (key != null) result.key = key;
    if (user != null) result.user = user;
    if (password != null) result.password = password;
    return result;
  }

  LoginRequest._();

  factory LoginRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceName', protoName: 'deviceName')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(3, _omitFieldNames ? '' : 'key')
    ..aOS(4, _omitFieldNames ? '' : 'user')
    ..aOS(5, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginRequest copyWith(void Function(LoginRequest) updates) =>
      super.copyWith((message) => updates(message as LoginRequest))
          as LoginRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  @$core.override
  LoginRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceName => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceName() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get key => $_getSZ(2);
  @$pb.TagNumber(3)
  set key($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get user => $_getSZ(3);
  @$pb.TagNumber(4)
  set user($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearUser() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => $_clearField(5);
}

class LoginResponse extends $pb.GeneratedMessage {
  factory LoginResponse({
    LoginResponse_Status? status,
    $core.String? errorMsg,
    $core.String? sessionId,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (errorMsg != null) result.errorMsg = errorMsg;
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  LoginResponse._();

  factory LoginResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LoginResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginResponse',
      createEmptyInstance: create)
    ..aE<LoginResponse_Status>(1, _omitFieldNames ? '' : 'status',
        enumValues: LoginResponse_Status.values)
    ..aOS(2, _omitFieldNames ? '' : 'errorMsg', protoName: 'errorMsg')
    ..aOS(3, _omitFieldNames ? '' : 'sessionId', protoName: 'sessionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LoginResponse copyWith(void Function(LoginResponse) updates) =>
      super.copyWith((message) => updates(message as LoginResponse))
          as LoginResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  @$core.override
  LoginResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LoginResponse_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(LoginResponse_Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMsg($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasErrorMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMsg() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get sessionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sessionId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSessionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionId() => $_clearField(3);
}

class NewAesPacket extends $pb.GeneratedMessage {
  factory NewAesPacket() => create();

  NewAesPacket._();

  factory NewAesPacket.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewAesPacket.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewAesPacket',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewAesPacket clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewAesPacket copyWith(void Function(NewAesPacket) updates) =>
      super.copyWith((message) => updates(message as NewAesPacket))
          as NewAesPacket;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewAesPacket create() => NewAesPacket._();
  @$core.override
  NewAesPacket createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewAesPacket getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewAesPacket>(create);
  static NewAesPacket? _defaultInstance;
}

class WrongAesKeyPack extends $pb.GeneratedMessage {
  factory WrongAesKeyPack() => create();

  WrongAesKeyPack._();

  factory WrongAesKeyPack.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WrongAesKeyPack.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WrongAesKeyPack',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WrongAesKeyPack clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WrongAesKeyPack copyWith(void Function(WrongAesKeyPack) updates) =>
      super.copyWith((message) => updates(message as WrongAesKeyPack))
          as WrongAesKeyPack;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WrongAesKeyPack create() => WrongAesKeyPack._();
  @$core.override
  WrongAesKeyPack createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WrongAesKeyPack getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WrongAesKeyPack>(create);
  static WrongAesKeyPack? _defaultInstance;
}

class ApprovalRequest extends $pb.GeneratedMessage {
  factory ApprovalRequest({
    $core.String? deviceName,
    $core.String? deviceId,
  }) {
    final result = create();
    if (deviceName != null) result.deviceName = deviceName;
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  ApprovalRequest._();

  factory ApprovalRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApprovalRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApprovalRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceName', protoName: 'deviceName')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApprovalRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApprovalRequest copyWith(void Function(ApprovalRequest) updates) =>
      super.copyWith((message) => updates(message as ApprovalRequest))
          as ApprovalRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApprovalRequest create() => ApprovalRequest._();
  @$core.override
  ApprovalRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApprovalRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApprovalRequest>(create);
  static ApprovalRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceName => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceName() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => $_clearField(2);
}

class ApprovalResponse extends $pb.GeneratedMessage {
  factory ApprovalResponse({
    ApprovalResponse_Status? status,
    $core.String? key,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (key != null) result.key = key;
    return result;
  }

  ApprovalResponse._();

  factory ApprovalResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApprovalResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApprovalResponse',
      createEmptyInstance: create)
    ..aE<ApprovalResponse_Status>(1, _omitFieldNames ? '' : 'status',
        enumValues: ApprovalResponse_Status.values)
    ..aOS(2, _omitFieldNames ? '' : 'key')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApprovalResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApprovalResponse copyWith(void Function(ApprovalResponse) updates) =>
      super.copyWith((message) => updates(message as ApprovalResponse))
          as ApprovalResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApprovalResponse create() => ApprovalResponse._();
  @$core.override
  ApprovalResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApprovalResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApprovalResponse>(create);
  static ApprovalResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ApprovalResponse_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ApprovalResponse_Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
