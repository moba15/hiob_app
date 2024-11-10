//
//  Generated code. Do not modify.
//  source: login/login.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use compatibilityRequestDescriptor instead')
const CompatibilityRequest$json = {
  '1': 'CompatibilityRequest',
  '2': [
    {'1': 'buildnumber', '3': 1, '4': 1, '5': 9, '10': 'buildnumber'},
    {'1': 'versionumber', '3': 2, '4': 1, '5': 9, '10': 'versionumber'},
  ],
};

/// Descriptor for `CompatibilityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compatibilityRequestDescriptor = $convert.base64Decode(
    'ChRDb21wYXRpYmlsaXR5UmVxdWVzdBIgCgtidWlsZG51bWJlchgBIAEoCVILYnVpbGRudW1iZX'
    'ISIgoMdmVyc2lvbnVtYmVyGAIgASgJUgx2ZXJzaW9udW1iZXI=');

@$core.Deprecated('Use compatibilityResponseDescriptor instead')
const CompatibilityResponse$json = {
  '1': 'CompatibilityResponse',
  '2': [
    {'1': 'buildnumber', '3': 1, '4': 1, '5': 9, '10': 'buildnumber'},
    {'1': 'versionumber', '3': 2, '4': 1, '5': 9, '10': 'versionumber'},
  ],
};

/// Descriptor for `CompatibilityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List compatibilityResponseDescriptor = $convert.base64Decode(
    'ChVDb21wYXRpYmlsaXR5UmVzcG9uc2USIAoLYnVpbGRudW1iZXIYASABKAlSC2J1aWxkbnVtYm'
    'VyEiIKDHZlcnNpb251bWJlchgCIAEoCVIMdmVyc2lvbnVtYmVy');

@$core.Deprecated('Use firstPingDescriptor instead')
const FirstPing$json = {
  '1': 'FirstPing',
  '2': [
    {'1': 'buildnumber', '3': 1, '4': 1, '5': 9, '10': 'buildnumber'},
    {'1': 'versionumber', '3': 2, '4': 1, '5': 9, '10': 'versionumber'},
  ],
};

/// Descriptor for `FirstPing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List firstPingDescriptor = $convert.base64Decode(
    'CglGaXJzdFBpbmcSIAoLYnVpbGRudW1iZXIYASABKAlSC2J1aWxkbnVtYmVyEiIKDHZlcnNpb2'
    '51bWJlchgCIAEoCVIMdmVyc2lvbnVtYmVy');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'deviceName', '3': 1, '4': 1, '5': 9, '10': 'deviceName'},
    {'1': 'deviceId', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'key', '3': 3, '4': 1, '5': 9, '10': 'key'},
    {'1': 'user', '3': 4, '4': 1, '5': 9, '10': 'user'},
    {'1': 'password', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'password', '17': true},
  ],
  '8': [
    {'1': '_password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSHgoKZGV2aWNlTmFtZRgBIAEoCVIKZGV2aWNlTmFtZRIaCghkZXZpY2'
    'VJZBgCIAEoCVIIZGV2aWNlSWQSEAoDa2V5GAMgASgJUgNrZXkSEgoEdXNlchgEIAEoCVIEdXNl'
    'chIfCghwYXNzd29yZBgFIAEoCUgAUghwYXNzd29yZIgBAUILCglfcGFzc3dvcmQ=');

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse$json = {
  '1': 'LoginResponse',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.LoginResponse.Status', '10': 'status'},
    {'1': 'errorMsg', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'errorMsg', '17': true},
    {'1': 'sessionId', '3': 6, '4': 1, '5': 9, '10': 'sessionId'},
  ],
  '4': [LoginResponse_Status$json],
  '8': [
    {'1': '_errorMsg'},
  ],
};

@$core.Deprecated('Use loginResponseDescriptor instead')
const LoginResponse_Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'succesfull', '2': 0},
    {'1': 'wrongKey', '2': 1},
    {'1': 'wrongPassword', '2': 2},
    {'1': 'error', '2': 3},
  ],
};

/// Descriptor for `LoginResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dpblJlc3BvbnNlEhAKA2tleRgBIAEoCVIDa2V5Ei0KBnN0YXR1cxgEIAEoDjIVLkxvZ2'
    'luUmVzcG9uc2UuU3RhdHVzUgZzdGF0dXMSHwoIZXJyb3JNc2cYBSABKAlIAFIIZXJyb3JNc2eI'
    'AQESHAoJc2Vzc2lvbklkGAYgASgJUglzZXNzaW9uSWQiRAoGU3RhdHVzEg4KCnN1Y2Nlc2Z1bG'
    'wQABIMCgh3cm9uZ0tleRABEhEKDXdyb25nUGFzc3dvcmQQAhIJCgVlcnJvchADQgsKCV9lcnJv'
    'ck1zZw==');

@$core.Deprecated('Use newAesPacketDescriptor instead')
const NewAesPacket$json = {
  '1': 'NewAesPacket',
};

/// Descriptor for `NewAesPacket`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newAesPacketDescriptor = $convert.base64Decode(
    'CgxOZXdBZXNQYWNrZXQ=');

@$core.Deprecated('Use wrongAesKeyPackDescriptor instead')
const WrongAesKeyPack$json = {
  '1': 'WrongAesKeyPack',
};

/// Descriptor for `WrongAesKeyPack`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wrongAesKeyPackDescriptor = $convert.base64Decode(
    'Cg9Xcm9uZ0Flc0tleVBhY2s=');

const $core.Map<$core.String, $core.dynamic> LoginServiceBase$json = {
  '1': 'Login',
  '2': [
    {'1': 'CheckCompatibility', '2': '.CompatibilityRequest', '3': '.CompatibilityResponse', '4': {}},
    {'1': 'Login', '2': '.LoginRequest', '3': '.LoginResponse', '4': {}},
  ],
};

@$core.Deprecated('Use loginServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> LoginServiceBase$messageJson = {
  '.CompatibilityRequest': CompatibilityRequest$json,
  '.CompatibilityResponse': CompatibilityResponse$json,
  '.LoginRequest': LoginRequest$json,
  '.LoginResponse': LoginResponse$json,
};

/// Descriptor for `Login`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List loginServiceDescriptor = $convert.base64Decode(
    'CgVMb2dpbhJFChJDaGVja0NvbXBhdGliaWxpdHkSFS5Db21wYXRpYmlsaXR5UmVxdWVzdBoWLk'
    'NvbXBhdGliaWxpdHlSZXNwb25zZSIAEigKBUxvZ2luEg0uTG9naW5SZXF1ZXN0Gg4uTG9naW5S'
    'ZXNwb25zZSIA');

