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
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'Name', '3': 2, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'Type', '3': 3, '4': 1, '5': 9, '10': 'Type'},
    {'1': 'Description', '3': 4, '4': 1, '5': 9, '10': 'Description'},
    {'1': 'Datetime', '3': 5, '4': 1, '5': 9, '10': 'Datetime'},
    {'1': 'RouteMap', '3': 6, '4': 1, '5': 9, '10': 'RouteMap'},
    {'1': 'Distance', '3': 7, '4': 1, '5': 2, '10': 'Distance'},
    {'1': 'Steps', '3': 8, '4': 1, '5': 5, '10': 'Steps'},
    {'1': 'WasteCount', '3': 9, '4': 1, '5': 5, '10': 'WasteCount'},
    {'1': 'Duration', '3': 10, '4': 1, '5': 5, '10': 'Duration'},
  ],
};

/// Descriptor for `Activity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activityDescriptor = $convert.base64Decode(
    'CghBY3Rpdml0eRIWCgZVc2VySUQYASABKAVSBlVzZXJJRBISCgROYW1lGAIgASgJUgROYW1lEh'
    'IKBFR5cGUYAyABKAlSBFR5cGUSIAoLRGVzY3JpcHRpb24YBCABKAlSC0Rlc2NyaXB0aW9uEhoK'
    'CERhdGV0aW1lGAUgASgJUghEYXRldGltZRIaCghSb3V0ZU1hcBgGIAEoCVIIUm91dGVNYXASGg'
    'oIRGlzdGFuY2UYByABKAJSCERpc3RhbmNlEhQKBVN0ZXBzGAggASgFUgVTdGVwcxIeCgpXYXN0'
    'ZUNvdW50GAkgASgFUgpXYXN0ZUNvdW50EhoKCER1cmF0aW9uGAogASgFUghEdXJhdGlvbg==');

@$core.Deprecated('Use protoActivityDescriptor instead')
const ProtoActivity$json = {
  '1': 'ProtoActivity',
  '2': [
    {'1': 'ActivityID', '3': 1, '4': 1, '5': 5, '10': 'ActivityID'},
    {'1': 'UserID', '3': 2, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'Name', '3': 3, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'Type', '3': 4, '4': 1, '5': 9, '10': 'Type'},
    {'1': 'Description', '3': 5, '4': 1, '5': 9, '10': 'Description'},
    {'1': 'Datetime', '3': 6, '4': 1, '5': 9, '10': 'Datetime'},
    {'1': 'RouteMap', '3': 7, '4': 1, '5': 9, '10': 'RouteMap'},
    {'1': 'Distance', '3': 8, '4': 1, '5': 2, '10': 'Distance'},
    {'1': 'Steps', '3': 9, '4': 1, '5': 5, '10': 'Steps'},
    {'1': 'WasteCount', '3': 10, '4': 1, '5': 5, '10': 'WasteCount'},
    {'1': 'Duration', '3': 11, '4': 1, '5': 5, '10': 'Duration'},
  ],
};

/// Descriptor for `ProtoActivity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoActivityDescriptor = $convert.base64Decode(
    'Cg1Qcm90b0FjdGl2aXR5Eh4KCkFjdGl2aXR5SUQYASABKAVSCkFjdGl2aXR5SUQSFgoGVXNlck'
    'lEGAIgASgFUgZVc2VySUQSEgoETmFtZRgDIAEoCVIETmFtZRISCgRUeXBlGAQgASgJUgRUeXBl'
    'EiAKC0Rlc2NyaXB0aW9uGAUgASgJUgtEZXNjcmlwdGlvbhIaCghEYXRldGltZRgGIAEoCVIIRG'
    'F0ZXRpbWUSGgoIUm91dGVNYXAYByABKAlSCFJvdXRlTWFwEhoKCERpc3RhbmNlGAggASgCUghE'
    'aXN0YW5jZRIUCgVTdGVwcxgJIAEoBVIFU3RlcHMSHgoKV2FzdGVDb3VudBgKIAEoBVIKV2FzdG'
    'VDb3VudBIaCghEdXJhdGlvbhgLIAEoBVIIRHVyYXRpb24=');

@$core.Deprecated('Use activitiesDescriptor instead')
const Activities$json = {
  '1': 'Activities',
  '2': [
    {'1': 'activities', '3': 1, '4': 3, '5': 11, '6': '.activity.ProtoActivity', '10': 'activities'},
  ],
};

/// Descriptor for `Activities`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activitiesDescriptor = $convert.base64Decode(
    'CgpBY3Rpdml0aWVzEjcKCmFjdGl2aXRpZXMYASADKAsyFy5hY3Rpdml0eS5Qcm90b0FjdGl2aX'
    'R5UgphY3Rpdml0aWVz');

@$core.Deprecated('Use oneActivityDescriptor instead')
const OneActivity$json = {
  '1': 'OneActivity',
  '2': [
    {'1': 'ActivityID', '3': 1, '4': 1, '5': 5, '10': 'ActivityID'},
  ],
};

/// Descriptor for `OneActivity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List oneActivityDescriptor = $convert.base64Decode(
    'CgtPbmVBY3Rpdml0eRIeCgpBY3Rpdml0eUlEGAEgASgFUgpBY3Rpdml0eUlE');

@$core.Deprecated('Use updateOneActivityDescriptor instead')
const UpdateOneActivity$json = {
  '1': 'UpdateOneActivity',
  '2': [
    {'1': 'ActivityID', '3': 1, '4': 1, '5': 5, '10': 'ActivityID'},
    {'1': 'UserID', '3': 2, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'Name', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'Name', '17': true},
    {'1': 'Type', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'Type', '17': true},
    {'1': 'Description', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'Description', '17': true},
    {'1': 'Datetime', '3': 6, '4': 1, '5': 9, '9': 3, '10': 'Datetime', '17': true},
    {'1': 'RouteMap', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'RouteMap', '17': true},
    {'1': 'Distance', '3': 8, '4': 1, '5': 2, '9': 5, '10': 'Distance', '17': true},
    {'1': 'Steps', '3': 9, '4': 1, '5': 5, '9': 6, '10': 'Steps', '17': true},
    {'1': 'WasteCount', '3': 10, '4': 1, '5': 5, '9': 7, '10': 'WasteCount', '17': true},
    {'1': 'Duration', '3': 11, '4': 1, '5': 5, '9': 8, '10': 'Duration', '17': true},
  ],
  '8': [
    {'1': '_Name'},
    {'1': '_Type'},
    {'1': '_Description'},
    {'1': '_Datetime'},
    {'1': '_RouteMap'},
    {'1': '_Distance'},
    {'1': '_Steps'},
    {'1': '_WasteCount'},
    {'1': '_Duration'},
  ],
};

/// Descriptor for `UpdateOneActivity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOneActivityDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVPbmVBY3Rpdml0eRIeCgpBY3Rpdml0eUlEGAEgASgFUgpBY3Rpdml0eUlEEhYKBl'
    'VzZXJJRBgCIAEoBVIGVXNlcklEEhcKBE5hbWUYAyABKAlIAFIETmFtZYgBARIXCgRUeXBlGAQg'
    'ASgJSAFSBFR5cGWIAQESJQoLRGVzY3JpcHRpb24YBSABKAlIAlILRGVzY3JpcHRpb26IAQESHw'
    'oIRGF0ZXRpbWUYBiABKAlIA1IIRGF0ZXRpbWWIAQESHwoIUm91dGVNYXAYByABKAlIBFIIUm91'
    'dGVNYXCIAQESHwoIRGlzdGFuY2UYCCABKAJIBVIIRGlzdGFuY2WIAQESGQoFU3RlcHMYCSABKA'
    'VIBlIFU3RlcHOIAQESIwoKV2FzdGVDb3VudBgKIAEoBUgHUgpXYXN0ZUNvdW50iAEBEh8KCER1'
    'cmF0aW9uGAsgASgFSAhSCER1cmF0aW9uiAEBQgcKBV9OYW1lQgcKBV9UeXBlQg4KDF9EZXNjcm'
    'lwdGlvbkILCglfRGF0ZXRpbWVCCwoJX1JvdXRlTWFwQgsKCV9EaXN0YW5jZUIICgZfU3RlcHNC'
    'DQoLX1dhc3RlQ291bnRCCwoJX0R1cmF0aW9u');

