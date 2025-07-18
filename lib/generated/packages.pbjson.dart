//
//  Generated code. Do not modify.
//  source: packages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use packageTypeDescriptor instead')
const PackageType$json = {
  '1': 'PackageType',
  '2': [
    {'1': 'firstPing', '2': 0},
  ],
};

/// Descriptor for `PackageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List packageTypeDescriptor =
    $convert.base64Decode('CgtQYWNrYWdlVHlwZRINCglmaXJzdFBpbmcQAA==');

@$core.Deprecated('Use packageDescriptor instead')
const Package$json = {
  '1': 'Package',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.PackageType', '10': 'type'},
  ],
};

/// Descriptor for `Package`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List packageDescriptor = $convert.base64Decode(
    'CgdQYWNrYWdlEiAKBHR5cGUYASABKA4yDC5QYWNrYWdlVHlwZVIEdHlwZQ==');
