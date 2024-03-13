import 'package:flutter/material.dart';
import 'package:plogathon/pages/login.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key key = const Key('defaultKey')}) : super(key: key);
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                "assets/onboarding.gif",
                fit: BoxFit.cover,
              ),
            )),
        Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "PLOGATHON",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                "Step Into A Cleaner World, \nOne Stride At A Time.",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100.0, top: 80.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage())),
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Theme.of(context)
                          .primaryColor, // Use the primary color from the theme
                    ),
                    child: Text("Get Started",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
