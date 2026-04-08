// This is a generated file - do not edit.
//
// Generated from login/login.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'login.pb.dart' as $0;

export 'login.pb.dart';

@$pb.GrpcServiceName('Login')
class LoginClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  LoginClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.CompatibilityResponse> checkCompatibility(
    $0.CompatibilityRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$checkCompatibility, request, options: options);
  }

  $grpc.ResponseFuture<$0.LoginResponse> login(
    $0.LoginRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$login, request, options: options);
  }

  /// TODO: Maybe Stream?
  $grpc.ResponseFuture<$0.ApprovalResponse> requestApproval(
    $0.ApprovalRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$requestApproval, request, options: options);
  }

  // method descriptors

  static final _$checkCompatibility =
      $grpc.ClientMethod<$0.CompatibilityRequest, $0.CompatibilityResponse>(
          '/Login/CheckCompatibility',
          ($0.CompatibilityRequest value) => value.writeToBuffer(),
          $0.CompatibilityResponse.fromBuffer);
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginResponse>(
      '/Login/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      $0.LoginResponse.fromBuffer);
  static final _$requestApproval =
      $grpc.ClientMethod<$0.ApprovalRequest, $0.ApprovalResponse>(
          '/Login/RequestApproval',
          ($0.ApprovalRequest value) => value.writeToBuffer(),
          $0.ApprovalResponse.fromBuffer);
}

@$pb.GrpcServiceName('Login')
abstract class LoginServiceBase extends $grpc.Service {
  $core.String get $name => 'Login';

  LoginServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CompatibilityRequest, $0.CompatibilityResponse>(
            'CheckCompatibility',
            checkCompatibility_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CompatibilityRequest.fromBuffer(value),
            ($0.CompatibilityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ApprovalRequest, $0.ApprovalResponse>(
        'RequestApproval',
        requestApproval_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ApprovalRequest.fromBuffer(value),
        ($0.ApprovalResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CompatibilityResponse> checkCompatibility_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CompatibilityRequest> $request) async {
    return checkCompatibility($call, await $request);
  }

  $async.Future<$0.CompatibilityResponse> checkCompatibility(
      $grpc.ServiceCall call, $0.CompatibilityRequest request);

  $async.Future<$0.LoginResponse> login_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.LoginRequest> $request) async {
    return login($call, await $request);
  }

  $async.Future<$0.LoginResponse> login(
      $grpc.ServiceCall call, $0.LoginRequest request);

  $async.Future<$0.ApprovalResponse> requestApproval_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ApprovalRequest> $request) async {
    return requestApproval($call, await $request);
  }

  $async.Future<$0.ApprovalResponse> requestApproval(
      $grpc.ServiceCall call, $0.ApprovalRequest request);
}
