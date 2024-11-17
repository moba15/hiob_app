//
//  Generated code. Do not modify.
//  source: state/state.proto
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

import 'state.pb.dart' as $0;

export 'state.pb.dart';

@$pb.GrpcServiceName('StateUpdate')
class StateUpdateClient extends $grpc.Client {
  static final _$subscibe = $grpc.ClientMethod<$0.StateSubscribtion, $0.StateValueUpdate>(
      '/StateUpdate/Subscibe',
      ($0.StateSubscribtion value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StateValueUpdate.fromBuffer(value));
  static final _$updateValue = $grpc.ClientMethod<$0.StateValueUpdateRequest, $0.StateValueUpdateResponse>(
      '/StateUpdate/updateValue',
      ($0.StateValueUpdateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StateValueUpdateResponse.fromBuffer(value));
  static final _$searchState = $grpc.ClientMethod<$0.SearchState, $0.SearchStateResponse>(
      '/StateUpdate/searchState',
      ($0.SearchState value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SearchStateResponse.fromBuffer(value));
  static final _$searchStateStream = $grpc.ClientMethod<$0.SearchState, $0.SearchStateResponse>(
      '/StateUpdate/searchStateStream',
      ($0.SearchState value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SearchStateResponse.fromBuffer(value));

  StateUpdateClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.StateValueUpdate> subscibe($0.StateSubscribtion request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscibe, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.StateValueUpdateResponse> updateValue($0.StateValueUpdateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateValue, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchStateResponse> searchState($0.SearchState request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchState, request, options: options);
  }

  $grpc.ResponseStream<$0.SearchStateResponse> searchStateStream($async.Stream<$0.SearchState> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$searchStateStream, request, options: options);
  }
}

@$pb.GrpcServiceName('StateUpdate')
abstract class StateUpdateServiceBase extends $grpc.Service {
  $core.String get $name => 'StateUpdate';

  StateUpdateServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StateSubscribtion, $0.StateValueUpdate>(
        'Subscibe',
        subscibe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.StateSubscribtion.fromBuffer(value),
        ($0.StateValueUpdate value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StateValueUpdateRequest, $0.StateValueUpdateResponse>(
        'updateValue',
        updateValue_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StateValueUpdateRequest.fromBuffer(value),
        ($0.StateValueUpdateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchState, $0.SearchStateResponse>(
        'searchState',
        searchState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchState.fromBuffer(value),
        ($0.SearchStateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchState, $0.SearchStateResponse>(
        'searchStateStream',
        searchStateStream,
        true,
        true,
        ($core.List<$core.int> value) => $0.SearchState.fromBuffer(value),
        ($0.SearchStateResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.StateValueUpdate> subscibe_Pre($grpc.ServiceCall call, $async.Future<$0.StateSubscribtion> request) async* {
    yield* subscibe(call, await request);
  }

  $async.Future<$0.StateValueUpdateResponse> updateValue_Pre($grpc.ServiceCall call, $async.Future<$0.StateValueUpdateRequest> request) async {
    return updateValue(call, await request);
  }

  $async.Future<$0.SearchStateResponse> searchState_Pre($grpc.ServiceCall call, $async.Future<$0.SearchState> request) async {
    return searchState(call, await request);
  }

  $async.Stream<$0.StateValueUpdate> subscibe($grpc.ServiceCall call, $0.StateSubscribtion request);
  $async.Future<$0.StateValueUpdateResponse> updateValue($grpc.ServiceCall call, $0.StateValueUpdateRequest request);
  $async.Future<$0.SearchStateResponse> searchState($grpc.ServiceCall call, $0.SearchState request);
  $async.Stream<$0.SearchStateResponse> searchStateStream($grpc.ServiceCall call, $async.Stream<$0.SearchState> request);
}
