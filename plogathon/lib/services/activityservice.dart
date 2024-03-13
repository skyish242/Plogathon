import 'grpc/activity/activity.pbgrpc.dart';
import '../../config.dart';

class ActivityService extends ActivityServiceBase {
  @override
  Future<Activity> createActivity(ServiceCall call, Activity request) {
    // TODO: implement createActivity
    throw UnimplementedError();
  }

  @override
  Future<ActivityList> getAllActivities(ServiceCall call, Empty request) {
    throw UnimplementedError();
  }

  @override
  Future<Empty> deleteActivity(ServiceCall call, DeleteActivityRequest request) {
    // TODO: implement deleteActivity
    throw UnimplementedError();
  }

  @override
  Future<Activity> getActivityById(ServiceCall call, GetActivityRequest request) {
    // TODO: implement getActivityById
    throw UnimplementedError();
  }

  @override
  Future<Activity> updateActivity(ServiceCall call, Activity request) {
    // TODO: implement updateActivity
    throw UnimplementedError();
  }
}

void main() async {
  final client = ActivityServiceClient(DatabaseConfig.host, DatabaseConfig.port);

  final newActivity = Activity()
    ..activityID = 1
    ..userID = 1
    ..name = 'Running'
    ..type = 'Outdoor'
    ..description = 'Morning jog'
    ..datetime = DateTime.now().toUtc().toProto3Timestamp()
    ..startDatetime = DateTime.now().toUtc().toProto3Timestamp()
    ..endDatetime = DateTime.now().add(Duration(hours: 1)).toUtc().toProto3Timestamp()
    ..routeMap = 'encoded_polyline_data'
    ..distance = 5.0
    ..steps = 10000
    ..wasteCount = 2;

  try {
    final createdActivity = await client.createActivity(newActivity);
    print('Activity created: $createdActivity');

    final fetchedActivity = await client.getActivityById(1);
    print('Fetched activity: $fetchedActivity');

    final updatedActivity = await client.updateActivity(createdActivity);
    print('Updated activity: $updatedActivity');

    await client.deleteActivity(updatedActivity.activityID);
    print('Activity deleted');
  } finally {
    await client.close();
  }
}
