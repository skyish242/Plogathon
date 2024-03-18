import 'package:flutter/material.dart';
import 'package:plogathon/pages/login.dart';
import 'package:plogathon/services/user_service.dart';
import 'package:plogathon/services/grpc/user/user.pb.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key = const Key('defaultKey')}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _userService = UserService();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _handleRegister() async {
    try {
      if (_firstnameController.text.isEmpty ||
          _lastnameController.text.isEmpty ||
          _usernameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        throw ('Please fill in all fields');
      } else if (!_isValidEmail(_emailController.text)) {
        throw ('Please enter a valid email address');
      } else {
        User request = User()
          ..firstName = _firstnameController.text
          ..lastName = _lastnameController.text
          ..username = _usernameController.text
          ..email = _emailController.text
          ..password = _passwordController.text;

        await _userService.createUser(request);

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('User created!',
                style: TextStyle(color: Colors.white)),
            content: const Text('Your account has been successfully created.',
                style: TextStyle(color: Colors.white)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Registration Failed',
              style: TextStyle(color: Colors.white)),
          content:
              Text(e.toString(), style: const TextStyle(color: Colors.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 50.0, right: 50.0, top: 100, bottom: 40),
                child: Text(
                  "PLOGATHON",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(36),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Text(
                            "Join The Team",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        // First name
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: TextField(
                              controller: _firstnameController,
                              cursorColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xFFB3B3B3),
                                    ),
                                fillColor: const Color(0xFFEEEEEE),
                                filled: true,
                                hintText: 'First name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Last name
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: TextField(
                              controller: _lastnameController,
                              cursorColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xFFB3B3B3),
                                    ),
                                fillColor: const Color(0xFFEEEEEE),
                                filled: true,
                                hintText: 'Last name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Username
                        SizedBox(
                          width: double.infinity,
                          height: 64,
                          child: TextField(
                            controller: _usernameController,
                            cursorColor:
                                Theme.of(context).colorScheme.onPrimary,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: InputDecoration(
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: const Color(0xFFB3B3B3),
                                  ),
                              fillColor: const Color(0xFFEEEEEE),
                              filled: true,
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Email
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: TextField(
                              controller: _emailController,
                              cursorColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xFFB3B3B3),
                                    ),
                                fillColor: const Color(0xFFEEEEEE),
                                filled: true,
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Password
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: TextField(
                              controller: _passwordController,
                              cursorColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              style: Theme.of(context).textTheme.bodyMedium,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xFFB3B3B3),
                                    ),
                                fillColor: const Color(0xFFEEEEEE),
                                filled: true,
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: _handleRegister,
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              child: Text("Register",
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary),
                            child: Text(
                              "Already Have An Account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: const Color(0xFFFCFCFC),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
