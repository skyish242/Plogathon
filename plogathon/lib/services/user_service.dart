import 'package:grpc/grpc.dart';
import 'package:plogathon/services/grpc/protobuf/empty.pb.dart';
import 'grpc/user/user.pbgrpc.dart';

class UserService {
  final ClientChannel channel;
  final UserServiceClient client;

  UserService()
      : channel = ClientChannel(
          'http://34.149.243.172/user',
          options:
              const ChannelOptions(credentials: ChannelCredentials.insecure()),
        ),
        client = UserServiceClient(ClientChannel(
          'http://34.149.243.172/user',
          options:
              const ChannelOptions(credentials: ChannelCredentials.insecure()),
        ));

  // Create User
  Future<ProtoUser> createUser(User request) async {
    try {
      return await client.createUser(request);
    } catch (e) {
      print(e);
      if (e.toString().contains('INTERNAL')) {
        throw 'Username or email already exists!';
      } else {
        throw const GrpcError.internal('Failed to create user');
      }
    }
  }

  // Find all users
  Future<Users> findAllUsers() {
    try {
      return client.findAllUsers(Empty());
    } catch (e) {
      throw const GrpcError.internal('Failed to find all users');
    }
  }

  // Find one user by ID
  Future<ProtoUser> findOneUser(int userID) {
    try {
      OneUser request = OneUser()..userID = userID;

      return client.findOneUser(request);
    } catch (e) {
      throw const GrpcError.internal('Failed to find one user');
    }
  }

  // Update user by ID
  Future<ProtoUser> updateUser(UpdateOneUser payload) {
    try {
      return client.updateUser(payload);
    } catch (e) {
      throw const GrpcError.internal('Failed to update user');
    }
  }

  // Delete user by ID
  Future<Empty> deleteUser(int userID) {
    try {
      OneUser request = OneUser()..userID = userID;

      return client.deleteUser(request);
    } catch (e) {
      throw const GrpcError.internal('Failed to delete user');
    }
  }

  // Login user
  Future<int> login(String username, String password) async {
    try {
      final request = LoginRequest()
        ..username = username
        ..password = password;

      OneUser response = await client.login(request);

      return response.userID;
    } catch (e) {
      if (e.toString().contains('NOT_FOUND')) {
        throw 'Invalid user or password!';
      } else {
        throw const GrpcError.internal('Failed to login user');
      }
    }
  }
}
