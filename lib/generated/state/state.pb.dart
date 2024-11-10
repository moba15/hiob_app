//
//  Generated code. Do not modify.
//  source: state/state.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'state.pbenum.dart';

export 'state.pbenum.dart';

enum StateValueUpdate_Value {
  stringValue, 
  boolValue, 
  doubleValue, 
  other, 
  notSet
}

class StateValueUpdate extends $pb.GeneratedMessage {
  factory StateValueUpdate({
    $core.String? stateId,
    $core.bool? acc,
    $fixnum.Int64? time,
    $core.String? stringValue,
    $core.bool? boolValue,
    $core.double? doubleValue,
    $core.String? other,
  }) {
    final $result = create();
    if (stateId != null) {
      $result.stateId = stateId;
    }
    if (acc != null) {
      $result.acc = acc;
    }
    if (time != null) {
      $result.time = time;
    }
    if (stringValue != null) {
      $result.stringValue = stringValue;
    }
    if (boolValue != null) {
      $result.boolValue = boolValue;
    }
    if (doubleValue != null) {
      $result.doubleValue = doubleValue;
    }
    if (other != null) {
      $result.other = other;
    }
    return $result;
  }
  StateValueUpdate._() : super();
  factory StateValueUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateValueUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, StateValueUpdate_Value> _StateValueUpdate_ValueByTag = {
    4 : StateValueUpdate_Value.stringValue,
    5 : StateValueUpdate_Value.boolValue,
    6 : StateValueUpdate_Value.doubleValue,
    99 : StateValueUpdate_Value.other,
    0 : StateValueUpdate_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StateValueUpdate', createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 99])
    ..aOS(1, _omitFieldNames ? '' : 'stateId', protoName: 'stateId')
    ..aOB(2, _omitFieldNames ? '' : 'acc')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'stringValue', protoName: 'stringValue')
    ..aOB(5, _omitFieldNames ? '' : 'boolValue', protoName: 'boolValue')
    ..a<$core.double>(6, _omitFieldNames ? '' : 'doubleValue', $pb.PbFieldType.OD, protoName: 'doubleValue')
    ..aOS(99, _omitFieldNames ? '' : 'other')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StateValueUpdate clone() => StateValueUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StateValueUpdate copyWith(void Function(StateValueUpdate) updates) => super.copyWith((message) => updates(message as StateValueUpdate)) as StateValueUpdate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateValueUpdate create() => StateValueUpdate._();
  StateValueUpdate createEmptyInstance() => create();
  static $pb.PbList<StateValueUpdate> createRepeated() => $pb.PbList<StateValueUpdate>();
  @$core.pragma('dart2js:noInline')
  static StateValueUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StateValueUpdate>(create);
  static StateValueUpdate? _defaultInstance;

  StateValueUpdate_Value whichValue() => _StateValueUpdate_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get stateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set stateId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStateId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get acc => $_getBF(1);
  @$pb.TagNumber(2)
  set acc($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAcc() => $_has(1);
  @$pb.TagNumber(2)
  void clearAcc() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);
  @$pb.TagNumber(3)
  set time($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get stringValue => $_getSZ(3);
  @$pb.TagNumber(4)
  set stringValue($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStringValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearStringValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get boolValue => $_getBF(4);
  @$pb.TagNumber(5)
  set boolValue($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBoolValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearBoolValue() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get doubleValue => $_getN(5);
  @$pb.TagNumber(6)
  set doubleValue($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDoubleValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearDoubleValue() => clearField(6);

  @$pb.TagNumber(99)
  $core.String get other => $_getSZ(6);
  @$pb.TagNumber(99)
  set other($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(99)
  $core.bool hasOther() => $_has(6);
  @$pb.TagNumber(99)
  void clearOther() => clearField(99);
}

enum StateValueUpdateRequest_Value {
  stringValue, 
  boolValue, 
  doubleValue, 
  other, 
  notSet
}

class StateValueUpdateRequest extends $pb.GeneratedMessage {
  factory StateValueUpdateRequest({
    $core.String? userId,
    $core.String? stateId,
    $core.String? stringValue,
    $core.bool? boolValue,
    $core.double? doubleValue,
    $core.String? other,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (stateId != null) {
      $result.stateId = stateId;
    }
    if (stringValue != null) {
      $result.stringValue = stringValue;
    }
    if (boolValue != null) {
      $result.boolValue = boolValue;
    }
    if (doubleValue != null) {
      $result.doubleValue = doubleValue;
    }
    if (other != null) {
      $result.other = other;
    }
    return $result;
  }
  StateValueUpdateRequest._() : super();
  factory StateValueUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateValueUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, StateValueUpdateRequest_Value> _StateValueUpdateRequest_ValueByTag = {
    3 : StateValueUpdateRequest_Value.stringValue,
    4 : StateValueUpdateRequest_Value.boolValue,
    5 : StateValueUpdateRequest_Value.doubleValue,
    99 : StateValueUpdateRequest_Value.other,
    0 : StateValueUpdateRequest_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StateValueUpdateRequest', createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 99])
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'stateId', protoName: 'stateId')
    ..aOS(3, _omitFieldNames ? '' : 'stringValue', protoName: 'stringValue')
    ..aOB(4, _omitFieldNames ? '' : 'boolValue', protoName: 'boolValue')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'doubleValue', $pb.PbFieldType.OD, protoName: 'doubleValue')
    ..aOS(99, _omitFieldNames ? '' : 'other')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StateValueUpdateRequest clone() => StateValueUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StateValueUpdateRequest copyWith(void Function(StateValueUpdateRequest) updates) => super.copyWith((message) => updates(message as StateValueUpdateRequest)) as StateValueUpdateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateValueUpdateRequest create() => StateValueUpdateRequest._();
  StateValueUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<StateValueUpdateRequest> createRepeated() => $pb.PbList<StateValueUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static StateValueUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StateValueUpdateRequest>(create);
  static StateValueUpdateRequest? _defaultInstance;

  StateValueUpdateRequest_Value whichValue() => _StateValueUpdateRequest_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get stateId => $_getSZ(1);
  @$pb.TagNumber(2)
  set stateId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStateId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get stringValue => $_getSZ(2);
  @$pb.TagNumber(3)
  set stringValue($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStringValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearStringValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get boolValue => $_getBF(3);
  @$pb.TagNumber(4)
  set boolValue($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoolValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoolValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get doubleValue => $_getN(4);
  @$pb.TagNumber(5)
  set doubleValue($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDoubleValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearDoubleValue() => clearField(5);

  @$pb.TagNumber(99)
  $core.String get other => $_getSZ(5);
  @$pb.TagNumber(99)
  set other($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(99)
  $core.bool hasOther() => $_has(5);
  @$pb.TagNumber(99)
  void clearOther() => clearField(99);
}

class StateValueUpdateResponse extends $pb.GeneratedMessage {
  factory StateValueUpdateResponse({
    $core.bool? suc,
  }) {
    final $result = create();
    if (suc != null) {
      $result.suc = suc;
    }
    return $result;
  }
  StateValueUpdateResponse._() : super();
  factory StateValueUpdateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateValueUpdateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StateValueUpdateResponse', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'suc')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StateValueUpdateResponse clone() => StateValueUpdateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StateValueUpdateResponse copyWith(void Function(StateValueUpdateResponse) updates) => super.copyWith((message) => updates(message as StateValueUpdateResponse)) as StateValueUpdateResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateValueUpdateResponse create() => StateValueUpdateResponse._();
  StateValueUpdateResponse createEmptyInstance() => create();
  static $pb.PbList<StateValueUpdateResponse> createRepeated() => $pb.PbList<StateValueUpdateResponse>();
  @$core.pragma('dart2js:noInline')
  static StateValueUpdateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StateValueUpdateResponse>(create);
  static StateValueUpdateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get suc => $_getBF(0);
  @$pb.TagNumber(1)
  set suc($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuc() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuc() => clearField(1);
}

class StateSubscribtion extends $pb.GeneratedMessage {
  factory StateSubscribtion({
    $core.String? userId,
    StateSubscribtion_SubscriptionType? type,
    $core.Iterable<$core.String>? stateIds,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (stateIds != null) {
      $result.stateIds.addAll(stateIds);
    }
    return $result;
  }
  StateSubscribtion._() : super();
  factory StateSubscribtion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StateSubscribtion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StateSubscribtion', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..e<StateSubscribtion_SubscriptionType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: StateSubscribtion_SubscriptionType.cancle, valueOf: StateSubscribtion_SubscriptionType.valueOf, enumValues: StateSubscribtion_SubscriptionType.values)
    ..pPS(3, _omitFieldNames ? '' : 'stateIds', protoName: 'stateIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StateSubscribtion clone() => StateSubscribtion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StateSubscribtion copyWith(void Function(StateSubscribtion) updates) => super.copyWith((message) => updates(message as StateSubscribtion)) as StateSubscribtion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateSubscribtion create() => StateSubscribtion._();
  StateSubscribtion createEmptyInstance() => create();
  static $pb.PbList<StateSubscribtion> createRepeated() => $pb.PbList<StateSubscribtion>();
  @$core.pragma('dart2js:noInline')
  static StateSubscribtion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StateSubscribtion>(create);
  static StateSubscribtion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  StateSubscribtion_SubscriptionType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(StateSubscribtion_SubscriptionType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get stateIds => $_getList(2);
}

class SearchState extends $pb.GeneratedMessage {
  factory SearchState({
    $core.String? userId,
    $core.String? query,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (query != null) {
      $result.query = query;
    }
    return $result;
  }
  SearchState._() : super();
  factory SearchState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchState', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchState clone() => SearchState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchState copyWith(void Function(SearchState) updates) => super.copyWith((message) => updates(message as SearchState)) as SearchState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchState create() => SearchState._();
  SearchState createEmptyInstance() => create();
  static $pb.PbList<SearchState> createRepeated() => $pb.PbList<SearchState>();
  @$core.pragma('dart2js:noInline')
  static SearchState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchState>(create);
  static SearchState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get query => $_getSZ(1);
  @$pb.TagNumber(2)
  set query($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => clearField(2);
}

class SearchStateResponse extends $pb.GeneratedMessage {
  factory SearchStateResponse({
    $core.Iterable<State>? states,
  }) {
    final $result = create();
    if (states != null) {
      $result.states.addAll(states);
    }
    return $result;
  }
  SearchStateResponse._() : super();
  factory SearchStateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchStateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchStateResponse', createEmptyInstance: create)
    ..pc<State>(1, _omitFieldNames ? '' : 'states', $pb.PbFieldType.PM, subBuilder: State.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchStateResponse clone() => SearchStateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchStateResponse copyWith(void Function(SearchStateResponse) updates) => super.copyWith((message) => updates(message as SearchStateResponse)) as SearchStateResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchStateResponse create() => SearchStateResponse._();
  SearchStateResponse createEmptyInstance() => create();
  static $pb.PbList<SearchStateResponse> createRepeated() => $pb.PbList<SearchStateResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchStateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchStateResponse>(create);
  static SearchStateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<State> get states => $_getList(0);
}

class State_StateCommon extends $pb.GeneratedMessage {
  factory State_StateCommon({
    $core.String? name,
    $core.String? desc,
    State_StateCommon_StateType? type,
    $core.bool? read,
    $core.bool? write,
    $core.String? role,
    $core.String? unit,
    $core.int? step,
    $core.int? min,
    $core.int? max,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (desc != null) {
      $result.desc = desc;
    }
    if (type != null) {
      $result.type = type;
    }
    if (read != null) {
      $result.read = read;
    }
    if (write != null) {
      $result.write = write;
    }
    if (role != null) {
      $result.role = role;
    }
    if (unit != null) {
      $result.unit = unit;
    }
    if (step != null) {
      $result.step = step;
    }
    if (min != null) {
      $result.min = min;
    }
    if (max != null) {
      $result.max = max;
    }
    return $result;
  }
  State_StateCommon._() : super();
  factory State_StateCommon.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory State_StateCommon.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'State.StateCommon', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'desc')
    ..e<State_StateCommon_StateType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: State_StateCommon_StateType.boolean, valueOf: State_StateCommon_StateType.valueOf, enumValues: State_StateCommon_StateType.values)
    ..aOB(4, _omitFieldNames ? '' : 'read')
    ..aOB(5, _omitFieldNames ? '' : 'write')
    ..aOS(6, _omitFieldNames ? '' : 'role')
    ..aOS(7, _omitFieldNames ? '' : 'unit')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'step', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'min', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'max', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  State_StateCommon clone() => State_StateCommon()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  State_StateCommon copyWith(void Function(State_StateCommon) updates) => super.copyWith((message) => updates(message as State_StateCommon)) as State_StateCommon;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static State_StateCommon create() => State_StateCommon._();
  State_StateCommon createEmptyInstance() => create();
  static $pb.PbList<State_StateCommon> createRepeated() => $pb.PbList<State_StateCommon>();
  @$core.pragma('dart2js:noInline')
  static State_StateCommon getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<State_StateCommon>(create);
  static State_StateCommon? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => clearField(2);

  @$pb.TagNumber(3)
  State_StateCommon_StateType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(State_StateCommon_StateType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get read => $_getBF(3);
  @$pb.TagNumber(4)
  set read($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRead() => $_has(3);
  @$pb.TagNumber(4)
  void clearRead() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get write => $_getBF(4);
  @$pb.TagNumber(5)
  set write($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWrite() => $_has(4);
  @$pb.TagNumber(5)
  void clearWrite() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get role => $_getSZ(5);
  @$pb.TagNumber(6)
  set role($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearRole() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get unit => $_getSZ(6);
  @$pb.TagNumber(7)
  set unit($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUnit() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnit() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get step => $_getIZ(7);
  @$pb.TagNumber(8)
  set step($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStep() => $_has(7);
  @$pb.TagNumber(8)
  void clearStep() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get min => $_getIZ(8);
  @$pb.TagNumber(9)
  set min($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMin() => $_has(8);
  @$pb.TagNumber(9)
  void clearMin() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get max => $_getIZ(9);
  @$pb.TagNumber(10)
  set max($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMax() => $_has(9);
  @$pb.TagNumber(10)
  void clearMax() => clearField(10);
}

enum State_Value {
  stringValue, 
  boolValue, 
  doubleValue, 
  other, 
  notSet
}

class State extends $pb.GeneratedMessage {
  factory State({
    $core.String? stateId,
    $core.String? stringValue,
    $core.bool? boolValue,
    $core.double? doubleValue,
    $core.String? other,
  }) {
    final $result = create();
    if (stateId != null) {
      $result.stateId = stateId;
    }
    if (stringValue != null) {
      $result.stringValue = stringValue;
    }
    if (boolValue != null) {
      $result.boolValue = boolValue;
    }
    if (doubleValue != null) {
      $result.doubleValue = doubleValue;
    }
    if (other != null) {
      $result.other = other;
    }
    return $result;
  }
  State._() : super();
  factory State.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory State.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, State_Value> _State_ValueByTag = {
    3 : State_Value.stringValue,
    4 : State_Value.boolValue,
    5 : State_Value.doubleValue,
    99 : State_Value.other,
    0 : State_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'State', createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 99])
    ..aOS(1, _omitFieldNames ? '' : 'stateId', protoName: 'stateId')
    ..aOS(3, _omitFieldNames ? '' : 'stringValue', protoName: 'stringValue')
    ..aOB(4, _omitFieldNames ? '' : 'boolValue', protoName: 'boolValue')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'doubleValue', $pb.PbFieldType.OD, protoName: 'doubleValue')
    ..aOS(99, _omitFieldNames ? '' : 'other')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  State clone() => State()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  State copyWith(void Function(State) updates) => super.copyWith((message) => updates(message as State)) as State;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static State create() => State._();
  State createEmptyInstance() => create();
  static $pb.PbList<State> createRepeated() => $pb.PbList<State>();
  @$core.pragma('dart2js:noInline')
  static State getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<State>(create);
  static State? _defaultInstance;

  State_Value whichValue() => _State_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get stateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set stateId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStateId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get stringValue => $_getSZ(1);
  @$pb.TagNumber(3)
  set stringValue($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasStringValue() => $_has(1);
  @$pb.TagNumber(3)
  void clearStringValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get boolValue => $_getBF(2);
  @$pb.TagNumber(4)
  set boolValue($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoolValue() => $_has(2);
  @$pb.TagNumber(4)
  void clearBoolValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get doubleValue => $_getN(3);
  @$pb.TagNumber(5)
  set doubleValue($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasDoubleValue() => $_has(3);
  @$pb.TagNumber(5)
  void clearDoubleValue() => clearField(5);

  @$pb.TagNumber(99)
  $core.String get other => $_getSZ(4);
  @$pb.TagNumber(99)
  set other($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(99)
  $core.bool hasOther() => $_has(4);
  @$pb.TagNumber(99)
  void clearOther() => clearField(99);
}

class stateServiceApi {
  $pb.RpcClient _client;
  stateServiceApi(this._client);

  $async.Future<StateValueUpdate> subscibe($pb.ClientContext? ctx, StateSubscribtion request) =>
    _client.invoke<StateValueUpdate>(ctx, 'stateService', 'Subscibe', request, StateValueUpdate())
  ;
  $async.Future<StateValueUpdateResponse> updateValue($pb.ClientContext? ctx, StateValueUpdateRequest request) =>
    _client.invoke<StateValueUpdateResponse>(ctx, 'stateService', 'updateValue', request, StateValueUpdateResponse())
  ;
  $async.Future<SearchStateResponse> searchState($pb.ClientContext? ctx, SearchState request) =>
    _client.invoke<SearchStateResponse>(ctx, 'stateService', 'searchState', request, SearchStateResponse())
  ;
  $async.Future<SearchStateResponse> searchStateStream($pb.ClientContext? ctx, SearchState request) =>
    _client.invoke<SearchStateResponse>(ctx, 'stateService', 'searchStateStream', request, SearchStateResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
