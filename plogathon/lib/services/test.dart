import 'package:plogathon/services/grpc/user/user.pb.dart';
import 'package:plogathon/services/grpc/activity/activity.pb.dart';
import 'package:plogathon/services/userservice.dart';
import 'package:plogathon/services/activityservice.dart';

void main() async {
  final userService = UserService();
  final activityService = ActivityService();

  String dateTimeToString(DateTime dateTime) {
    return dateTime.toUtc().toIso8601String();
  }

  final newUser = User(
    username: 'iShowMeat1',
    firstName: 'Darren1',
    lastName: 'Watkins1',
    email: 'ishow@meat.com',
    stravaEmail: 'ishow@meat.com',
    password: 'Testest1',
  );

  final updateUser = UpdateOneUser
  (
    userID: 9,
    username: 'iShowMeat',
    firstName: 'Darren',
    lastName: 'Watkins',
    email: 'ishow@meat.com',
    stravaEmail: 'ishow@meat.com',
    password: 'Testest1',
  );

  final newActivity = Activity(
    userID: 1,
    name: 'Jogging',
    type: 'Outdoor',
    description: 'Morning jog',
    datetime: dateTimeToString(DateTime.now()),
    routeMap: 'encoded_polyline_data',
    distance: 5.0,
    steps: 10000,
    wasteCount: 2,
    duration: 1800,
  );

  final updateActivity = UpdateOneActivity(
    activityID: 4,
    userID: 1,
    name: 'Sprinting',
    type: 'Outdoor',
    description: 'Morning run',
    datetime: dateTimeToString(DateTime.now()),
    routeMap: 'encoded_polyline_data',
    distance: 10.0,
    steps: 50000,
    wasteCount: 10,
    duration: 3600,
  );

  try {
    /*************/
    /* USER CRUD */
    /*************/
    // final createdUser = await userService.createUser(newUser);
    // print('Created user: \n$createdUser');

    // final allUsers = await userService.findAllUsers();
    // print('$allUsers');

    // final updatedUser = await userService.updateUser(updateUser);
    // print('Updated user: \n$updatedUser');

    // await userService.deleteUser(7);

    // final oneUser = await userService.findOneUser(1);
    // print('One user: \n$oneUser');  

    // final response = await userService.login('iShowMeat', 'Testest1');
    // print('Response: $response');  

    /*****************/
    /* ACTIVITY CRUD */
    /*****************/
    // final createdActivity = await activityService.createActivity(newActivity);
    // print('Activity created: \n$createdActivity');

    // final fetchedActivity1 = await activityService.findAllActivities();
    // print('Fetched activity: \n$fetchedActivity1');

    // final updatedActivity = await activityService.updateActivity(updateActivity);
    // print('Updated activity: \n$updatedActivity');

    // final fetchedActivity2 = await activityService.findOneActivity(4);
    // print('Fetched activity: \n$fetchedActivity2');

    // await activityService.deleteActivity(4);
    // print('Activity deleted');
  } catch (e) {
    print('Error: $e');
  }
}
