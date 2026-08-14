// This is a generated file - do not edit.
//
// Generated from notification/notification.proto.

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

import 'notification.pb.dart' as $0;

export 'notification.pb.dart';

@$pb.GrpcServiceName('NotificationService')
class NotificationServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  NotificationServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.FetchNotificationsResponse> fetchNotifications(
    $0.FetchNotificationsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchNotifications, request, options: options);
  }

  $grpc.ResponseFuture<$0.AckNotificationsResponse> ackNotifications(
    $0.AckNotificationsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$ackNotifications, request, options: options);
  }

  // method descriptors

  static final _$fetchNotifications = $grpc.ClientMethod<
          $0.FetchNotificationsRequest, $0.FetchNotificationsResponse>(
      '/NotificationService/fetchNotifications',
      ($0.FetchNotificationsRequest value) => value.writeToBuffer(),
      $0.FetchNotificationsResponse.fromBuffer);
  static final _$ackNotifications = $grpc.ClientMethod<
          $0.AckNotificationsRequest, $0.AckNotificationsResponse>(
      '/NotificationService/ackNotifications',
      ($0.AckNotificationsRequest value) => value.writeToBuffer(),
      $0.AckNotificationsResponse.fromBuffer);
}

@$pb.GrpcServiceName('NotificationService')
abstract class NotificationServiceBase extends $grpc.Service {
  $core.String get $name => 'NotificationService';

  NotificationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FetchNotificationsRequest,
            $0.FetchNotificationsResponse>(
        'fetchNotifications',
        fetchNotifications_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.FetchNotificationsRequest.fromBuffer(value),
        ($0.FetchNotificationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AckNotificationsRequest,
            $0.AckNotificationsResponse>(
        'ackNotifications',
        ackNotifications_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AckNotificationsRequest.fromBuffer(value),
        ($0.AckNotificationsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.FetchNotificationsResponse> fetchNotifications_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.FetchNotificationsRequest> $request) async {
    return fetchNotifications($call, await $request);
  }

  $async.Future<$0.FetchNotificationsResponse> fetchNotifications(
      $grpc.ServiceCall call, $0.FetchNotificationsRequest request);

  $async.Future<$0.AckNotificationsResponse> ackNotifications_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AckNotificationsRequest> $request) async {
    return ackNotifications($call, await $request);
  }

  $async.Future<$0.AckNotificationsResponse> ackNotifications(
      $grpc.ServiceCall call, $0.AckNotificationsRequest request);
}
