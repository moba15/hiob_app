// This is a generated file - do not edit.
//
// Generated from state/state.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

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

  static final $core.List<StateSubscribtion_SubscriptionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static StateSubscribtion_SubscriptionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StateSubscribtion_SubscriptionType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
