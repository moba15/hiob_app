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

class LoginResponse_Status extends $pb.ProtobufEnum {
  static const LoginResponse_Status succesfull =
      LoginResponse_Status._(0, _omitEnumNames ? '' : 'succesfull');
  static const LoginResponse_Status wrongKey =
      LoginResponse_Status._(1, _omitEnumNames ? '' : 'wrongKey');
  static const LoginResponse_Status wrongPassword =
      LoginResponse_Status._(2, _omitEnumNames ? '' : 'wrongPassword');
  static const LoginResponse_Status error =
      LoginResponse_Status._(3, _omitEnumNames ? '' : 'error');
  static const LoginResponse_Status notApproved =
      LoginResponse_Status._(4, _omitEnumNames ? '' : 'notApproved');

  static const $core.List<LoginResponse_Status> values = <LoginResponse_Status>[
    succesfull,
    wrongKey,
    wrongPassword,
    error,
    notApproved,
  ];

  static final $core.List<LoginResponse_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static LoginResponse_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const LoginResponse_Status._(super.value, super.name);
}

class ApprovalResponse_Status extends $pb.ProtobufEnum {
  static const ApprovalResponse_Status aprroved =
      ApprovalResponse_Status._(0, _omitEnumNames ? '' : 'aprroved');
  static const ApprovalResponse_Status timeout =
      ApprovalResponse_Status._(1, _omitEnumNames ? '' : 'timeout');

  static const $core.List<ApprovalResponse_Status> values =
      <ApprovalResponse_Status>[
    aprroved,
    timeout,
  ];

  static final $core.List<ApprovalResponse_Status?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ApprovalResponse_Status? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ApprovalResponse_Status._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
