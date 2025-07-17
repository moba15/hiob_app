//
//  Generated code. Do not modify.
//  source: config_sync/config_sync.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

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

  static final $core.Map<$core.int, SyncType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static SyncType? valueOf($core.int value) => _byValue[value];

  const SyncType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
