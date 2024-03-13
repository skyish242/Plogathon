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
    {'1': 'StartDatetime', '3': 6, '4': 1, '5': 9, '10': 'StartDatetime'},
    {'1': 'EndDatetime', '3': 7, '4': 1, '5': 9, '10': 'EndDatetime'},
    {'1': 'RouteMap', '3': 8, '4': 1, '5': 9, '10': 'RouteMap'},
    {'1': 'Distance', '3': 9, '4': 1, '5': 2, '10': 'Distance'},
    {'1': 'Steps', '3': 10, '4': 1, '5': 5, '10': 'Steps'},
    {'1': 'WasteCount', '3': 11, '4': 1, '5': 5, '10': 'WasteCount'},
  ],
};

/// Descriptor for `Activity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activityDescriptor = $convert.base64Decode(
    'CghBY3Rpdml0eRIWCgZVc2VySUQYASABKAVSBlVzZXJJRBISCgROYW1lGAIgASgJUgROYW1lEh'
    'IKBFR5cGUYAyABKAlSBFR5cGUSIAoLRGVzY3JpcHRpb24YBCABKAlSC0Rlc2NyaXB0aW9uEhoK'
    'CERhdGV0aW1lGAUgASgJUghEYXRldGltZRIkCg1TdGFydERhdGV0aW1lGAYgASgJUg1TdGFydE'
    'RhdGV0aW1lEiAKC0VuZERhdGV0aW1lGAcgASgJUgtFbmREYXRldGltZRIaCghSb3V0ZU1hcBgI'
    'IAEoCVIIUm91dGVNYXASGgoIRGlzdGFuY2UYCSABKAJSCERpc3RhbmNlEhQKBVN0ZXBzGAogAS'
    'gFUgVTdGVwcxIeCgpXYXN0ZUNvdW50GAsgASgFUgpXYXN0ZUNvdW50');

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
    {'1': 'StartDatetime', '3': 7, '4': 1, '5': 9, '10': 'StartDatetime'},
    {'1': 'EndDatetime', '3': 8, '4': 1, '5': 9, '10': 'EndDatetime'},
    {'1': 'RouteMap', '3': 9, '4': 1, '5': 9, '10': 'RouteMap'},
    {'1': 'Distance', '3': 10, '4': 1, '5': 2, '10': 'Distance'},
    {'1': 'Steps', '3': 11, '4': 1, '5': 5, '10': 'Steps'},
    {'1': 'WasteCount', '3': 12, '4': 1, '5': 5, '10': 'WasteCount'},
  ],
};

/// Descriptor for `ProtoActivity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoActivityDescriptor = $convert.base64Decode(
    'Cg1Qcm90b0FjdGl2aXR5Eh4KCkFjdGl2aXR5SUQYASABKAVSCkFjdGl2aXR5SUQSFgoGVXNlck'
    'lEGAIgASgFUgZVc2VySUQSEgoETmFtZRgDIAEoCVIETmFtZRISCgRUeXBlGAQgASgJUgRUeXBl'
    'EiAKC0Rlc2NyaXB0aW9uGAUgASgJUgtEZXNjcmlwdGlvbhIaCghEYXRldGltZRgGIAEoCVIIRG'
    'F0ZXRpbWUSJAoNU3RhcnREYXRldGltZRgHIAEoCVINU3RhcnREYXRldGltZRIgCgtFbmREYXRl'
    'dGltZRgIIAEoCVILRW5kRGF0ZXRpbWUSGgoIUm91dGVNYXAYCSABKAlSCFJvdXRlTWFwEhoKCE'
    'Rpc3RhbmNlGAogASgCUghEaXN0YW5jZRIUCgVTdGVwcxgLIAEoBVIFU3RlcHMSHgoKV2FzdGVD'
    'b3VudBgMIAEoBVIKV2FzdGVDb3VudA==');

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
    {'1': 'StartDatetime', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'StartDatetime', '17': true},
    {'1': 'EndDatetime', '3': 8, '4': 1, '5': 9, '9': 5, '10': 'EndDatetime', '17': true},
    {'1': 'RouteMap', '3': 9, '4': 1, '5': 9, '9': 6, '10': 'RouteMap', '17': true},
    {'1': 'Distance', '3': 10, '4': 1, '5': 2, '9': 7, '10': 'Distance', '17': true},
    {'1': 'Steps', '3': 11, '4': 1, '5': 5, '9': 8, '10': 'Steps', '17': true},
    {'1': 'WasteCount', '3': 12, '4': 1, '5': 5, '9': 9, '10': 'WasteCount', '17': true},
  ],
  '8': [
    {'1': '_Name'},
    {'1': '_Type'},
    {'1': '_Description'},
    {'1': '_Datetime'},
    {'1': '_StartDatetime'},
    {'1': '_EndDatetime'},
    {'1': '_RouteMap'},
    {'1': '_Distance'},
    {'1': '_Steps'},
    {'1': '_WasteCount'},
  ],
};

/// Descriptor for `UpdateOneActivity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateOneActivityDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVPbmVBY3Rpdml0eRIeCgpBY3Rpdml0eUlEGAEgASgFUgpBY3Rpdml0eUlEEhYKBl'
    'VzZXJJRBgCIAEoBVIGVXNlcklEEhcKBE5hbWUYAyABKAlIAFIETmFtZYgBARIXCgRUeXBlGAQg'
    'ASgJSAFSBFR5cGWIAQESJQoLRGVzY3JpcHRpb24YBSABKAlIAlILRGVzY3JpcHRpb26IAQESHw'
    'oIRGF0ZXRpbWUYBiABKAlIA1IIRGF0ZXRpbWWIAQESKQoNU3RhcnREYXRldGltZRgHIAEoCUgE'
    'Ug1TdGFydERhdGV0aW1liAEBEiUKC0VuZERhdGV0aW1lGAggASgJSAVSC0VuZERhdGV0aW1liA'
    'EBEh8KCFJvdXRlTWFwGAkgASgJSAZSCFJvdXRlTWFwiAEBEh8KCERpc3RhbmNlGAogASgCSAdS'
    'CERpc3RhbmNliAEBEhkKBVN0ZXBzGAsgASgFSAhSBVN0ZXBziAEBEiMKCldhc3RlQ291bnQYDC'
    'ABKAVICVIKV2FzdGVDb3VudIgBAUIHCgVfTmFtZUIHCgVfVHlwZUIOCgxfRGVzY3JpcHRpb25C'
    'CwoJX0RhdGV0aW1lQhAKDl9TdGFydERhdGV0aW1lQg4KDF9FbmREYXRldGltZUILCglfUm91dG'
    'VNYXBCCwoJX0Rpc3RhbmNlQggKBl9TdGVwc0INCgtfV2FzdGVDb3VudA==');

