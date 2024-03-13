//
//  Generated code. Do not modify.
//  source: user.proto
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
import 'user.pb.dart' as $0;

export 'user.pb.dart';

@$pb.GrpcServiceName('user.UserService')
class UserServiceClient extends $grpc.Client {
  static final _$createUser = $grpc.ClientMethod<$0.User, $0.ProtoUser>(
      '/user.UserService/CreateUser',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProtoUser.fromBuffer(value));
  static final _$findAllUsers = $grpc.ClientMethod<$1.Empty, $0.Users>(
      '/user.UserService/FindAllUsers',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Users.fromBuffer(value));
  static final _$findOneUser = $grpc.ClientMethod<$0.OneUser, $0.ProtoUser>(
      '/user.UserService/FindOneUser',
      ($0.OneUser value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProtoUser.fromBuffer(value));
  static final _$updateUser = $grpc.ClientMethod<$0.UpdateOneUser, $0.ProtoUser>(
      '/user.UserService/UpdateUser',
      ($0.UpdateOneUser value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProtoUser.fromBuffer(value));
  static final _$deleteUser = $grpc.ClientMethod<$0.OneUser, $1.Empty>(
      '/user.UserService/DeleteUser',
      ($0.OneUser value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.OneUser>(
      '/user.UserService/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.OneUser.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ProtoUser> createUser($0.User request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.Users> findAllUsers($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findAllUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProtoUser> findOneUser($0.OneUser request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findOneUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProtoUser> updateUser($0.UpdateOneUser request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteUser($0.OneUser request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.OneUser> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }
}

@$pb.GrpcServiceName('user.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'user.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $0.ProtoUser>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.ProtoUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Users>(
        'FindAllUsers',
        findAllUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Users value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OneUser, $0.ProtoUser>(
        'FindOneUser',
        findOneUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OneUser.fromBuffer(value),
        ($0.ProtoUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateOneUser, $0.ProtoUser>(
        'UpdateUser',
        updateUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateOneUser.fromBuffer(value),
        ($0.ProtoUser value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.OneUser, $1.Empty>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.OneUser.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.OneUser>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.OneUser value) => value.writeToBuffer()));
  }

  $async.Future<$0.ProtoUser> createUser_Pre($grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return createUser(call, await request);
  }

  $async.Future<$0.Users> findAllUsers_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return findAllUsers(call, await request);
  }

  $async.Future<$0.ProtoUser> findOneUser_Pre($grpc.ServiceCall call, $async.Future<$0.OneUser> request) async {
    return findOneUser(call, await request);
  }

  $async.Future<$0.ProtoUser> updateUser_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateOneUser> request) async {
    return updateUser(call, await request);
  }

  $async.Future<$1.Empty> deleteUser_Pre($grpc.ServiceCall call, $async.Future<$0.OneUser> request) async {
    return deleteUser(call, await request);
  }

  $async.Future<$0.OneUser> login_Pre($grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.ProtoUser> createUser($grpc.ServiceCall call, $0.User request);
  $async.Future<$0.Users> findAllUsers($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.ProtoUser> findOneUser($grpc.ServiceCall call, $0.OneUser request);
  $async.Future<$0.ProtoUser> updateUser($grpc.ServiceCall call, $0.UpdateOneUser request);
  $async.Future<$1.Empty> deleteUser($grpc.ServiceCall call, $0.OneUser request);
  $async.Future<$0.OneUser> login($grpc.ServiceCall call, $0.LoginRequest request);
}
