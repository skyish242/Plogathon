//
//  Generated code. Do not modify.
//  source: user/user.proto
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
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'Username', '3': 2, '4': 1, '5': 9, '10': 'Username'},
    {'1': 'FirstName', '3': 3, '4': 1, '5': 9, '10': 'FirstName'},
    {'1': 'LastName', '3': 4, '4': 1, '5': 9, '10': 'LastName'},
    {'1': 'Email', '3': 5, '4': 1, '5': 9, '10': 'Email'},
    {'1': 'StravaEmail', '3': 6, '4': 1, '5': 9, '10': 'StravaEmail'},
    {'1': 'Password', '3': 7, '4': 1, '5': 9, '10': 'Password'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhYKBlVzZXJJRBgBIAEoBVIGVXNlcklEEhoKCFVzZXJuYW1lGAIgASgJUghVc2Vybm'
    'FtZRIcCglGaXJzdE5hbWUYAyABKAlSCUZpcnN0TmFtZRIaCghMYXN0TmFtZRgEIAEoCVIITGFz'
    'dE5hbWUSFAoFRW1haWwYBSABKAlSBUVtYWlsEiAKC1N0cmF2YUVtYWlsGAYgASgJUgtTdHJhdm'
    'FFbWFpbBIaCghQYXNzd29yZBgHIAEoCVIIUGFzc3dvcmQ=');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIWCgZ1c2VySWQYASABKAVSBnVzZXJJZA==');

@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = {
  '1': 'DeleteUserRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVVc2VyUmVxdWVzdBIWCgZ1c2VySWQYASABKAVSBnVzZXJJZA==');

