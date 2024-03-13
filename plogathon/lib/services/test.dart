import 'package:plogathon/services/grpc/user/user.pb.dart';
import 'package:plogathon/services/userservice.dart';

void main() async {
  final userService = UserService();

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

  try {
    // final createdUser = await userService.createUser(newUser);
    // print('Created user: \n$createdUser');

    // final allUsers = await userService.findAllUsers();
    // print('$allUsers');

    // final updatedUser = await userService.updateUser(updateUser);
    // print('Updated user: \n$updatedUser');

    // await userService.deleteUser(7);

    // final oneUser = await userService.findOneUser(1);
    // print('One user: \n$oneUser');  
  } catch (e) {
    print('Error creating user: $e');
  }
}
