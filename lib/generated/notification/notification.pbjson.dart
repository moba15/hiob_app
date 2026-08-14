// This is a generated file - do not edit.
//
// Generated from notification/notification.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fetchNotificationsRequestDescriptor instead')
const FetchNotificationsRequest$json = {
  '1': 'FetchNotificationsRequest',
  '2': [
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `FetchNotificationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchNotificationsRequestDescriptor =
    $convert.base64Decode(
        'ChlGZXRjaE5vdGlmaWNhdGlvbnNSZXF1ZXN0EhoKCGRldmljZUlkGAEgASgJUghkZXZpY2VJZA'
        '==');

@$core.Deprecated('Use notificationContentDescriptor instead')
const NotificationContent$json = {
  '1': 'NotificationContent',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
    {'1': 'ts', '3': 4, '4': 1, '5': 4, '10': 'ts'},
  ],
};

/// Descriptor for `NotificationContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationContentDescriptor = $convert.base64Decode(
    'ChNOb3RpZmljYXRpb25Db250ZW50Eg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdG'
    'l0bGUSEgoEYm9keRgDIAEoCVIEYm9keRIOCgJ0cxgEIAEoBFICdHM=');

@$core.Deprecated('Use fetchNotificationsResponseDescriptor instead')
const FetchNotificationsResponse$json = {
  '1': 'FetchNotificationsResponse',
  '2': [
    {
      '1': 'notifications',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.NotificationContent',
      '10': 'notifications'
    },
  ],
};

/// Descriptor for `FetchNotificationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchNotificationsResponseDescriptor =
    $convert.base64Decode(
        'ChpGZXRjaE5vdGlmaWNhdGlvbnNSZXNwb25zZRI6Cg1ub3RpZmljYXRpb25zGAEgAygLMhQuTm'
        '90aWZpY2F0aW9uQ29udGVudFINbm90aWZpY2F0aW9ucw==');

@$core.Deprecated('Use ackNotificationsRequestDescriptor instead')
const AckNotificationsRequest$json = {
  '1': 'AckNotificationsRequest',
  '2': [
    {'1': 'deviceId', '3': 1, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'notificationIds', '3': 2, '4': 3, '5': 9, '10': 'notificationIds'},
  ],
};

/// Descriptor for `AckNotificationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ackNotificationsRequestDescriptor =
    $convert.base64Decode(
        'ChdBY2tOb3RpZmljYXRpb25zUmVxdWVzdBIaCghkZXZpY2VJZBgBIAEoCVIIZGV2aWNlSWQSKA'
        'oPbm90aWZpY2F0aW9uSWRzGAIgAygJUg9ub3RpZmljYXRpb25JZHM=');

@$core.Deprecated('Use ackNotificationsResponseDescriptor instead')
const AckNotificationsResponse$json = {
  '1': 'AckNotificationsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AckNotificationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ackNotificationsResponseDescriptor =
    $convert.base64Decode(
        'ChhBY2tOb3RpZmljYXRpb25zUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');
