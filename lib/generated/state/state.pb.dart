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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'state.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'state.pbenum.dart';

class AllObjectsResults extends $pb.GeneratedMessage {
  factory AllObjectsResults({
    $core.Iterable<State>? states,
  }) {
    final result = create();
    if (states != null) result.states.addAll(states);
    return result;
  }

  AllObjectsResults._();

  factory AllObjectsResults.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AllObjectsResults.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AllObjectsResults',
      createEmptyInstance: create)
    ..pPM<State>(1, _omitFieldNames ? '' : 'states', subBuilder: State.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AllObjectsResults clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AllObjectsResults copyWith(void Function(AllObjectsResults) updates) =>
      super.copyWith((message) => updates(message as AllObjectsResults))
          as AllObjectsResults;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AllObjectsResults create() => AllObjectsResults._();
  @$core.override
  AllObjectsResults createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AllObjectsResults getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AllObjectsResults>(create);
  static AllObjectsResults? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<State> get states => $_getList(0);
}

class AllObjectRequest extends $pb.GeneratedMessage {
  factory AllObjectRequest({
    $core.Iterable<$core.String>? filterPatterns,
  }) {
    final result = create();
    if (filterPatterns != null) result.filterPatterns.addAll(filterPatterns);
    return result;
  }

  AllObjectRequest._();

  factory AllObjectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AllObjectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AllObjectRequest',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'filterPatterns',
        protoName: 'filterPatterns')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AllObjectRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AllObjectRequest copyWith(void Function(AllObjectRequest) updates) =>
      super.copyWith((message) => updates(message as AllObjectRequest))
          as AllObjectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AllObjectRequest create() => AllObjectRequest._();
  @$core.override
  AllObjectRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AllObjectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AllObjectRequest>(create);
  static AllObjectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get filterPatterns => $_getList(0);
}

class StatesValueUpdate extends $pb.GeneratedMessage {
  factory StatesValueUpdate({
    $core.Iterable<StateValueUpdate>? stateUpdates,
  }) {
    final result = create();
    if (stateUpdates != null) result.stateUpdates.addAll(stateUpdates);
    return result;
  }

  StatesValueUpdate._();

  factory StatesValueUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StatesValueUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StatesValueUpdate',
      createEmptyInstance: create)
    ..pPM<StateValueUpdate>(2, _omitFieldNames ? '' : 'stateUpdates',
        protoName: 'stateUpdates', subBuilder: StateValueUpdate.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StatesValueUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StatesValueUpdate copyWith(void Function(StatesValueUpdate) updates) =>
      super.copyWith((message) => updates(message as StatesValueUpdate))
          as StatesValueUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StatesValueUpdate create() => StatesValueUpdate._();
  @$core.override
  StatesValueUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StatesValueUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StatesValueUpdate>(create);
  static StatesValueUpdate? _defaultInstance;

  @$pb.TagNumber(2)
  $pb.PbList<StateValueUpdate> get stateUpdates => $_getList(0);
}

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
    final result = create();
    if (stateId != null) result.stateId = stateId;
    if (acc != null) result.acc = acc;
    if (time != null) result.time = time;
    if (stringValue != null) result.stringValue = stringValue;
    if (boolValue != null) result.boolValue = boolValue;
    if (doubleValue != null) result.doubleValue = doubleValue;
    if (other != null) result.other = other;
    return result;
  }

  StateValueUpdate._();

  factory StateValueUpdate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StateValueUpdate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, StateValueUpdate_Value>
      _StateValueUpdate_ValueByTag = {
    4: StateValueUpdate_Value.stringValue,
    5: StateValueUpdate_Value.boolValue,
    6: StateValueUpdate_Value.doubleValue,
    99: StateValueUpdate_Value.other,
    0: StateValueUpdate_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StateValueUpdate',
      createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 99])
    ..aOS(1, _omitFieldNames ? '' : 'stateId', protoName: 'stateId')
    ..aOB(2, _omitFieldNames ? '' : 'acc')
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : 'time', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : 'stringValue', protoName: 'stringValue')
    ..aOB(5, _omitFieldNames ? '' : 'boolValue', protoName: 'boolValue')
    ..aD(6, _omitFieldNames ? '' : 'doubleValue', protoName: 'doubleValue')
    ..aOS(99, _omitFieldNames ? '' : 'other')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateValueUpdate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateValueUpdate copyWith(void Function(StateValueUpdate) updates) =>
      super.copyWith((message) => updates(message as StateValueUpdate))
          as StateValueUpdate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateValueUpdate create() => StateValueUpdate._();
  @$core.override
  StateValueUpdate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StateValueUpdate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StateValueUpdate>(create);
  static StateValueUpdate? _defaultInstance;

  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(99)
  StateValueUpdate_Value whichValue() =>
      _StateValueUpdate_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(99)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get stateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set stateId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStateId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get acc => $_getBF(1);
  @$pb.TagNumber(2)
  set acc($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAcc() => $_has(1);
  @$pb.TagNumber(2)
  void clearAcc() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);
  @$pb.TagNumber(3)
  set time($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get stringValue => $_getSZ(3);
  @$pb.TagNumber(4)
  set stringValue($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStringValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearStringValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get boolValue => $_getBF(4);
  @$pb.TagNumber(5)
  set boolValue($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBoolValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearBoolValue() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get doubleValue => $_getN(5);
  @$pb.TagNumber(6)
  set doubleValue($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDoubleValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearDoubleValue() => $_clearField(6);

  @$pb.TagNumber(99)
  $core.String get other => $_getSZ(6);
  @$pb.TagNumber(99)
  set other($core.String value) => $_setString(6, value);
  @$pb.TagNumber(99)
  $core.bool hasOther() => $_has(6);
  @$pb.TagNumber(99)
  void clearOther() => $_clearField(99);
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
    final result = create();
    if (userId != null) result.userId = userId;
    if (stateId != null) result.stateId = stateId;
    if (stringValue != null) result.stringValue = stringValue;
    if (boolValue != null) result.boolValue = boolValue;
    if (doubleValue != null) result.doubleValue = doubleValue;
    if (other != null) result.other = other;
    return result;
  }

  StateValueUpdateRequest._();

  factory StateValueUpdateRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StateValueUpdateRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, StateValueUpdateRequest_Value>
      _StateValueUpdateRequest_ValueByTag = {
    3: StateValueUpdateRequest_Value.stringValue,
    4: StateValueUpdateRequest_Value.boolValue,
    5: StateValueUpdateRequest_Value.doubleValue,
    99: StateValueUpdateRequest_Value.other,
    0: StateValueUpdateRequest_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StateValueUpdateRequest',
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 99])
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'stateId', protoName: 'stateId')
    ..aOS(3, _omitFieldNames ? '' : 'stringValue', protoName: 'stringValue')
    ..aOB(4, _omitFieldNames ? '' : 'boolValue', protoName: 'boolValue')
    ..aD(5, _omitFieldNames ? '' : 'doubleValue', protoName: 'doubleValue')
    ..aOS(99, _omitFieldNames ? '' : 'other')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateValueUpdateRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateValueUpdateRequest copyWith(
          void Function(StateValueUpdateRequest) updates) =>
      super.copyWith((message) => updates(message as StateValueUpdateRequest))
          as StateValueUpdateRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateValueUpdateRequest create() => StateValueUpdateRequest._();
  @$core.override
  StateValueUpdateRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StateValueUpdateRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StateValueUpdateRequest>(create);
  static StateValueUpdateRequest? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(99)
  StateValueUpdateRequest_Value whichValue() =>
      _StateValueUpdateRequest_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(99)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get stateId => $_getSZ(1);
  @$pb.TagNumber(2)
  set stateId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStateId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStateId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get stringValue => $_getSZ(2);
  @$pb.TagNumber(3)
  set stringValue($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStringValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearStringValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get boolValue => $_getBF(3);
  @$pb.TagNumber(4)
  set boolValue($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBoolValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoolValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get doubleValue => $_getN(4);
  @$pb.TagNumber(5)
  set doubleValue($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDoubleValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearDoubleValue() => $_clearField(5);

  @$pb.TagNumber(99)
  $core.String get other => $_getSZ(5);
  @$pb.TagNumber(99)
  set other($core.String value) => $_setString(5, value);
  @$pb.TagNumber(99)
  $core.bool hasOther() => $_has(5);
  @$pb.TagNumber(99)
  void clearOther() => $_clearField(99);
}

class StateValueUpdateResponse extends $pb.GeneratedMessage {
  factory StateValueUpdateResponse({
    $core.bool? suc,
  }) {
    final result = create();
    if (suc != null) result.suc = suc;
    return result;
  }

  StateValueUpdateResponse._();

  factory StateValueUpdateResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StateValueUpdateResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StateValueUpdateResponse',
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'suc')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateValueUpdateResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateValueUpdateResponse copyWith(
          void Function(StateValueUpdateResponse) updates) =>
      super.copyWith((message) => updates(message as StateValueUpdateResponse))
          as StateValueUpdateResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateValueUpdateResponse create() => StateValueUpdateResponse._();
  @$core.override
  StateValueUpdateResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StateValueUpdateResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StateValueUpdateResponse>(create);
  static StateValueUpdateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get suc => $_getBF(0);
  @$pb.TagNumber(1)
  set suc($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuc() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuc() => $_clearField(1);
}

class StateSubscribtion extends $pb.GeneratedMessage {
  factory StateSubscribtion({
    StateSubscribtion_SubscriptionType? type,
    $core.Iterable<$core.String>? stateIds,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (stateIds != null) result.stateIds.addAll(stateIds);
    return result;
  }

  StateSubscribtion._();

  factory StateSubscribtion.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StateSubscribtion.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StateSubscribtion',
      createEmptyInstance: create)
    ..aE<StateSubscribtion_SubscriptionType>(2, _omitFieldNames ? '' : 'type',
        enumValues: StateSubscribtion_SubscriptionType.values)
    ..pPS(3, _omitFieldNames ? '' : 'stateIds', protoName: 'stateIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateSubscribtion clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateSubscribtion copyWith(void Function(StateSubscribtion) updates) =>
      super.copyWith((message) => updates(message as StateSubscribtion))
          as StateSubscribtion;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateSubscribtion create() => StateSubscribtion._();
  @$core.override
  StateSubscribtion createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StateSubscribtion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StateSubscribtion>(create);
  static StateSubscribtion? _defaultInstance;

  @$pb.TagNumber(2)
  StateSubscribtion_SubscriptionType get type => $_getN(0);
  @$pb.TagNumber(2)
  set type(StateSubscribtion_SubscriptionType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get stateIds => $_getList(1);
}

class SearchStateRequest extends $pb.GeneratedMessage {
  factory SearchStateRequest({
    $core.String? userId,
    $core.String? query,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (query != null) result.query = query;
    return result;
  }

  SearchStateRequest._();

  factory SearchStateRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchStateRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchStateRequest',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchStateRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchStateRequest copyWith(void Function(SearchStateRequest) updates) =>
      super.copyWith((message) => updates(message as SearchStateRequest))
          as SearchStateRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchStateRequest create() => SearchStateRequest._();
  @$core.override
  SearchStateRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchStateRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchStateRequest>(create);
  static SearchStateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get query => $_getSZ(1);
  @$pb.TagNumber(2)
  set query($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => $_clearField(2);
}

class SearchStateResponse extends $pb.GeneratedMessage {
  factory SearchStateResponse({
    $core.Iterable<State>? states,
  }) {
    final result = create();
    if (states != null) result.states.addAll(states);
    return result;
  }

  SearchStateResponse._();

  factory SearchStateResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchStateResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchStateResponse',
      createEmptyInstance: create)
    ..pPM<State>(1, _omitFieldNames ? '' : 'states', subBuilder: State.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchStateResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchStateResponse copyWith(void Function(SearchStateResponse) updates) =>
      super.copyWith((message) => updates(message as SearchStateResponse))
          as SearchStateResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchStateResponse create() => SearchStateResponse._();
  @$core.override
  SearchStateResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchStateResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchStateResponse>(create);
  static SearchStateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<State> get states => $_getList(0);
}

class State_StateCommon extends $pb.GeneratedMessage {
  factory State_StateCommon({
    $core.String? name,
    $core.String? desc,
    $core.String? type,
    $core.bool? read,
    $core.bool? write,
    $core.String? role,
    $core.String? unit,
    $core.int? step,
    $core.int? min,
    $core.int? max,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (desc != null) result.desc = desc;
    if (type != null) result.type = type;
    if (read != null) result.read = read;
    if (write != null) result.write = write;
    if (role != null) result.role = role;
    if (unit != null) result.unit = unit;
    if (step != null) result.step = step;
    if (min != null) result.min = min;
    if (max != null) result.max = max;
    return result;
  }

  State_StateCommon._();

  factory State_StateCommon.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory State_StateCommon.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'State.StateCommon',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'desc')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOB(4, _omitFieldNames ? '' : 'read')
    ..aOB(5, _omitFieldNames ? '' : 'write')
    ..aOS(6, _omitFieldNames ? '' : 'role')
    ..aOS(7, _omitFieldNames ? '' : 'unit')
    ..aI(8, _omitFieldNames ? '' : 'step')
    ..aI(9, _omitFieldNames ? '' : 'min')
    ..aI(10, _omitFieldNames ? '' : 'max')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  State_StateCommon clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  State_StateCommon copyWith(void Function(State_StateCommon) updates) =>
      super.copyWith((message) => updates(message as State_StateCommon))
          as State_StateCommon;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static State_StateCommon create() => State_StateCommon._();
  @$core.override
  State_StateCommon createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static State_StateCommon getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<State_StateCommon>(create);
  static State_StateCommon? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get desc => $_getSZ(1);
  @$pb.TagNumber(2)
  set desc($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDesc() => $_has(1);
  @$pb.TagNumber(2)
  void clearDesc() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get read => $_getBF(3);
  @$pb.TagNumber(4)
  set read($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRead() => $_has(3);
  @$pb.TagNumber(4)
  void clearRead() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get write => $_getBF(4);
  @$pb.TagNumber(5)
  set write($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasWrite() => $_has(4);
  @$pb.TagNumber(5)
  void clearWrite() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get role => $_getSZ(5);
  @$pb.TagNumber(6)
  set role($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearRole() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get unit => $_getSZ(6);
  @$pb.TagNumber(7)
  set unit($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUnit() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnit() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get step => $_getIZ(7);
  @$pb.TagNumber(8)
  set step($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStep() => $_has(7);
  @$pb.TagNumber(8)
  void clearStep() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get min => $_getIZ(8);
  @$pb.TagNumber(9)
  set min($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasMin() => $_has(8);
  @$pb.TagNumber(9)
  void clearMin() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get max => $_getIZ(9);
  @$pb.TagNumber(10)
  set max($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasMax() => $_has(9);
  @$pb.TagNumber(10)
  void clearMax() => $_clearField(10);
}

enum State_Value { stringValue, boolValue, doubleValue, other, notSet }

class State extends $pb.GeneratedMessage {
  factory State({
    $core.String? stateId,
    $core.String? stringValue,
    $core.bool? boolValue,
    $core.double? doubleValue,
    State_StateCommon? common,
    $core.String? other,
  }) {
    final result = create();
    if (stateId != null) result.stateId = stateId;
    if (stringValue != null) result.stringValue = stringValue;
    if (boolValue != null) result.boolValue = boolValue;
    if (doubleValue != null) result.doubleValue = doubleValue;
    if (common != null) result.common = common;
    if (other != null) result.other = other;
    return result;
  }

  State._();

  factory State.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory State.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, State_Value> _State_ValueByTag = {
    3: State_Value.stringValue,
    4: State_Value.boolValue,
    5: State_Value.doubleValue,
    99: State_Value.other,
    0: State_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'State',
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 99])
    ..aOS(1, _omitFieldNames ? '' : 'stateId', protoName: 'stateId')
    ..aOS(3, _omitFieldNames ? '' : 'stringValue', protoName: 'stringValue')
    ..aOB(4, _omitFieldNames ? '' : 'boolValue', protoName: 'boolValue')
    ..aD(5, _omitFieldNames ? '' : 'doubleValue', protoName: 'doubleValue')
    ..aOM<State_StateCommon>(6, _omitFieldNames ? '' : 'common',
        subBuilder: State_StateCommon.create)
    ..aOS(99, _omitFieldNames ? '' : 'other')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  State clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  State copyWith(void Function(State) updates) =>
      super.copyWith((message) => updates(message as State)) as State;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static State create() => State._();
  @$core.override
  State createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static State getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<State>(create);
  static State? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(99)
  State_Value whichValue() => _State_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(99)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get stateId => $_getSZ(0);
  @$pb.TagNumber(1)
  set stateId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStateId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStateId() => $_clearField(1);

  @$pb.TagNumber(3)
  $core.String get stringValue => $_getSZ(1);
  @$pb.TagNumber(3)
  set stringValue($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasStringValue() => $_has(1);
  @$pb.TagNumber(3)
  void clearStringValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get boolValue => $_getBF(2);
  @$pb.TagNumber(4)
  set boolValue($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(4)
  $core.bool hasBoolValue() => $_has(2);
  @$pb.TagNumber(4)
  void clearBoolValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get doubleValue => $_getN(3);
  @$pb.TagNumber(5)
  set doubleValue($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(5)
  $core.bool hasDoubleValue() => $_has(3);
  @$pb.TagNumber(5)
  void clearDoubleValue() => $_clearField(5);

  @$pb.TagNumber(6)
  State_StateCommon get common => $_getN(4);
  @$pb.TagNumber(6)
  set common(State_StateCommon value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCommon() => $_has(4);
  @$pb.TagNumber(6)
  void clearCommon() => $_clearField(6);
  @$pb.TagNumber(6)
  State_StateCommon ensureCommon() => $_ensure(4);

  @$pb.TagNumber(99)
  $core.String get other => $_getSZ(5);
  @$pb.TagNumber(99)
  set other($core.String value) => $_setString(5, value);
  @$pb.TagNumber(99)
  $core.bool hasOther() => $_has(5);
  @$pb.TagNumber(99)
  void clearOther() => $_clearField(99);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
