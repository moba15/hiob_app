// This is a generated file - do not edit.
//
// Generated from state/state.proto.

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

import 'state.pb.dart' as $0;

export 'state.pb.dart';

@$pb.GrpcServiceName('StateUpdate')
class StateUpdateClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  StateUpdateClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseStream<$0.StatesValueUpdate> subscibe(
    $0.StateSubscribtion request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(
        _$subscibe, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.StateValueUpdateResponse> updateValue(
    $0.StateValueUpdateRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateValue, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchStateResponse> searchState(
    $0.SearchStateRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$searchState, request, options: options);
  }

  $grpc.ResponseStream<$0.SearchStateResponse> searchStateStream(
    $async.Stream<$0.SearchStateRequest> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$searchStateStream, request, options: options);
  }

  $grpc.ResponseFuture<$0.AllObjectsResults> getAllObjects(
    $0.AllObjectRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAllObjects, request, options: options);
  }

  // method descriptors

  static final _$subscibe =
      $grpc.ClientMethod<$0.StateSubscribtion, $0.StatesValueUpdate>(
          '/StateUpdate/Subscibe',
          ($0.StateSubscribtion value) => value.writeToBuffer(),
          $0.StatesValueUpdate.fromBuffer);
  static final _$updateValue = $grpc.ClientMethod<$0.StateValueUpdateRequest,
          $0.StateValueUpdateResponse>(
      '/StateUpdate/UpdateValue',
      ($0.StateValueUpdateRequest value) => value.writeToBuffer(),
      $0.StateValueUpdateResponse.fromBuffer);
  static final _$searchState =
      $grpc.ClientMethod<$0.SearchStateRequest, $0.SearchStateResponse>(
          '/StateUpdate/SearchState',
          ($0.SearchStateRequest value) => value.writeToBuffer(),
          $0.SearchStateResponse.fromBuffer);
  static final _$searchStateStream =
      $grpc.ClientMethod<$0.SearchStateRequest, $0.SearchStateResponse>(
          '/StateUpdate/SearchStateStream',
          ($0.SearchStateRequest value) => value.writeToBuffer(),
          $0.SearchStateResponse.fromBuffer);
  static final _$getAllObjects =
      $grpc.ClientMethod<$0.AllObjectRequest, $0.AllObjectsResults>(
          '/StateUpdate/GetAllObjects',
          ($0.AllObjectRequest value) => value.writeToBuffer(),
          $0.AllObjectsResults.fromBuffer);
}

@$pb.GrpcServiceName('StateUpdate')
abstract class StateUpdateServiceBase extends $grpc.Service {
  $core.String get $name => 'StateUpdate';

  StateUpdateServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StateSubscribtion, $0.StatesValueUpdate>(
        'Subscibe',
        subscibe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.StateSubscribtion.fromBuffer(value),
        ($0.StatesValueUpdate value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StateValueUpdateRequest,
            $0.StateValueUpdateResponse>(
        'UpdateValue',
        updateValue_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StateValueUpdateRequest.fromBuffer(value),
        ($0.StateValueUpdateResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SearchStateRequest, $0.SearchStateResponse>(
            'SearchState',
            searchState_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SearchStateRequest.fromBuffer(value),
            ($0.SearchStateResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SearchStateRequest, $0.SearchStateResponse>(
            'SearchStateStream',
            searchStateStream,
            true,
            true,
            ($core.List<$core.int> value) =>
                $0.SearchStateRequest.fromBuffer(value),
            ($0.SearchStateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AllObjectRequest, $0.AllObjectsResults>(
        'GetAllObjects',
        getAllObjects_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AllObjectRequest.fromBuffer(value),
        ($0.AllObjectsResults value) => value.writeToBuffer()));
  }

  $async.Stream<$0.StatesValueUpdate> subscibe_Pre($grpc.ServiceCall $call,
      $async.Future<$0.StateSubscribtion> $request) async* {
    yield* subscibe($call, await $request);
  }

  $async.Stream<$0.StatesValueUpdate> subscibe(
      $grpc.ServiceCall call, $0.StateSubscribtion request);

  $async.Future<$0.StateValueUpdateResponse> updateValue_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.StateValueUpdateRequest> $request) async {
    return updateValue($call, await $request);
  }

  $async.Future<$0.StateValueUpdateResponse> updateValue(
      $grpc.ServiceCall call, $0.StateValueUpdateRequest request);

  $async.Future<$0.SearchStateResponse> searchState_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SearchStateRequest> $request) async {
    return searchState($call, await $request);
  }

  $async.Future<$0.SearchStateResponse> searchState(
      $grpc.ServiceCall call, $0.SearchStateRequest request);

  $async.Stream<$0.SearchStateResponse> searchStateStream(
      $grpc.ServiceCall call, $async.Stream<$0.SearchStateRequest> request);

  $async.Future<$0.AllObjectsResults> getAllObjects_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AllObjectRequest> $request) async {
    return getAllObjects($call, await $request);
  }

  $async.Future<$0.AllObjectsResults> getAllObjects(
      $grpc.ServiceCall call, $0.AllObjectRequest request);
}
