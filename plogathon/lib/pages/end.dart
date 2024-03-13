import 'package:flutter/material.dart';
import 'package:plogathon/pages/home.dart';

class EndPage extends StatefulWidget {
  const EndPage({Key key = const Key('defaultKey')}) : super(key: key);

  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.1,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                "assets/onboarding.gif",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 220),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Every step counts",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: const Color(0xFFEDFB92)),
                ),
                Text(
                  "Every Piece Picked Up,\nA Cleaner World Awaits.",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
                SizedBox(height: 40),
                Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Eco-effort",
                                  style: Theme.of(context).textTheme.bodySmall),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text("+10",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              )
                            ],
                          ),
                          const VerticalDivider(
                            width: 20,
                            thickness: 0.5,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Mileage",
                                  style: Theme.of(context).textTheme.bodySmall),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text("2.5km",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              )
                            ],
                          ),
                          const VerticalDivider(
                            width: 20,
                            thickness: 0.5,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Time",
                                  style: Theme.of(context).textTheme.bodySmall),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text("20:32",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLength: 200,
                              minLines: 5,
                              maxLines: 5,
                              cursorColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20.0),
                                counterStyle:
                                    Theme.of(context).textTheme.labelSmall,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xFFB3B3B3),
                                    ),
                                fillColor: const Color(0xFFEEEEEE),
                                filled: true,
                                hintText: 'Share Your Thoughts..',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "* Remember to Dispose Your Trash Appropriately",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Color(0xFFEDFB92)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (Route<dynamic> route) => false),
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Text("Upload",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
