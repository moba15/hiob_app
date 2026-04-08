// This is a generated file - do not edit.
//
// Generated from config_sync/config_sync.proto.

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

import 'config_sync.pb.dart' as $0;

export 'config_sync.pb.dart';

@$pb.GrpcServiceName('ConfigSync')
class ConfigSyncClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ConfigSyncClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.AvailableConfigsResponse> getAvailableConfigs(
    $0.AvailableConfigsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAvailableConfigs, request, options: options);
  }

  $grpc.ResponseFuture<$0.ConfigSyncUpResponse> configSyncUp(
    $0.ConfigSyncUpRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$configSyncUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.Config> configSyncDown(
    $0.ConfigSyncDownRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$configSyncDown, request, options: options);
  }

  $grpc.ResponseFuture<$0.ConfigCreateDeleteResponse> configCreateDelete(
    $0.ConfigCreateDeleteRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$configCreateDelete, request, options: options);
  }

  // method descriptors

  static final _$getAvailableConfigs = $grpc.ClientMethod<
          $0.AvailableConfigsRequest, $0.AvailableConfigsResponse>(
      '/ConfigSync/GetAvailableConfigs',
      ($0.AvailableConfigsRequest value) => value.writeToBuffer(),
      $0.AvailableConfigsResponse.fromBuffer);
  static final _$configSyncUp =
      $grpc.ClientMethod<$0.ConfigSyncUpRequest, $0.ConfigSyncUpResponse>(
          '/ConfigSync/ConfigSyncUp',
          ($0.ConfigSyncUpRequest value) => value.writeToBuffer(),
          $0.ConfigSyncUpResponse.fromBuffer);
  static final _$configSyncDown =
      $grpc.ClientMethod<$0.ConfigSyncDownRequest, $0.Config>(
          '/ConfigSync/ConfigSyncDown',
          ($0.ConfigSyncDownRequest value) => value.writeToBuffer(),
          $0.Config.fromBuffer);
  static final _$configCreateDelete = $grpc.ClientMethod<
          $0.ConfigCreateDeleteRequest, $0.ConfigCreateDeleteResponse>(
      '/ConfigSync/ConfigCreateDelete',
      ($0.ConfigCreateDeleteRequest value) => value.writeToBuffer(),
      $0.ConfigCreateDeleteResponse.fromBuffer);
}

@$pb.GrpcServiceName('ConfigSync')
abstract class ConfigSyncServiceBase extends $grpc.Service {
  $core.String get $name => 'ConfigSync';

  ConfigSyncServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AvailableConfigsRequest,
            $0.AvailableConfigsResponse>(
        'GetAvailableConfigs',
        getAvailableConfigs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AvailableConfigsRequest.fromBuffer(value),
        ($0.AvailableConfigsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ConfigSyncUpRequest, $0.ConfigSyncUpResponse>(
            'ConfigSyncUp',
            configSyncUp_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ConfigSyncUpRequest.fromBuffer(value),
            ($0.ConfigSyncUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ConfigSyncDownRequest, $0.Config>(
        'ConfigSyncDown',
        configSyncDown_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ConfigSyncDownRequest.fromBuffer(value),
        ($0.Config value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ConfigCreateDeleteRequest,
            $0.ConfigCreateDeleteResponse>(
        'ConfigCreateDelete',
        configCreateDelete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ConfigCreateDeleteRequest.fromBuffer(value),
        ($0.ConfigCreateDeleteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AvailableConfigsResponse> getAvailableConfigs_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AvailableConfigsRequest> $request) async {
    return getAvailableConfigs($call, await $request);
  }

  $async.Future<$0.AvailableConfigsResponse> getAvailableConfigs(
      $grpc.ServiceCall call, $0.AvailableConfigsRequest request);

  $async.Future<$0.ConfigSyncUpResponse> configSyncUp_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ConfigSyncUpRequest> $request) async {
    return configSyncUp($call, await $request);
  }

  $async.Future<$0.ConfigSyncUpResponse> configSyncUp(
      $grpc.ServiceCall call, $0.ConfigSyncUpRequest request);

  $async.Future<$0.Config> configSyncDown_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ConfigSyncDownRequest> $request) async {
    return configSyncDown($call, await $request);
  }

  $async.Future<$0.Config> configSyncDown(
      $grpc.ServiceCall call, $0.ConfigSyncDownRequest request);

  $async.Future<$0.ConfigCreateDeleteResponse> configCreateDelete_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ConfigCreateDeleteRequest> $request) async {
    return configCreateDelete($call, await $request);
  }

  $async.Future<$0.ConfigCreateDeleteResponse> configCreateDelete(
      $grpc.ServiceCall call, $0.ConfigCreateDeleteRequest request);
}
