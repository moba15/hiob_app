//
//  Generated code. Do not modify.
//  source: config_sync/config_sync.proto
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

import 'config_sync.pb.dart' as $2;

export 'config_sync.pb.dart';

@$pb.GrpcServiceName('ConfigSync')
class ConfigSyncClient extends $grpc.Client {
  static final _$getAvailableConfigs = $grpc.ClientMethod<
          $2.AvailableConfigsRequest, $2.AvailableConfigsResponse>(
      '/ConfigSync/GetAvailableConfigs',
      ($2.AvailableConfigsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.AvailableConfigsResponse.fromBuffer(value));
  static final _$configSyncUp =
      $grpc.ClientMethod<$2.ConfigSyncUpRequest, $2.ConfigSyncUpResponse>(
          '/ConfigSync/ConfigSyncUp',
          ($2.ConfigSyncUpRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.ConfigSyncUpResponse.fromBuffer(value));
  static final _$configSyncDown =
      $grpc.ClientMethod<$2.ConfigSyncDownRequest, $2.Config>(
          '/ConfigSync/ConfigSyncDown',
          ($2.ConfigSyncDownRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.Config.fromBuffer(value));
  static final _$configCreateDelete = $grpc.ClientMethod<
          $2.ConfigCreateDeleteRequest, $2.ConfigCreateDeleteResponse>(
      '/ConfigSync/ConfigCreateDelete',
      ($2.ConfigCreateDeleteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $2.ConfigCreateDeleteResponse.fromBuffer(value));

  ConfigSyncClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.AvailableConfigsResponse> getAvailableConfigs(
      $2.AvailableConfigsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAvailableConfigs, request, options: options);
  }

  $grpc.ResponseFuture<$2.ConfigSyncUpResponse> configSyncUp(
      $2.ConfigSyncUpRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$configSyncUp, request, options: options);
  }

  $grpc.ResponseFuture<$2.Config> configSyncDown(
      $2.ConfigSyncDownRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$configSyncDown, request, options: options);
  }

  $grpc.ResponseFuture<$2.ConfigCreateDeleteResponse> configCreateDelete(
      $2.ConfigCreateDeleteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$configCreateDelete, request, options: options);
  }
}

@$pb.GrpcServiceName('ConfigSync')
abstract class ConfigSyncServiceBase extends $grpc.Service {
  $core.String get $name => 'ConfigSync';

  ConfigSyncServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.AvailableConfigsRequest,
            $2.AvailableConfigsResponse>(
        'GetAvailableConfigs',
        getAvailableConfigs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.AvailableConfigsRequest.fromBuffer(value),
        ($2.AvailableConfigsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$2.ConfigSyncUpRequest, $2.ConfigSyncUpResponse>(
            'ConfigSyncUp',
            configSyncUp_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $2.ConfigSyncUpRequest.fromBuffer(value),
            ($2.ConfigSyncUpResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ConfigSyncDownRequest, $2.Config>(
        'ConfigSyncDown',
        configSyncDown_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.ConfigSyncDownRequest.fromBuffer(value),
        ($2.Config value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ConfigCreateDeleteRequest,
            $2.ConfigCreateDeleteResponse>(
        'ConfigCreateDelete',
        configCreateDelete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $2.ConfigCreateDeleteRequest.fromBuffer(value),
        ($2.ConfigCreateDeleteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.AvailableConfigsResponse> getAvailableConfigs_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.AvailableConfigsRequest> request) async {
    return getAvailableConfigs(call, await request);
  }

  $async.Future<$2.ConfigSyncUpResponse> configSyncUp_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.ConfigSyncUpRequest> request) async {
    return configSyncUp(call, await request);
  }

  $async.Future<$2.Config> configSyncDown_Pre($grpc.ServiceCall call,
      $async.Future<$2.ConfigSyncDownRequest> request) async {
    return configSyncDown(call, await request);
  }

  $async.Future<$2.ConfigCreateDeleteResponse> configCreateDelete_Pre(
      $grpc.ServiceCall call,
      $async.Future<$2.ConfigCreateDeleteRequest> request) async {
    return configCreateDelete(call, await request);
  }

  $async.Future<$2.AvailableConfigsResponse> getAvailableConfigs(
      $grpc.ServiceCall call, $2.AvailableConfigsRequest request);
  $async.Future<$2.ConfigSyncUpResponse> configSyncUp(
      $grpc.ServiceCall call, $2.ConfigSyncUpRequest request);
  $async.Future<$2.Config> configSyncDown(
      $grpc.ServiceCall call, $2.ConfigSyncDownRequest request);
  $async.Future<$2.ConfigCreateDeleteResponse> configCreateDelete(
      $grpc.ServiceCall call, $2.ConfigCreateDeleteRequest request);
}
