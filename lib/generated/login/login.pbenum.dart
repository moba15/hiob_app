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

class LoginResponse_Status extends $pb.ProtobufEnum {
  static const LoginResponse_Status succesfull = LoginResponse_Status._(0, _omitEnumNames ? '' : 'succesfull');
  static const LoginResponse_Status wrongKey = LoginResponse_Status._(1, _omitEnumNames ? '' : 'wrongKey');
  static const LoginResponse_Status wrongPassword = LoginResponse_Status._(2, _omitEnumNames ? '' : 'wrongPassword');
  static const LoginResponse_Status error = LoginResponse_Status._(3, _omitEnumNames ? '' : 'error');
  static const LoginResponse_Status notApproved = LoginResponse_Status._(4, _omitEnumNames ? '' : 'notApproved');

  static const $core.List<LoginResponse_Status> values = <LoginResponse_Status> [
    succesfull,
    wrongKey,
    wrongPassword,
    error,
    notApproved,
  ];

  static final $core.Map<$core.int, LoginResponse_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LoginResponse_Status? valueOf($core.int value) => _byValue[value];

  const LoginResponse_Status._($core.int v, $core.String n) : super(v, n);
}

class ApprovalResponse_Status extends $pb.ProtobufEnum {
  static const ApprovalResponse_Status aprroved = ApprovalResponse_Status._(0, _omitEnumNames ? '' : 'aprroved');
  static const ApprovalResponse_Status timeout = ApprovalResponse_Status._(1, _omitEnumNames ? '' : 'timeout');

  static const $core.List<ApprovalResponse_Status> values = <ApprovalResponse_Status> [
    aprroved,
    timeout,
  ];

  static final $core.Map<$core.int, ApprovalResponse_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ApprovalResponse_Status? valueOf($core.int value) => _byValue[value];

  const ApprovalResponse_Status._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
