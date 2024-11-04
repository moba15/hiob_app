//
//  Generated code. Do not modify.
//  source: login/login.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'login.pb.dart' as $0;

export 'login.pb.dart';

@$pb.GrpcServiceName('Login')
class LoginClient extends $grpc.Client {
  static final _$checkCompatibility = $grpc.ClientMethod<$0.CompatibilityRequest, $0.CompatibilityResponse>(
      '/Login/CheckCompatibility',
      ($0.CompatibilityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CompatibilityResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/Login/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginResponse.fromBuffer(value));

  LoginClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CompatibilityResponse> checkCompatibility($0.CompatibilityRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkCompatibility, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }
}

@$pb.GrpcServiceName('Login')
abstract class LoginServiceBase extends $grpc.Service {
  $core.String get $name => 'Login';

  LoginServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CompatibilityRequest, $0.CompatibilityResponse>(
        'CheckCompatibility',
        checkCompatibility_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CompatibilityRequest.fromBuffer(value),
        ($0.CompatibilityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CompatibilityResponse> checkCompatibility_Pre($grpc.ServiceCall call, $async.Future<$0.CompatibilityRequest> request) async {
    return checkCompatibility(call, await request);
  }

  $async.Future<$0.LoginResponse> login_Pre($grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.CompatibilityResponse> checkCompatibility($grpc.ServiceCall call, $0.CompatibilityRequest request);
  $async.Future<$0.LoginResponse> login($grpc.ServiceCall call, $0.LoginRequest request);
}
