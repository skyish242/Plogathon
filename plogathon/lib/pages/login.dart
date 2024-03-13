import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plogathon/pages/home.dart';
import 'package:plogathon/pages/register.dart';
import 'package:plogathon/services/userservice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key = const Key('defaultKey')}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userService = UserService();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
        child: Stack(fit: StackFit.expand, children: <Widget>[
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
                            padding: const EdgeInsets.only(bottom: 80.0),
                            child: Text(
                              "Welcome Back",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
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
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 80.0),
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
                                        color: Color(0xFFB3B3B3),
                                      ),
                                  fillColor: Color(0xFFEEEEEE),
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
                          // Login Button 
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: _handleLogin,
                                // onPressed: () => Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const HomePage())),
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                child: Text("Log in",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ),
                            ),
                          ),
                          // Sign Up Button 
                          SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage())),
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
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
                    )),
              )
            ],
          )
        ]));
  }
  Future<void> _handleLogin() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    try {
      int userID = await _userService.login(username, password);
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      // Handle login failure
      print('Login failed: $e');
    }
  }
}
