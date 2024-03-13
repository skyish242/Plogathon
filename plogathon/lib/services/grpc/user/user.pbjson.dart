//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'Username', '3': 1, '4': 1, '5': 9, '10': 'Username'},
    {'1': 'FirstName', '3': 2, '4': 1, '5': 9, '10': 'FirstName'},
    {'1': 'LastName', '3': 3, '4': 1, '5': 9, '10': 'LastName'},
    {'1': 'Email', '3': 4, '4': 1, '5': 9, '10': 'Email'},
    {'1': 'StravaEmail', '3': 5, '4': 1, '5': 9, '10': 'StravaEmail'},
    {'1': 'Password', '3': 6, '4': 1, '5': 9, '10': 'Password'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhoKCFVzZXJuYW1lGAEgASgJUghVc2VybmFtZRIcCglGaXJzdE5hbWUYAiABKAlSCU'
    'ZpcnN0TmFtZRIaCghMYXN0TmFtZRgDIAEoCVIITGFzdE5hbWUSFAoFRW1haWwYBCABKAlSBUVt'
    'YWlsEiAKC1N0cmF2YUVtYWlsGAUgASgJUgtTdHJhdmFFbWFpbBIaCghQYXNzd29yZBgGIAEoCV'
    'IIUGFzc3dvcmQ=');

@$core.Deprecated('Use protoUserDescriptor instead')
const ProtoUser$json = {
  '1': 'ProtoUser',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'Username', '3': 2, '4': 1, '5': 9, '10': 'Username'},
    {'1': 'FirstName', '3': 3, '4': 1, '5': 9, '10': 'FirstName'},
    {'1': 'LastName', '3': 4, '4': 1, '5': 9, '10': 'LastName'},
    {'1': 'Email', '3': 5, '4': 1, '5': 9, '10': 'Email'},
    {'1': 'StravaEmail', '3': 6, '4': 1, '5': 9, '10': 'StravaEmail'},
  ],
};

/// Descriptor for `ProtoUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoUserDescriptor = $convert.base64Decode(
    'CglQcm90b1VzZXISFgoGVXNlcklEGAEgASgFUgZVc2VySUQSGgoIVXNlcm5hbWUYAiABKAlSCF'
    'VzZXJuYW1lEhwKCUZpcnN0TmFtZRgDIAEoCVIJRmlyc3ROYW1lEhoKCExhc3ROYW1lGAQgASgJ'
    'UghMYXN0TmFtZRIUCgVFbWFpbBgFIAEoCVIFRW1haWwSIAoLU3RyYXZhRW1haWwYBiABKAlSC1'
    'N0cmF2YUVtYWls');

@$core.Deprecated('Use usersDescriptor instead')
const Users$json = {
  '1': 'Users',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.user.ProtoUser', '10': 'users'},
  ],
};

/// Descriptor for `Users`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List usersDescriptor = $convert.base64Decode(
    'CgVVc2VycxIlCgV1c2VycxgBIAMoCzIPLnVzZXIuUHJvdG9Vc2VyUgV1c2Vycw==');

@$core.Deprecated('Use oneUserDescriptor instead')
const OneUser$json = {
  '1': 'OneUser',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `OneUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List oneUserDescriptor = $convert.base64Decode(
    'CgdPbmVVc2VyEhYKBlVzZXJJRBgBIAEoBVIGVXNlcklE');

@$core.Deprecated('Use updateOneUserDescriptor instead')
const UpdateOneUser$json = {
  '1': 'UpdateOneUser',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'Username', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'Username', '17': true},
    {'1': 'FirstName', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'FirstName', '17': true},
    {'1': 'LastName', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'LastName', '17': true},
    {'1': 'Email', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'Email', '17': true},
    {'1': 'StravaEmail', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'StravaEmail', '17': true},
    {'1': 'Password', '3': 7, '4': 1, '5': 9, '9': 5, '10': 'Password', '17': true},
  ],
  '8': [
    {'1': '_Username'},
    {'1': '_FirstName'},
    {'1': '_LastName'},
    {'1': '_Email'},
    {'1': '_StravaEmail'},
    {'1': '_Password'},
  ],
};

/// Descriptor for `UpdateOneUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOneUserDescriptor = $convert.base64Decode(
    'Cg1VcGRhdGVPbmVVc2VyEhYKBlVzZXJJRBgBIAEoBVIGVXNlcklEEh8KCFVzZXJuYW1lGAIgAS'
    'gJSABSCFVzZXJuYW1liAEBEiEKCUZpcnN0TmFtZRgDIAEoCUgBUglGaXJzdE5hbWWIAQESHwoI'
    'TGFzdE5hbWUYBCABKAlIAlIITGFzdE5hbWWIAQESGQoFRW1haWwYBSABKAlIA1IFRW1haWyIAQ'
    'ESJQoLU3RyYXZhRW1haWwYBiABKAlIBFILU3RyYXZhRW1haWyIAQESHwoIUGFzc3dvcmQYByAB'
    'KAlIBVIIUGFzc3dvcmSIAQFCCwoJX1VzZXJuYW1lQgwKCl9GaXJzdE5hbWVCCwoJX0xhc3ROYW'
    '1lQggKBl9FbWFpbEIOCgxfU3RyYXZhRW1haWxCCwoJX1Bhc3N3b3Jk');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'Username', '3': 1, '4': 1, '5': 9, '10': 'Username'},
    {'1': 'Password', '3': 2, '4': 1, '5': 9, '10': 'Password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSGgoIVXNlcm5hbWUYASABKAlSCFVzZXJuYW1lEhoKCFBhc3N3b3JkGA'
    'IgASgJUghQYXNzd29yZA==');

