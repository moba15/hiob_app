//
//  Generated code. Do not modify.
//  source: login/login.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'login.pb.dart' as $1;
import 'login.pbjson.dart';

export 'login.pb.dart';

abstract class LoginServiceBase extends $pb.GeneratedService {
  $async.Future<$1.CompatibilityResponse> checkCompatibility($pb.ServerContext ctx, $1.CompatibilityRequest request);
  $async.Future<$1.LoginResponse> login($pb.ServerContext ctx, $1.LoginRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CheckCompatibility': return $1.CompatibilityRequest();
      case 'Login': return $1.LoginRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CheckCompatibility': return this.checkCompatibility(ctx, request as $1.CompatibilityRequest);
      case 'Login': return this.login(ctx, request as $1.LoginRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => LoginServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => LoginServiceBase$messageJson;
}

