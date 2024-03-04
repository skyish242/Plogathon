//
//  Generated code. Do not modify.
//  source: activity/activity.proto
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

import '../google/protobuf/empty.pb.dart' as $1;
import 'activity.pb.dart' as $0;

export 'activity.pb.dart';

@$pb.GrpcServiceName('ActivityService')
class ActivityServiceClient extends $grpc.Client {
  static final _$createActivity = $grpc.ClientMethod<$0.Activity, $0.Activity>(
      '/ActivityService/CreateActivity',
      ($0.Activity value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Activity.fromBuffer(value));
  static final _$getActivityById = $grpc.ClientMethod<$0.GetActivityRequest, $0.Activity>(
      '/ActivityService/GetActivityById',
      ($0.GetActivityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Activity.fromBuffer(value));
  static final _$updateActivity = $grpc.ClientMethod<$0.Activity, $0.Activity>(
      '/ActivityService/UpdateActivity',
      ($0.Activity value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Activity.fromBuffer(value));
  static final _$deleteActivity = $grpc.ClientMethod<$0.DeleteActivityRequest, $1.Empty>(
      '/ActivityService/DeleteActivity',
      ($0.DeleteActivityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  ActivityServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Activity> createActivity($0.Activity request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createActivity, request, options: options);
  }

  $grpc.ResponseFuture<$0.Activity> getActivityById($0.GetActivityRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getActivityById, request, options: options);
  }

  $grpc.ResponseFuture<$0.Activity> updateActivity($0.Activity request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateActivity, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteActivity($0.DeleteActivityRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteActivity, request, options: options);
  }
}

@$pb.GrpcServiceName('ActivityService')
abstract class ActivityServiceBase extends $grpc.Service {
  $core.String get $name => 'ActivityService';

  ActivityServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Activity, $0.Activity>(
        'CreateActivity',
        createActivity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Activity.fromBuffer(value),
        ($0.Activity value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetActivityRequest, $0.Activity>(
        'GetActivityById',
        getActivityById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetActivityRequest.fromBuffer(value),
        ($0.Activity value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Activity, $0.Activity>(
        'UpdateActivity',
        updateActivity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Activity.fromBuffer(value),
        ($0.Activity value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteActivityRequest, $1.Empty>(
        'DeleteActivity',
        deleteActivity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteActivityRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.Activity> createActivity_Pre($grpc.ServiceCall call, $async.Future<$0.Activity> request) async {
    return createActivity(call, await request);
  }

  $async.Future<$0.Activity> getActivityById_Pre($grpc.ServiceCall call, $async.Future<$0.GetActivityRequest> request) async {
    return getActivityById(call, await request);
  }

  $async.Future<$0.Activity> updateActivity_Pre($grpc.ServiceCall call, $async.Future<$0.Activity> request) async {
    return updateActivity(call, await request);
  }

  $async.Future<$1.Empty> deleteActivity_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteActivityRequest> request) async {
    return deleteActivity(call, await request);
  }

  $async.Future<$0.Activity> createActivity($grpc.ServiceCall call, $0.Activity request);
  $async.Future<$0.Activity> getActivityById($grpc.ServiceCall call, $0.GetActivityRequest request);
  $async.Future<$0.Activity> updateActivity($grpc.ServiceCall call, $0.Activity request);
  $async.Future<$1.Empty> deleteActivity($grpc.ServiceCall call, $0.DeleteActivityRequest request);
}
