// This is a generated file - do not edit.
//
// Generated from config_sync/config_sync.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SyncType extends $pb.ProtobufEnum {
  static const SyncType SYNC_ALL =
      SyncType._(0, _omitEnumNames ? '' : 'SYNC_ALL');
  static const SyncType SYNC_SCREENS =
      SyncType._(1, _omitEnumNames ? '' : 'SYNC_SCREENS');
  static const SyncType SYNC_TEMPLATES =
      SyncType._(2, _omitEnumNames ? '' : 'SYNC_TEMPLATES');

  static const $core.List<SyncType> values = <SyncType>[
    SYNC_ALL,
    SYNC_SCREENS,
    SYNC_TEMPLATES,
  ];

  static final $core.List<SyncType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static SyncType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SyncType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
