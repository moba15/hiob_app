//
//  Generated code. Do not modify.
//  source: packages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PackageType extends $pb.ProtobufEnum {
  static const PackageType firstPing =
      PackageType._(0, _omitEnumNames ? '' : 'firstPing');

  static const $core.List<PackageType> values = <PackageType>[
    firstPing,
  ];

  static final $core.Map<$core.int, PackageType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PackageType? valueOf($core.int value) => _byValue[value];

  const PackageType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
