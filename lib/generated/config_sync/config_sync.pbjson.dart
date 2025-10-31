//
//  Generated code. Do not modify.
//  source: config_sync/config_sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use syncTypeDescriptor instead')
const SyncType$json = {
  '1': 'SyncType',
  '2': [
    {'1': 'SYNC_ALL', '2': 0},
    {'1': 'SYNC_SCREENS', '2': 1},
    {'1': 'SYNC_TEMPLATES', '2': 2},
  ],
};

/// Descriptor for `SyncType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List syncTypeDescriptor = $convert.base64Decode(
    'CghTeW5jVHlwZRIMCghTWU5DX0FMTBAAEhAKDFNZTkNfU0NSRUVOUxABEhIKDlNZTkNfVEVNUE'
    'xBVEVTEAI=');

@$core.Deprecated('Use availableConfigsRequestDescriptor instead')
const AvailableConfigsRequest$json = {
  '1': 'AvailableConfigsRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `AvailableConfigsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List availableConfigsRequestDescriptor =
    $convert.base64Decode(
        'ChdBdmFpbGFibGVDb25maWdzUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use availableConfigsResponseDescriptor instead')
const AvailableConfigsResponse$json = {
  '1': 'AvailableConfigsResponse',
  '2': [
    {'1': 'configNames', '3': 1, '4': 3, '5': 9, '10': 'configNames'},
  ],
};

/// Descriptor for `AvailableConfigsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List availableConfigsResponseDescriptor =
    $convert.base64Decode(
        'ChhBdmFpbGFibGVDb25maWdzUmVzcG9uc2USIAoLY29uZmlnTmFtZXMYASADKAlSC2NvbmZpZ0'
        '5hbWVz');

@$core.Deprecated('Use configSyncUpRequestDescriptor instead')
const ConfigSyncUpRequest$json = {
  '1': 'ConfigSyncUpRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'config', '3': 3, '4': 1, '5': 11, '6': '.Config', '10': 'config'},
  ],
};

/// Descriptor for `ConfigSyncUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configSyncUpRequestDescriptor = $convert.base64Decode(
    'ChNDb25maWdTeW5jVXBSZXF1ZXN0EhYKBnVzZXJJZBgBIAEoCVIGdXNlcklkEh8KBmNvbmZpZx'
    'gDIAEoCzIHLkNvbmZpZ1IGY29uZmln');

@$core.Deprecated('Use configSyncUpResponseDescriptor instead')
const ConfigSyncUpResponse$json = {
  '1': 'ConfigSyncUpResponse',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ConfigSyncUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configSyncUpResponseDescriptor = $convert.base64Decode(
    'ChRDb25maWdTeW5jVXBSZXNwb25zZRIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIYCgdzdWNjZX'
    'NzGAIgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use configSyncDownRequestDescriptor instead')
const ConfigSyncDownRequest$json = {
  '1': 'ConfigSyncDownRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'configName', '3': 2, '4': 1, '5': 9, '10': 'configName'},
    {
      '1': 'syncType',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.SyncType',
      '10': 'syncType'
    },
  ],
};

/// Descriptor for `ConfigSyncDownRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configSyncDownRequestDescriptor = $convert.base64Decode(
    'ChVDb25maWdTeW5jRG93blJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSHgoKY29uZm'
    'lnTmFtZRgCIAEoCVIKY29uZmlnTmFtZRIlCghzeW5jVHlwZRgDIAEoDjIJLlN5bmNUeXBlUghz'
    'eW5jVHlwZQ==');

@$core.Deprecated('Use configCreateDeleteRequestDescriptor instead')
const ConfigCreateDeleteRequest$json = {
  '1': 'ConfigCreateDeleteRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'configName', '3': 2, '4': 1, '5': 9, '10': 'configName'},
    {'1': 'delete', '3': 3, '4': 1, '5': 8, '10': 'delete'},
  ],
};

/// Descriptor for `ConfigCreateDeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configCreateDeleteRequestDescriptor =
    $convert.base64Decode(
        'ChlDb25maWdDcmVhdGVEZWxldGVSZXF1ZXN0EhYKBnVzZXJJZBgBIAEoCVIGdXNlcklkEh4KCm'
        'NvbmZpZ05hbWUYAiABKAlSCmNvbmZpZ05hbWUSFgoGZGVsZXRlGAMgASgIUgZkZWxldGU=');

@$core.Deprecated('Use configCreateDeleteResponseDescriptor instead')
const ConfigCreateDeleteResponse$json = {
  '1': 'ConfigCreateDeleteResponse',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'configNames', '3': 2, '4': 3, '5': 9, '10': 'configNames'},
    {'1': 'success', '3': 3, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ConfigCreateDeleteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configCreateDeleteResponseDescriptor =
    $convert.base64Decode(
        'ChpDb25maWdDcmVhdGVEZWxldGVSZXNwb25zZRIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIgCg'
        'tjb25maWdOYW1lcxgCIAMoCVILY29uZmlnTmFtZXMSGAoHc3VjY2VzcxgDIAEoCFIHc3VjY2Vz'
        'cw==');

@$core.Deprecated('Use configDescriptor instead')
const Config$json = {
  '1': 'Config',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'screens',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'screens',
      '17': true
    },
    {
      '1': 'templates',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'templates',
      '17': true
    },
  ],
  '8': [
    {'1': '_screens'},
    {'1': '_templates'},
  ],
};

/// Descriptor for `Config`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configDescriptor = $convert.base64Decode(
    'CgZDb25maWcSEgoEbmFtZRgBIAEoCVIEbmFtZRIdCgdzY3JlZW5zGAIgASgJSABSB3NjcmVlbn'
    'OIAQESIQoJdGVtcGxhdGVzGAMgASgJSAFSCXRlbXBsYXRlc4gBAUIKCghfc2NyZWVuc0IMCgpf'
    'dGVtcGxhdGVz');
