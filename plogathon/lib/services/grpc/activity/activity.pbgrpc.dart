//
//  Generated code. Do not modify.
//  source: activity.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../protobuf/empty.pb.dart' as $1;
import 'activity.pb.dart' as $0;

export 'activity.pb.dart';

@$pb.GrpcServiceName('activity.ActivityService')
class ActivityServiceClient extends $grpc.Client {
  static final _$createActivity = $grpc.ClientMethod<$0.Activity, $0.ProtoActivity>(
      '/activity.ActivityService/CreateActivity',
      ($0.Activity value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProtoActivity.fromBuffer(value));
  static final _$findAllActivities = $grpc.ClientMethod<$1.Empty, $0.Activities>(
      '/activity.ActivityService/FindAllActivities',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Activities.fromBuffer(value));
  static final _$findOneActivity = $grpc.ClientMethod<$0.OneActivity, $0.ProtoActivity>(
      '/activity.ActivityService/FindOneActivity',
      ($0.OneActivity value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProtoActivity.fromBuffer(value));
  static final _$updateActivity = $grpc.ClientMethod<$0.UpdateOneActivity, $0.ProtoActivity>(
      '/activity.ActivityService/UpdateActivity',
      ($0.UpdateOneActivity value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProtoActivity.fromBuffer(value));
  static final _$deleteActivity = $grpc.ClientMethod<$0.OneActivity, $1.Empty>(
      '/activity.ActivityService/DeleteActivity',
      ($0.OneActivity value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  ActivityServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ProtoActivity> createActivity($0.Activity request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createActivity, request, options: options);
  }

  $grpc.ResponseFuture<$0.Activities> findAllActivities($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findAllActivities, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProtoActivity> findOneActivity($0.OneActivity request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findOneActivity, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProtoActivity> updateActivity($0.UpdateOneActivity request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateActivity, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteActivity($0.OneActivity request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteActivity, request, options: options);
  }
}

@$pb.GrpcServiceName('activity.ActivityService')
abstract class ActivityServiceBase extends $grpc.Service {
  $core.String get $name => 'activity.ActivityService';

  ActivityServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Activity, $0.ProtoActivity>(
        'CreateActivity',
        createActivity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Activity.fromBuffer(value),
        ($0.ProtoActivity value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Activities>(
        'FindAllActivities',
        findAllActivities_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Activities value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OneActivity, $0.ProtoActivity>(
        'FindOneActivity',
        findOneActivity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OneActivity.fromBuffer(value),
        ($0.ProtoActivity value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateOneActivity, $0.ProtoActivity>(
        'UpdateActivity',
        updateActivity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateOneActivity.fromBuffer(value),
        ($0.ProtoActivity value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OneActivity, $1.Empty>(
        'DeleteActivity',
        deleteActivity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OneActivity.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.ProtoActivity> createActivity_Pre($grpc.ServiceCall call, $async.Future<$0.Activity> request) async {
    return createActivity(call, await request);
  }

  $async.Future<$0.Activities> findAllActivities_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return findAllActivities(call, await request);
  }

  $async.Future<$0.ProtoActivity> findOneActivity_Pre($grpc.ServiceCall call, $async.Future<$0.OneActivity> request) async {
    return findOneActivity(call, await request);
  }

  $async.Future<$0.ProtoActivity> updateActivity_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateOneActivity> request) async {
    return updateActivity(call, await request);
  }

  $async.Future<$1.Empty> deleteActivity_Pre($grpc.ServiceCall call, $async.Future<$0.OneActivity> request) async {
    return deleteActivity(call, await request);
  }

  $async.Future<$0.ProtoActivity> createActivity($grpc.ServiceCall call, $0.Activity request);
  $async.Future<$0.Activities> findAllActivities($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.ProtoActivity> findOneActivity($grpc.ServiceCall call, $0.OneActivity request);
  $async.Future<$0.ProtoActivity> updateActivity($grpc.ServiceCall call, $0.UpdateOneActivity request);
  $async.Future<$1.Empty> deleteActivity($grpc.ServiceCall call, $0.OneActivity request);
}
