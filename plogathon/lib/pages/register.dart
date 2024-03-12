import 'package:flutter/material.dart';
import 'package:plogathon/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key = const Key('defaultKey')}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.background,
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 100),
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
                              "Join The Team",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: TextField(
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
                                hintText: 'Name',
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
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 64,
                              child: TextField(
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 36.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 64,
                              child: TextField(
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
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage())),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor,
                                )),
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
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage())),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).colorScheme.secondary)),
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
                    )),
              )
            ],
          )
        ]));
  }
}
