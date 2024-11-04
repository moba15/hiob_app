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

class LoginResponse_status extends $pb.ProtobufEnum {
  static const LoginResponse_status succesfull = LoginResponse_status._(0, _omitEnumNames ? '' : 'succesfull');
  static const LoginResponse_status wrongKey = LoginResponse_status._(1, _omitEnumNames ? '' : 'wrongKey');
  static const LoginResponse_status wrongPassword = LoginResponse_status._(2, _omitEnumNames ? '' : 'wrongPassword');
  static const LoginResponse_status error = LoginResponse_status._(3, _omitEnumNames ? '' : 'error');

  static const $core.List<LoginResponse_status> values = <LoginResponse_status> [
    succesfull,
    wrongKey,
    wrongPassword,
    error,
  ];

  static final $core.Map<$core.int, LoginResponse_status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LoginResponse_status? valueOf($core.int value) => _byValue[value];

  const LoginResponse_status._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
