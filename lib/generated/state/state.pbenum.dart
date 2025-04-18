//
//  Generated code. Do not modify.
//  source: state/state.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StateSubscribtion_SubscriptionType extends $pb.ProtobufEnum {
  static const StateSubscribtion_SubscriptionType cancle =
      StateSubscribtion_SubscriptionType._(0, _omitEnumNames ? '' : 'cancle');
  static const StateSubscribtion_SubscriptionType subscripe =
      StateSubscribtion_SubscriptionType._(
          1, _omitEnumNames ? '' : 'subscripe');

  static const $core.List<StateSubscribtion_SubscriptionType> values =
      <StateSubscribtion_SubscriptionType>[
    cancle,
    subscripe,
  ];

  static final $core.Map<$core.int, StateSubscribtion_SubscriptionType>
      _byValue = $pb.ProtobufEnum.initByValue(values);
  static StateSubscribtion_SubscriptionType? valueOf($core.int value) =>
      _byValue[value];

  const StateSubscribtion_SubscriptionType._($core.int v, $core.String n)
      : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
