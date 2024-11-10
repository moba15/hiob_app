//
//  Generated code. Do not modify.
//  source: state/state.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use stateValueUpdateDescriptor instead')
const StateValueUpdate$json = {
  '1': 'StateValueUpdate',
  '2': [
    {'1': 'stateId', '3': 1, '4': 1, '5': 9, '10': 'stateId'},
    {'1': 'acc', '3': 2, '4': 1, '5': 8, '10': 'acc'},
    {'1': 'time', '3': 3, '4': 1, '5': 4, '10': 'time'},
    {'1': 'stringValue', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    {'1': 'boolValue', '3': 5, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    {'1': 'doubleValue', '3': 6, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    {'1': 'other', '3': 99, '4': 1, '5': 9, '9': 0, '10': 'other'},
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `StateValueUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateValueUpdateDescriptor = $convert.base64Decode(
    'ChBTdGF0ZVZhbHVlVXBkYXRlEhgKB3N0YXRlSWQYASABKAlSB3N0YXRlSWQSEAoDYWNjGAIgAS'
    'gIUgNhY2MSEgoEdGltZRgDIAEoBFIEdGltZRIiCgtzdHJpbmdWYWx1ZRgEIAEoCUgAUgtzdHJp'
    'bmdWYWx1ZRIeCglib29sVmFsdWUYBSABKAhIAFIJYm9vbFZhbHVlEiIKC2RvdWJsZVZhbHVlGA'
    'YgASgBSABSC2RvdWJsZVZhbHVlEhYKBW90aGVyGGMgASgJSABSBW90aGVyQgcKBXZhbHVl');

@$core.Deprecated('Use stateValueUpdateRequestDescriptor instead')
const StateValueUpdateRequest$json = {
  '1': 'StateValueUpdateRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'stateId', '3': 2, '4': 1, '5': 9, '10': 'stateId'},
    {'1': 'stringValue', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    {'1': 'boolValue', '3': 4, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    {'1': 'doubleValue', '3': 5, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    {'1': 'other', '3': 99, '4': 1, '5': 9, '9': 0, '10': 'other'},
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `StateValueUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateValueUpdateRequestDescriptor = $convert.base64Decode(
    'ChdTdGF0ZVZhbHVlVXBkYXRlUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIYCgdzdG'
    'F0ZUlkGAIgASgJUgdzdGF0ZUlkEiIKC3N0cmluZ1ZhbHVlGAMgASgJSABSC3N0cmluZ1ZhbHVl'
    'Eh4KCWJvb2xWYWx1ZRgEIAEoCEgAUglib29sVmFsdWUSIgoLZG91YmxlVmFsdWUYBSABKAFIAF'
    'ILZG91YmxlVmFsdWUSFgoFb3RoZXIYYyABKAlIAFIFb3RoZXJCBwoFdmFsdWU=');

@$core.Deprecated('Use stateValueUpdateResponseDescriptor instead')
const StateValueUpdateResponse$json = {
  '1': 'StateValueUpdateResponse',
  '2': [
    {'1': 'suc', '3': 1, '4': 1, '5': 8, '10': 'suc'},
  ],
};

/// Descriptor for `StateValueUpdateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateValueUpdateResponseDescriptor = $convert.base64Decode(
    'ChhTdGF0ZVZhbHVlVXBkYXRlUmVzcG9uc2USEAoDc3VjGAEgASgIUgNzdWM=');

@$core.Deprecated('Use stateSubscribtionDescriptor instead')
const StateSubscribtion$json = {
  '1': 'StateSubscribtion',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.StateSubscribtion.SubscriptionType', '10': 'type'},
    {'1': 'stateIds', '3': 3, '4': 3, '5': 9, '10': 'stateIds'},
  ],
  '4': [StateSubscribtion_SubscriptionType$json],
};

@$core.Deprecated('Use stateSubscribtionDescriptor instead')
const StateSubscribtion_SubscriptionType$json = {
  '1': 'SubscriptionType',
  '2': [
    {'1': 'cancle', '2': 0},
    {'1': 'subscripe', '2': 1},
  ],
};

/// Descriptor for `StateSubscribtion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateSubscribtionDescriptor = $convert.base64Decode(
    'ChFTdGF0ZVN1YnNjcmlidGlvbhIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBI3CgR0eXBlGAIgAS'
    'gOMiMuU3RhdGVTdWJzY3JpYnRpb24uU3Vic2NyaXB0aW9uVHlwZVIEdHlwZRIaCghzdGF0ZUlk'
    'cxgDIAMoCVIIc3RhdGVJZHMiLQoQU3Vic2NyaXB0aW9uVHlwZRIKCgZjYW5jbGUQABINCglzdW'
    'JzY3JpcGUQAQ==');

@$core.Deprecated('Use searchStateDescriptor instead')
const SearchState$json = {
  '1': 'SearchState',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'query', '3': 2, '4': 1, '5': 9, '10': 'query'},
  ],
};

/// Descriptor for `SearchState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchStateDescriptor = $convert.base64Decode(
    'CgtTZWFyY2hTdGF0ZRIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIUCgVxdWVyeRgCIAEoCVIFcX'
    'Vlcnk=');

@$core.Deprecated('Use searchStateResponseDescriptor instead')
const SearchStateResponse$json = {
  '1': 'SearchStateResponse',
  '2': [
    {'1': 'states', '3': 1, '4': 3, '5': 11, '6': '.State', '10': 'states'},
  ],
};

/// Descriptor for `SearchStateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchStateResponseDescriptor = $convert.base64Decode(
    'ChNTZWFyY2hTdGF0ZVJlc3BvbnNlEh4KBnN0YXRlcxgBIAMoCzIGLlN0YXRlUgZzdGF0ZXM=');

@$core.Deprecated('Use stateDescriptor instead')
const State$json = {
  '1': 'State',
  '2': [
    {'1': 'stateId', '3': 1, '4': 1, '5': 9, '10': 'stateId'},
    {'1': 'stringValue', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    {'1': 'boolValue', '3': 4, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    {'1': 'doubleValue', '3': 5, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    {'1': 'other', '3': 99, '4': 1, '5': 9, '9': 0, '10': 'other'},
  ],
  '3': [State_StateCommon$json],
  '8': [
    {'1': 'value'},
  ],
};

@$core.Deprecated('Use stateDescriptor instead')
const State_StateCommon$json = {
  '1': 'StateCommon',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'desc', '3': 2, '4': 1, '5': 9, '10': 'desc'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.State.StateCommon.StateType', '10': 'type'},
    {'1': 'read', '3': 4, '4': 1, '5': 8, '10': 'read'},
    {'1': 'write', '3': 5, '4': 1, '5': 8, '10': 'write'},
    {'1': 'role', '3': 6, '4': 1, '5': 9, '10': 'role'},
    {'1': 'unit', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'unit', '17': true},
    {'1': 'step', '3': 8, '4': 1, '5': 5, '9': 1, '10': 'step', '17': true},
    {'1': 'min', '3': 9, '4': 1, '5': 5, '9': 2, '10': 'min', '17': true},
    {'1': 'max', '3': 10, '4': 1, '5': 5, '9': 3, '10': 'max', '17': true},
  ],
  '4': [State_StateCommon_StateType$json],
  '8': [
    {'1': '_unit'},
    {'1': '_step'},
    {'1': '_min'},
    {'1': '_max'},
  ],
};

@$core.Deprecated('Use stateDescriptor instead')
const State_StateCommon_StateType$json = {
  '1': 'StateType',
  '2': [
    {'1': 'boolean', '2': 0},
    {'1': 'str', '2': 1},
    {'1': 'number', '2': 2},
  ],
};

/// Descriptor for `State`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateDescriptor = $convert.base64Decode(
    'CgVTdGF0ZRIYCgdzdGF0ZUlkGAEgASgJUgdzdGF0ZUlkEiIKC3N0cmluZ1ZhbHVlGAMgASgJSA'
    'BSC3N0cmluZ1ZhbHVlEh4KCWJvb2xWYWx1ZRgEIAEoCEgAUglib29sVmFsdWUSIgoLZG91Ymxl'
    'VmFsdWUYBSABKAFIAFILZG91YmxlVmFsdWUSFgoFb3RoZXIYYyABKAlIAFIFb3RoZXIa1gIKC1'
    'N0YXRlQ29tbW9uEhIKBG5hbWUYASABKAlSBG5hbWUSEgoEZGVzYxgCIAEoCVIEZGVzYxIwCgR0'
    'eXBlGAMgASgOMhwuU3RhdGUuU3RhdGVDb21tb24uU3RhdGVUeXBlUgR0eXBlEhIKBHJlYWQYBC'
    'ABKAhSBHJlYWQSFAoFd3JpdGUYBSABKAhSBXdyaXRlEhIKBHJvbGUYBiABKAlSBHJvbGUSFwoE'
    'dW5pdBgHIAEoCUgAUgR1bml0iAEBEhcKBHN0ZXAYCCABKAVIAVIEc3RlcIgBARIVCgNtaW4YCS'
    'ABKAVIAlIDbWluiAEBEhUKA21heBgKIAEoBUgDUgNtYXiIAQEiLQoJU3RhdGVUeXBlEgsKB2Jv'
    'b2xlYW4QABIHCgNzdHIQARIKCgZudW1iZXIQAkIHCgVfdW5pdEIHCgVfc3RlcEIGCgRfbWluQg'
    'YKBF9tYXhCBwoFdmFsdWU=');

const $core.Map<$core.String, $core.dynamic> stateServiceBase$json = {
  '1': 'stateService',
  '2': [
    {'1': 'Subscibe', '2': '.StateSubscribtion', '3': '.StateValueUpdate', '6': true},
    {'1': 'updateValue', '2': '.StateValueUpdateRequest', '3': '.StateValueUpdateResponse'},
    {'1': 'searchState', '2': '.SearchState', '3': '.SearchStateResponse'},
    {'1': 'searchStateStream', '2': '.SearchState', '3': '.SearchStateResponse', '5': true, '6': true},
  ],
};

@$core.Deprecated('Use stateServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> stateServiceBase$messageJson = {
  '.StateSubscribtion': StateSubscribtion$json,
  '.StateValueUpdate': StateValueUpdate$json,
  '.StateValueUpdateRequest': StateValueUpdateRequest$json,
  '.StateValueUpdateResponse': StateValueUpdateResponse$json,
  '.SearchState': SearchState$json,
  '.SearchStateResponse': SearchStateResponse$json,
  '.State': State$json,
};

/// Descriptor for `stateService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List stateServiceDescriptor = $convert.base64Decode(
    'CgxzdGF0ZVNlcnZpY2USMwoIU3Vic2NpYmUSEi5TdGF0ZVN1YnNjcmlidGlvbhoRLlN0YXRlVm'
    'FsdWVVcGRhdGUwARJCCgt1cGRhdGVWYWx1ZRIYLlN0YXRlVmFsdWVVcGRhdGVSZXF1ZXN0Ghku'
    'U3RhdGVWYWx1ZVVwZGF0ZVJlc3BvbnNlEjEKC3NlYXJjaFN0YXRlEgwuU2VhcmNoU3RhdGUaFC'
    '5TZWFyY2hTdGF0ZVJlc3BvbnNlEjsKEXNlYXJjaFN0YXRlU3RyZWFtEgwuU2VhcmNoU3RhdGUa'
    'FC5TZWFyY2hTdGF0ZVJlc3BvbnNlKAEwAQ==');
