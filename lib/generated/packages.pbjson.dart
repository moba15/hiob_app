// This is a generated file - do not edit.
//
// Generated from packages.proto.

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
