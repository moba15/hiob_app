//
//  Generated code. Do not modify.
//  source: state/state.proto
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

import 'state.pb.dart' as $0;
import 'state.pbjson.dart';

export 'state.pb.dart';

abstract class stateServiceBase extends $pb.GeneratedService {
  $async.Future<$0.StateValueUpdate> subscibe($pb.ServerContext ctx, $0.StateSubscribtion request);
  $async.Future<$0.StateValueUpdateResponse> updateValue($pb.ServerContext ctx, $0.StateValueUpdateRequest request);
  $async.Future<$0.SearchStateResponse> searchState($pb.ServerContext ctx, $0.SearchState request);
  $async.Future<$0.SearchStateResponse> searchStateStream($pb.ServerContext ctx, $0.SearchState request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'Subscibe': return $0.StateSubscribtion();
      case 'updateValue': return $0.StateValueUpdateRequest();
      case 'searchState': return $0.SearchState();
      case 'searchStateStream': return $0.SearchState();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'Subscibe': return this.subscibe(ctx, request as $0.StateSubscribtion);
      case 'updateValue': return this.updateValue(ctx, request as $0.StateValueUpdateRequest);
      case 'searchState': return this.searchState(ctx, request as $0.SearchState);
      case 'searchStateStream': return this.searchStateStream(ctx, request as $0.SearchState);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => stateServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => stateServiceBase$messageJson;
}

