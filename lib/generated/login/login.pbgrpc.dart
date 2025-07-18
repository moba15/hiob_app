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

import 'login.pb.dart' as $1;

export 'login.pb.dart';

@$pb.GrpcServiceName('Login')
class LoginClient extends $grpc.Client {
  static final _$checkCompatibility =
      $grpc.ClientMethod<$1.CompatibilityRequest, $1.CompatibilityResponse>(
          '/Login/CheckCompatibility',
          ($1.CompatibilityRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.CompatibilityResponse.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$1.LoginRequest, $1.LoginResponse>(
      '/Login/Login',
      ($1.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.LoginResponse.fromBuffer(value));
  static final _$requestApproval =
      $grpc.ClientMethod<$1.ApprovalRequest, $1.ApprovalResponse>(
          '/Login/RequestApproval',
          ($1.ApprovalRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ApprovalResponse.fromBuffer(value));

  LoginClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.CompatibilityResponse> checkCompatibility(
      $1.CompatibilityRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkCompatibility, request, options: options);
  }

  $grpc.ResponseFuture<$1.LoginResponse> login($1.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$1.ApprovalResponse> requestApproval(
      $1.ApprovalRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$requestApproval, request, options: options);
  }
}

@$pb.GrpcServiceName('Login')
abstract class LoginServiceBase extends $grpc.Service {
  $core.String get $name => 'Login';

  LoginServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$1.CompatibilityRequest, $1.CompatibilityResponse>(
            'CheckCompatibility',
            checkCompatibility_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.CompatibilityRequest.fromBuffer(value),
            ($1.CompatibilityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LoginRequest, $1.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LoginRequest.fromBuffer(value),
        ($1.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ApprovalRequest, $1.ApprovalResponse>(
        'RequestApproval',
        requestApproval_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.ApprovalRequest.fromBuffer(value),
        ($1.ApprovalResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.CompatibilityResponse> checkCompatibility_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.CompatibilityRequest> request) async {
    return checkCompatibility(call, await request);
  }

  $async.Future<$1.LoginResponse> login_Pre(
      $grpc.ServiceCall call, $async.Future<$1.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$1.ApprovalResponse> requestApproval_Pre(
      $grpc.ServiceCall call, $async.Future<$1.ApprovalRequest> request) async {
    return requestApproval(call, await request);
  }

  $async.Future<$1.CompatibilityResponse> checkCompatibility(
      $grpc.ServiceCall call, $1.CompatibilityRequest request);
  $async.Future<$1.LoginResponse> login(
      $grpc.ServiceCall call, $1.LoginRequest request);
  $async.Future<$1.ApprovalResponse> requestApproval(
      $grpc.ServiceCall call, $1.ApprovalRequest request);
}
