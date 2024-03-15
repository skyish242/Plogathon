import 'package:grpc/grpc.dart';
import 'package:plogathon/services/grpc/protobuf/empty.pb.dart';
import 'grpc/activity/activity.pbgrpc.dart';

class ActivityService {
  final ClientChannel channel;
  final ActivityServiceClient client;
  
  ActivityService(): channel = ClientChannel(
        '34.23.233.168',
        port: 5001,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      ),
      client = ActivityServiceClient(ClientChannel(
        '34.23.233.168',
        port: 5001,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  ));

  // Create Activity
  Future<ProtoActivity> createActivity(Activity request) async {
    try {  
      return await client.createActivity(request);
    } catch (e) {
      throw const GrpcError.internal('Failed to create activity');
    }
  }

  // Find all activities
  Future<Activities> findAllActivities() {
   try {
      return client.findAllActivities(Empty());
    } catch (e) {
      throw const GrpcError.internal('Failed to find all activities');
    }
  }

  // Find one activity by ID
  Future<ProtoActivity> findOneActivity(int activityID) async{
    try {
      OneActivity request = OneActivity()..activityID = activityID;
    
      return client.findOneActivity(request);
    } catch (e) {
      throw const GrpcError.internal('Failed to find one activity');
    }
  }
  
  // Update activity by ID
  Future<ProtoActivity> updateActivity(UpdateOneActivity payload) async {
     try {
      return client.updateActivity(payload);
    } catch (e) {
      throw const GrpcError.internal('Failed to update activity');
    }
  }

  // Delete activity by ID
  Future<Empty> deleteActivity(int activityID) {
    try {  
      OneActivity request = OneActivity()..activityID = activityID;

      return client.deleteActivity(request);
    } catch (e) {
      throw const GrpcError.internal('Failed to delete activity');
    }
  }
}

