//
//  Generated code. Do not modify.
//  source: activity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use activityDescriptor instead')
const Activity$json = {
  '1': 'Activity',
  '2': [
    {'1': 'ActivityID', '3': 1, '4': 1, '5': 5, '10': 'ActivityID'},
    {'1': 'UserID', '3': 2, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'Name', '3': 3, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'Type', '3': 4, '4': 1, '5': 9, '10': 'Type'},
    {'1': 'Description', '3': 5, '4': 1, '5': 9, '10': 'Description'},
    {'1': 'Datetime', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'Datetime'},
    {'1': 'StartDatetime', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'StartDatetime'},
    {'1': 'EndDatetime', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'EndDatetime'},
    {'1': 'RouteMap', '3': 9, '4': 1, '5': 9, '10': 'RouteMap'},
    {'1': 'Distance', '3': 10, '4': 1, '5': 2, '10': 'Distance'},
    {'1': 'Steps', '3': 11, '4': 1, '5': 5, '10': 'Steps'},
    {'1': 'WasteCount', '3': 12, '4': 1, '5': 5, '10': 'WasteCount'},
  ],
};

/// Descriptor for `Activity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activityDescriptor = $convert.base64Decode(
    'CghBY3Rpdml0eRIeCgpBY3Rpdml0eUlEGAEgASgFUgpBY3Rpdml0eUlEEhYKBlVzZXJJRBgCIA'
    'EoBVIGVXNlcklEEhIKBE5hbWUYAyABKAlSBE5hbWUSEgoEVHlwZRgEIAEoCVIEVHlwZRIgCgtE'
    'ZXNjcmlwdGlvbhgFIAEoCVILRGVzY3JpcHRpb24SNgoIRGF0ZXRpbWUYBiABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUghEYXRldGltZRJACg1TdGFydERhdGV0aW1lGAcgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFINU3RhcnREYXRldGltZRI8CgtFbmREYXRldGltZR'
    'gIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC0VuZERhdGV0aW1lEhoKCFJvdXRl'
    'TWFwGAkgASgJUghSb3V0ZU1hcBIaCghEaXN0YW5jZRgKIAEoAlIIRGlzdGFuY2USFAoFU3RlcH'
    'MYCyABKAVSBVN0ZXBzEh4KCldhc3RlQ291bnQYDCABKAVSCldhc3RlQ291bnQ=');

@$core.Deprecated('Use getActivityRequestDescriptor instead')
const GetActivityRequest$json = {
  '1': 'GetActivityRequest',
  '2': [
    {'1': 'ActivityID', '3': 1, '4': 1, '5': 5, '10': 'ActivityID'},
  ],
};

/// Descriptor for `GetActivityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getActivityRequestDescriptor = $convert.base64Decode(
    'ChJHZXRBY3Rpdml0eVJlcXVlc3QSHgoKQWN0aXZpdHlJRBgBIAEoBVIKQWN0aXZpdHlJRA==');

@$core.Deprecated('Use deleteActivityRequestDescriptor instead')
const DeleteActivityRequest$json = {
  '1': 'DeleteActivityRequest',
  '2': [
    {'1': 'ActivityID', '3': 1, '4': 1, '5': 5, '10': 'ActivityID'},
  ],
};

/// Descriptor for `DeleteActivityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteActivityRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVBY3Rpdml0eVJlcXVlc3QSHgoKQWN0aXZpdHlJRBgBIAEoBVIKQWN0aXZpdHlJRA'
    '==');

