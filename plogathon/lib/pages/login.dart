import 'package:flutter/material.dart';
import 'package:plogathon/pages/home.dart';
import 'package:plogathon/pages/register.dart';
import 'package:plogathon/services/provider.dart';
import 'package:plogathon/services/stravaservice.dart';
import 'package:plogathon/services/userservice.dart';

// Strava
import 'dart:async';
import 'package:strava_client/strava_client.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _userService = UserService();
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController(text: "ishowmeat");
  final _passwordController = TextEditingController(text: "testest1");

  bool _enabledButtons = true;
  @override
  void initState() {
    super.initState();
  }

  FutureOr<Null> showErrorMessage(dynamic error, dynamic stackTrace) {
    if (error is Fault) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Did Receive Fault"),
              content: Text(
                  "Message: ${error.message}\n-----------------\nErrors:\n${(error.errors ?? []).map((e) => "Code: ${e.code}\nResource: ${e.resource}\nField: ${e.field}\n").toList().join("\n----------\n")}"),
            );
          });
    }
  }

  Future<void> _handleLogin() async {
    try {
      if (_usernameController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        throw ('Please fill in all fields');
      } else {
        setState(() {
          _enabledButtons = false;
        });

        int userID = await _userService.login(
            _usernameController.text, _passwordController.text);

        Provider().userId = userID;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (e) {
      setState(() {
        _enabledButtons = true;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title:
              const Text('Login Failed', style: TextStyle(color: Colors.white)),
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
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                  scrollDirection: Axis.vertical,
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
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 80.0),
                              child: Text(
                                "Welcome Back",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 64,
                              child: TextFormField(
                                controller: _usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
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
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 80.0),
                              child: SizedBox(
                                width: double.infinity,
                                height: 64,
                                child: TextFormField(
                                  controller: _passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
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
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 0,
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
                                  onPressed: _enabledButtons
                                      ? () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _handleLogin();
                                          }
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 5,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  child: Text(
                                    "Log in",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            ),
                            // Sign Up Button
                            SizedBox(
                              width: double.infinity,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: _enabledButtons
                                    ? () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterPage(),
                                          ),
                                        )
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: Text(
                                  "Don't Have An Account?",
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
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
