//
//  Generated code. Do not modify.
//  source: login/login.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'login.pbenum.dart';

export 'login.pbenum.dart';

class CompatibilityRequest extends $pb.GeneratedMessage {
  factory CompatibilityRequest({
    $core.String? buildnumber,
    $core.String? versionumber,
  }) {
    final $result = create();
    if (buildnumber != null) {
      $result.buildnumber = buildnumber;
    }
    if (versionumber != null) {
      $result.versionumber = versionumber;
    }
    return $result;
  }
  CompatibilityRequest._() : super();
  factory CompatibilityRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CompatibilityRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompatibilityRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'buildnumber')
    ..aOS(2, _omitFieldNames ? '' : 'versionumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CompatibilityRequest clone() =>
      CompatibilityRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CompatibilityRequest copyWith(void Function(CompatibilityRequest) updates) =>
      super.copyWith((message) => updates(message as CompatibilityRequest))
          as CompatibilityRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompatibilityRequest create() => CompatibilityRequest._();
  CompatibilityRequest createEmptyInstance() => create();
  static $pb.PbList<CompatibilityRequest> createRepeated() =>
      $pb.PbList<CompatibilityRequest>();
  @$core.pragma('dart2js:noInline')
  static CompatibilityRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompatibilityRequest>(create);
  static CompatibilityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get buildnumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set buildnumber($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBuildnumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildnumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get versionumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set versionumber($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersionumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionumber() => clearField(2);
}

class CompatibilityResponse extends $pb.GeneratedMessage {
  factory CompatibilityResponse({
    $core.String? buildnumber,
    $core.String? versionumber,
  }) {
    final $result = create();
    if (buildnumber != null) {
      $result.buildnumber = buildnumber;
    }
    if (versionumber != null) {
      $result.versionumber = versionumber;
    }
    return $result;
  }
  CompatibilityResponse._() : super();
  factory CompatibilityResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CompatibilityResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CompatibilityResponse',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'buildnumber')
    ..aOS(2, _omitFieldNames ? '' : 'versionumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CompatibilityResponse clone() =>
      CompatibilityResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CompatibilityResponse copyWith(
          void Function(CompatibilityResponse) updates) =>
      super.copyWith((message) => updates(message as CompatibilityResponse))
          as CompatibilityResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CompatibilityResponse create() => CompatibilityResponse._();
  CompatibilityResponse createEmptyInstance() => create();
  static $pb.PbList<CompatibilityResponse> createRepeated() =>
      $pb.PbList<CompatibilityResponse>();
  @$core.pragma('dart2js:noInline')
  static CompatibilityResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CompatibilityResponse>(create);
  static CompatibilityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get buildnumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set buildnumber($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBuildnumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildnumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get versionumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set versionumber($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersionumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionumber() => clearField(2);
}

class FirstPing extends $pb.GeneratedMessage {
  factory FirstPing({
    $core.String? buildnumber,
    $core.String? versionumber,
  }) {
    final $result = create();
    if (buildnumber != null) {
      $result.buildnumber = buildnumber;
    }
    if (versionumber != null) {
      $result.versionumber = versionumber;
    }
    return $result;
  }
  FirstPing._() : super();
  factory FirstPing.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FirstPing.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FirstPing',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'buildnumber')
    ..aOS(2, _omitFieldNames ? '' : 'versionumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FirstPing clone() => FirstPing()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FirstPing copyWith(void Function(FirstPing) updates) =>
      super.copyWith((message) => updates(message as FirstPing)) as FirstPing;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FirstPing create() => FirstPing._();
  FirstPing createEmptyInstance() => create();
  static $pb.PbList<FirstPing> createRepeated() => $pb.PbList<FirstPing>();
  @$core.pragma('dart2js:noInline')
  static FirstPing getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FirstPing>(create);
  static FirstPing? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get buildnumber => $_getSZ(0);
  @$pb.TagNumber(1)
  set buildnumber($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBuildnumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildnumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get versionumber => $_getSZ(1);
  @$pb.TagNumber(2)
  set versionumber($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasVersionumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersionumber() => clearField(2);
}

class LoginRequest extends $pb.GeneratedMessage {
  factory LoginRequest({
    $core.String? deviceName,
    $core.String? deviceId,
    $core.String? key,
    $core.String? user,
    $core.String? password,
  }) {
    final $result = create();
    if (deviceName != null) {
      $result.deviceName = deviceName;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    if (key != null) {
      $result.key = key;
    }
    if (user != null) {
      $result.user = user;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  LoginRequest._() : super();
  factory LoginRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceName', protoName: 'deviceName')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..aOS(3, _omitFieldNames ? '' : 'key')
    ..aOS(4, _omitFieldNames ? '' : 'user')
    ..aOS(5, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) =>
      super.copyWith((message) => updates(message as LoginRequest))
          as LoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() =>
      $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceName => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDeviceName() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get key => $_getSZ(2);
  @$pb.TagNumber(3)
  set key($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get user => $_getSZ(3);
  @$pb.TagNumber(4)
  set user($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUser() => $_has(3);
  @$pb.TagNumber(4)
  void clearUser() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get password => $_getSZ(4);
  @$pb.TagNumber(5)
  set password($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearPassword() => clearField(5);
}

class LoginResponse extends $pb.GeneratedMessage {
  factory LoginResponse({
    LoginResponse_Status? status,
    $core.String? errorMsg,
    $core.String? sessionId,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (errorMsg != null) {
      $result.errorMsg = errorMsg;
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  LoginResponse._() : super();
  factory LoginResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory LoginResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LoginResponse',
      createEmptyInstance: create)
    ..e<LoginResponse_Status>(
        1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: LoginResponse_Status.succesfull,
        valueOf: LoginResponse_Status.valueOf,
        enumValues: LoginResponse_Status.values)
    ..aOS(2, _omitFieldNames ? '' : 'errorMsg', protoName: 'errorMsg')
    ..aOS(3, _omitFieldNames ? '' : 'sessionId', protoName: 'sessionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  LoginResponse clone() => LoginResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  LoginResponse copyWith(void Function(LoginResponse) updates) =>
      super.copyWith((message) => updates(message as LoginResponse))
          as LoginResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginResponse create() => LoginResponse._();
  LoginResponse createEmptyInstance() => create();
  static $pb.PbList<LoginResponse> createRepeated() =>
      $pb.PbList<LoginResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LoginResponse>(create);
  static LoginResponse? _defaultInstance;

  @$pb.TagNumber(1)
  LoginResponse_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(LoginResponse_Status v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMsg($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasErrorMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get sessionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sessionId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSessionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessionId() => clearField(3);
}

class NewAesPacket extends $pb.GeneratedMessage {
  factory NewAesPacket() => create();
  NewAesPacket._() : super();
  factory NewAesPacket.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NewAesPacket.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewAesPacket',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NewAesPacket clone() => NewAesPacket()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NewAesPacket copyWith(void Function(NewAesPacket) updates) =>
      super.copyWith((message) => updates(message as NewAesPacket))
          as NewAesPacket;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewAesPacket create() => NewAesPacket._();
  NewAesPacket createEmptyInstance() => create();
  static $pb.PbList<NewAesPacket> createRepeated() =>
      $pb.PbList<NewAesPacket>();
  @$core.pragma('dart2js:noInline')
  static NewAesPacket getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewAesPacket>(create);
  static NewAesPacket? _defaultInstance;
}

class WrongAesKeyPack extends $pb.GeneratedMessage {
  factory WrongAesKeyPack() => create();
  WrongAesKeyPack._() : super();
  factory WrongAesKeyPack.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WrongAesKeyPack.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WrongAesKeyPack',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WrongAesKeyPack clone() => WrongAesKeyPack()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WrongAesKeyPack copyWith(void Function(WrongAesKeyPack) updates) =>
      super.copyWith((message) => updates(message as WrongAesKeyPack))
          as WrongAesKeyPack;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WrongAesKeyPack create() => WrongAesKeyPack._();
  WrongAesKeyPack createEmptyInstance() => create();
  static $pb.PbList<WrongAesKeyPack> createRepeated() =>
      $pb.PbList<WrongAesKeyPack>();
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
    final $result = create();
    if (deviceName != null) {
      $result.deviceName = deviceName;
    }
    if (deviceId != null) {
      $result.deviceId = deviceId;
    }
    return $result;
  }
  ApprovalRequest._() : super();
  factory ApprovalRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApprovalRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApprovalRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deviceName', protoName: 'deviceName')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId', protoName: 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApprovalRequest clone() => ApprovalRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApprovalRequest copyWith(void Function(ApprovalRequest) updates) =>
      super.copyWith((message) => updates(message as ApprovalRequest))
          as ApprovalRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApprovalRequest create() => ApprovalRequest._();
  ApprovalRequest createEmptyInstance() => create();
  static $pb.PbList<ApprovalRequest> createRepeated() =>
      $pb.PbList<ApprovalRequest>();
  @$core.pragma('dart2js:noInline')
  static ApprovalRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApprovalRequest>(create);
  static ApprovalRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deviceName => $_getSZ(0);
  @$pb.TagNumber(1)
  set deviceName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDeviceName() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => clearField(2);
}

class ApprovalResponse extends $pb.GeneratedMessage {
  factory ApprovalResponse({
    ApprovalResponse_Status? status,
    $core.String? key,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (key != null) {
      $result.key = key;
    }
    return $result;
  }
  ApprovalResponse._() : super();
  factory ApprovalResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ApprovalResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApprovalResponse',
      createEmptyInstance: create)
    ..e<ApprovalResponse_Status>(
        1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: ApprovalResponse_Status.aprroved,
        valueOf: ApprovalResponse_Status.valueOf,
        enumValues: ApprovalResponse_Status.values)
    ..aOS(2, _omitFieldNames ? '' : 'key')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ApprovalResponse clone() => ApprovalResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ApprovalResponse copyWith(void Function(ApprovalResponse) updates) =>
      super.copyWith((message) => updates(message as ApprovalResponse))
          as ApprovalResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApprovalResponse create() => ApprovalResponse._();
  ApprovalResponse createEmptyInstance() => create();
  static $pb.PbList<ApprovalResponse> createRepeated() =>
      $pb.PbList<ApprovalResponse>();
  @$core.pragma('dart2js:noInline')
  static ApprovalResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApprovalResponse>(create);
  static ApprovalResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ApprovalResponse_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(ApprovalResponse_Status v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get key => $_getSZ(1);
  @$pb.TagNumber(2)
  set key($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
