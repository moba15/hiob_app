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
  static const StateSubscribtion_SubscriptionType cancle = StateSubscribtion_SubscriptionType._(0, _omitEnumNames ? '' : 'cancle');
  static const StateSubscribtion_SubscriptionType subscripe = StateSubscribtion_SubscriptionType._(1, _omitEnumNames ? '' : 'subscripe');

  static const $core.List<StateSubscribtion_SubscriptionType> values = <StateSubscribtion_SubscriptionType> [
    cancle,
    subscripe,
  ];

  static final $core.Map<$core.int, StateSubscribtion_SubscriptionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StateSubscribtion_SubscriptionType? valueOf($core.int value) => _byValue[value];

  const StateSubscribtion_SubscriptionType._($core.int v, $core.String n) : super(v, n);
}

class State_StateCommon_StateType extends $pb.ProtobufEnum {
  static const State_StateCommon_StateType boolean = State_StateCommon_StateType._(0, _omitEnumNames ? '' : 'boolean');
  static const State_StateCommon_StateType str = State_StateCommon_StateType._(1, _omitEnumNames ? '' : 'str');
  static const State_StateCommon_StateType number = State_StateCommon_StateType._(2, _omitEnumNames ? '' : 'number');

  static const $core.List<State_StateCommon_StateType> values = <State_StateCommon_StateType> [
    boolean,
    str,
    number,
  ];

  static final $core.Map<$core.int, State_StateCommon_StateType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static State_StateCommon_StateType? valueOf($core.int value) => _byValue[value];

  const State_StateCommon_StateType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
