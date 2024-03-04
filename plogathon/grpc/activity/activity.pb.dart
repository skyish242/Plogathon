//
//  Generated code. Do not modify.
//  source: activity/activity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $2;

class Activity extends $pb.GeneratedMessage {
  factory Activity({
    $core.int? activityID,
    $core.int? userID,
    $core.String? name,
    $core.String? type,
    $core.String? description,
    $2.Timestamp? datetime,
    $2.Timestamp? startDatetime,
    $2.Timestamp? endDatetime,
    $core.String? routeMap,
    $core.double? distance,
    $core.int? steps,
    $core.int? wasteCount,
  }) {
    final $result = create();
    if (activityID != null) {
      $result.activityID = activityID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    if (description != null) {
      $result.description = description;
    }
    if (datetime != null) {
      $result.datetime = datetime;
    }
    if (startDatetime != null) {
      $result.startDatetime = startDatetime;
    }
    if (endDatetime != null) {
      $result.endDatetime = endDatetime;
    }
    if (routeMap != null) {
      $result.routeMap = routeMap;
    }
    if (distance != null) {
      $result.distance = distance;
    }
    if (steps != null) {
      $result.steps = steps;
    }
    if (wasteCount != null) {
      $result.wasteCount = wasteCount;
    }
    return $result;
  }
  Activity._() : super();
  factory Activity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Activity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Activity', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ActivityID', $pb.PbFieldType.O3, protoName: 'ActivityID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..aOS(3, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aOS(4, _omitFieldNames ? '' : 'Type', protoName: 'Type')
    ..aOS(5, _omitFieldNames ? '' : 'Description', protoName: 'Description')
    ..aOM<$2.Timestamp>(6, _omitFieldNames ? '' : 'Datetime', protoName: 'Datetime', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'StartDatetime', protoName: 'StartDatetime', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(8, _omitFieldNames ? '' : 'EndDatetime', protoName: 'EndDatetime', subBuilder: $2.Timestamp.create)
    ..aOS(9, _omitFieldNames ? '' : 'RouteMap', protoName: 'RouteMap')
    ..a<$core.double>(10, _omitFieldNames ? '' : 'Distance', $pb.PbFieldType.OF, protoName: 'Distance')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'Steps', $pb.PbFieldType.O3, protoName: 'Steps')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'WasteCount', $pb.PbFieldType.O3, protoName: 'WasteCount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Activity clone() => Activity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Activity copyWith(void Function(Activity) updates) => super.copyWith((message) => updates(message as Activity)) as Activity;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Activity create() => Activity._();
  Activity createEmptyInstance() => create();
  static $pb.PbList<Activity> createRepeated() => $pb.PbList<Activity>();
  @$core.pragma('dart2js:noInline')
  static Activity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Activity>(create);
  static Activity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activityID => $_getIZ(0);
  @$pb.TagNumber(1)
  set activityID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActivityID() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userID => $_getIZ(1);
  @$pb.TagNumber(2)
  set userID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $2.Timestamp get datetime => $_getN(5);
  @$pb.TagNumber(6)
  set datetime($2.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDatetime() => $_has(5);
  @$pb.TagNumber(6)
  void clearDatetime() => clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureDatetime() => $_ensure(5);

  @$pb.TagNumber(7)
  $2.Timestamp get startDatetime => $_getN(6);
  @$pb.TagNumber(7)
  set startDatetime($2.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStartDatetime() => $_has(6);
  @$pb.TagNumber(7)
  void clearStartDatetime() => clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureStartDatetime() => $_ensure(6);

  @$pb.TagNumber(8)
  $2.Timestamp get endDatetime => $_getN(7);
  @$pb.TagNumber(8)
  set endDatetime($2.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEndDatetime() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndDatetime() => clearField(8);
  @$pb.TagNumber(8)
  $2.Timestamp ensureEndDatetime() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get routeMap => $_getSZ(8);
  @$pb.TagNumber(9)
  set routeMap($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasRouteMap() => $_has(8);
  @$pb.TagNumber(9)
  void clearRouteMap() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get distance => $_getN(9);
  @$pb.TagNumber(10)
  set distance($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDistance() => $_has(9);
  @$pb.TagNumber(10)
  void clearDistance() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get steps => $_getIZ(10);
  @$pb.TagNumber(11)
  set steps($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSteps() => $_has(10);
  @$pb.TagNumber(11)
  void clearSteps() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get wasteCount => $_getIZ(11);
  @$pb.TagNumber(12)
  set wasteCount($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasWasteCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearWasteCount() => clearField(12);
}

class GetActivityRequest extends $pb.GeneratedMessage {
  factory GetActivityRequest({
    $core.int? activityID,
  }) {
    final $result = create();
    if (activityID != null) {
      $result.activityID = activityID;
    }
    return $result;
  }
  GetActivityRequest._() : super();
  factory GetActivityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetActivityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetActivityRequest', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ActivityID', $pb.PbFieldType.O3, protoName: 'ActivityID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetActivityRequest clone() => GetActivityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetActivityRequest copyWith(void Function(GetActivityRequest) updates) => super.copyWith((message) => updates(message as GetActivityRequest)) as GetActivityRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetActivityRequest create() => GetActivityRequest._();
  GetActivityRequest createEmptyInstance() => create();
  static $pb.PbList<GetActivityRequest> createRepeated() => $pb.PbList<GetActivityRequest>();
  @$core.pragma('dart2js:noInline')
  static GetActivityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetActivityRequest>(create);
  static GetActivityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activityID => $_getIZ(0);
  @$pb.TagNumber(1)
  set activityID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActivityID() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityID() => clearField(1);
}

class DeleteActivityRequest extends $pb.GeneratedMessage {
  factory DeleteActivityRequest({
    $core.int? activityID,
  }) {
    final $result = create();
    if (activityID != null) {
      $result.activityID = activityID;
    }
    return $result;
  }
  DeleteActivityRequest._() : super();
  factory DeleteActivityRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteActivityRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteActivityRequest', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ActivityID', $pb.PbFieldType.O3, protoName: 'ActivityID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteActivityRequest clone() => DeleteActivityRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteActivityRequest copyWith(void Function(DeleteActivityRequest) updates) => super.copyWith((message) => updates(message as DeleteActivityRequest)) as DeleteActivityRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteActivityRequest create() => DeleteActivityRequest._();
  DeleteActivityRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteActivityRequest> createRepeated() => $pb.PbList<DeleteActivityRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteActivityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteActivityRequest>(create);
  static DeleteActivityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activityID => $_getIZ(0);
  @$pb.TagNumber(1)
  set activityID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActivityID() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityID() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
