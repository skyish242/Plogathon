//
//  Generated code. Do not modify.
//  source: activity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Activity extends $pb.GeneratedMessage {
  factory Activity({
    $core.int? userID,
    $core.String? name,
    $core.String? type,
    $core.String? description,
    $core.String? datetime,
    $core.String? startDatetime,
    $core.String? endDatetime,
    $core.String? routeMap,
    $core.double? distance,
    $core.int? steps,
    $core.int? wasteCount,
  }) {
    final $result = create();
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Activity', package: const $pb.PackageName(_omitMessageNames ? '' : 'activity'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..aOS(2, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aOS(3, _omitFieldNames ? '' : 'Type', protoName: 'Type')
    ..aOS(4, _omitFieldNames ? '' : 'Description', protoName: 'Description')
    ..aOS(5, _omitFieldNames ? '' : 'Datetime', protoName: 'Datetime')
    ..aOS(6, _omitFieldNames ? '' : 'StartDatetime', protoName: 'StartDatetime')
    ..aOS(7, _omitFieldNames ? '' : 'EndDatetime', protoName: 'EndDatetime')
    ..aOS(8, _omitFieldNames ? '' : 'RouteMap', protoName: 'RouteMap')
    ..a<$core.double>(9, _omitFieldNames ? '' : 'Distance', $pb.PbFieldType.OF, protoName: 'Distance')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'Steps', $pb.PbFieldType.O3, protoName: 'Steps')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'WasteCount', $pb.PbFieldType.O3, protoName: 'WasteCount')
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
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get datetime => $_getSZ(4);
  @$pb.TagNumber(5)
  set datetime($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDatetime() => $_has(4);
  @$pb.TagNumber(5)
  void clearDatetime() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get startDatetime => $_getSZ(5);
  @$pb.TagNumber(6)
  set startDatetime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartDatetime() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartDatetime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get endDatetime => $_getSZ(6);
  @$pb.TagNumber(7)
  set endDatetime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndDatetime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndDatetime() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get routeMap => $_getSZ(7);
  @$pb.TagNumber(8)
  set routeMap($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRouteMap() => $_has(7);
  @$pb.TagNumber(8)
  void clearRouteMap() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get distance => $_getN(8);
  @$pb.TagNumber(9)
  set distance($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDistance() => $_has(8);
  @$pb.TagNumber(9)
  void clearDistance() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get steps => $_getIZ(9);
  @$pb.TagNumber(10)
  set steps($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSteps() => $_has(9);
  @$pb.TagNumber(10)
  void clearSteps() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get wasteCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set wasteCount($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasWasteCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearWasteCount() => clearField(11);
}

class ProtoActivity extends $pb.GeneratedMessage {
  factory ProtoActivity({
    $core.int? activityID,
    $core.int? userID,
    $core.String? name,
    $core.String? type,
    $core.String? description,
    $core.String? datetime,
    $core.String? startDatetime,
    $core.String? endDatetime,
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
  ProtoActivity._() : super();
  factory ProtoActivity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoActivity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProtoActivity', package: const $pb.PackageName(_omitMessageNames ? '' : 'activity'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ActivityID', $pb.PbFieldType.O3, protoName: 'ActivityID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..aOS(3, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aOS(4, _omitFieldNames ? '' : 'Type', protoName: 'Type')
    ..aOS(5, _omitFieldNames ? '' : 'Description', protoName: 'Description')
    ..aOS(6, _omitFieldNames ? '' : 'Datetime', protoName: 'Datetime')
    ..aOS(7, _omitFieldNames ? '' : 'StartDatetime', protoName: 'StartDatetime')
    ..aOS(8, _omitFieldNames ? '' : 'EndDatetime', protoName: 'EndDatetime')
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
  ProtoActivity clone() => ProtoActivity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtoActivity copyWith(void Function(ProtoActivity) updates) => super.copyWith((message) => updates(message as ProtoActivity)) as ProtoActivity;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoActivity create() => ProtoActivity._();
  ProtoActivity createEmptyInstance() => create();
  static $pb.PbList<ProtoActivity> createRepeated() => $pb.PbList<ProtoActivity>();
  @$core.pragma('dart2js:noInline')
  static ProtoActivity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoActivity>(create);
  static ProtoActivity? _defaultInstance;

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
  $core.String get datetime => $_getSZ(5);
  @$pb.TagNumber(6)
  set datetime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDatetime() => $_has(5);
  @$pb.TagNumber(6)
  void clearDatetime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get startDatetime => $_getSZ(6);
  @$pb.TagNumber(7)
  set startDatetime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStartDatetime() => $_has(6);
  @$pb.TagNumber(7)
  void clearStartDatetime() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get endDatetime => $_getSZ(7);
  @$pb.TagNumber(8)
  set endDatetime($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEndDatetime() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndDatetime() => clearField(8);

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

class Activities extends $pb.GeneratedMessage {
  factory Activities({
    $core.Iterable<ProtoActivity>? activities,
  }) {
    final $result = create();
    if (activities != null) {
      $result.activities.addAll(activities);
    }
    return $result;
  }
  Activities._() : super();
  factory Activities.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Activities.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Activities', package: const $pb.PackageName(_omitMessageNames ? '' : 'activity'), createEmptyInstance: create)
    ..pc<ProtoActivity>(1, _omitFieldNames ? '' : 'activities', $pb.PbFieldType.PM, subBuilder: ProtoActivity.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Activities clone() => Activities()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Activities copyWith(void Function(Activities) updates) => super.copyWith((message) => updates(message as Activities)) as Activities;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Activities create() => Activities._();
  Activities createEmptyInstance() => create();
  static $pb.PbList<Activities> createRepeated() => $pb.PbList<Activities>();
  @$core.pragma('dart2js:noInline')
  static Activities getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Activities>(create);
  static Activities? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ProtoActivity> get activities => $_getList(0);
}

class OneActivity extends $pb.GeneratedMessage {
  factory OneActivity({
    $core.int? activityID,
  }) {
    final $result = create();
    if (activityID != null) {
      $result.activityID = activityID;
    }
    return $result;
  }
  OneActivity._() : super();
  factory OneActivity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OneActivity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OneActivity', package: const $pb.PackageName(_omitMessageNames ? '' : 'activity'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ActivityID', $pb.PbFieldType.O3, protoName: 'ActivityID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OneActivity clone() => OneActivity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OneActivity copyWith(void Function(OneActivity) updates) => super.copyWith((message) => updates(message as OneActivity)) as OneActivity;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OneActivity create() => OneActivity._();
  OneActivity createEmptyInstance() => create();
  static $pb.PbList<OneActivity> createRepeated() => $pb.PbList<OneActivity>();
  @$core.pragma('dart2js:noInline')
  static OneActivity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OneActivity>(create);
  static OneActivity? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activityID => $_getIZ(0);
  @$pb.TagNumber(1)
  set activityID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasActivityID() => $_has(0);
  @$pb.TagNumber(1)
  void clearActivityID() => clearField(1);
}

class UpdateOneActivity extends $pb.GeneratedMessage {
  factory UpdateOneActivity({
    $core.int? activityID,
    $core.int? userID,
    $core.String? name,
    $core.String? type,
    $core.String? description,
    $core.String? datetime,
    $core.String? startDatetime,
    $core.String? endDatetime,
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
  UpdateOneActivity._() : super();
  factory UpdateOneActivity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateOneActivity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateOneActivity', package: const $pb.PackageName(_omitMessageNames ? '' : 'activity'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ActivityID', $pb.PbFieldType.O3, protoName: 'ActivityID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..aOS(3, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aOS(4, _omitFieldNames ? '' : 'Type', protoName: 'Type')
    ..aOS(5, _omitFieldNames ? '' : 'Description', protoName: 'Description')
    ..aOS(6, _omitFieldNames ? '' : 'Datetime', protoName: 'Datetime')
    ..aOS(7, _omitFieldNames ? '' : 'StartDatetime', protoName: 'StartDatetime')
    ..aOS(8, _omitFieldNames ? '' : 'EndDatetime', protoName: 'EndDatetime')
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
  UpdateOneActivity clone() => UpdateOneActivity()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateOneActivity copyWith(void Function(UpdateOneActivity) updates) => super.copyWith((message) => updates(message as UpdateOneActivity)) as UpdateOneActivity;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateOneActivity create() => UpdateOneActivity._();
  UpdateOneActivity createEmptyInstance() => create();
  static $pb.PbList<UpdateOneActivity> createRepeated() => $pb.PbList<UpdateOneActivity>();
  @$core.pragma('dart2js:noInline')
  static UpdateOneActivity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateOneActivity>(create);
  static UpdateOneActivity? _defaultInstance;

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
  $core.String get datetime => $_getSZ(5);
  @$pb.TagNumber(6)
  set datetime($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDatetime() => $_has(5);
  @$pb.TagNumber(6)
  void clearDatetime() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get startDatetime => $_getSZ(6);
  @$pb.TagNumber(7)
  set startDatetime($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStartDatetime() => $_has(6);
  @$pb.TagNumber(7)
  void clearStartDatetime() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get endDatetime => $_getSZ(7);
  @$pb.TagNumber(8)
  set endDatetime($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEndDatetime() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndDatetime() => clearField(8);

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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
