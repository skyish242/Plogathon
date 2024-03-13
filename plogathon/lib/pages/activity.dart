import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plogathon/pages/end.dart';

class ActivityPage extends StatefulWidget {
  final double destLongitude;
  final double destLatitude;
  final String destName;

  const ActivityPage({
    Key key = const Key('defaultKey'),
    required this.destLongitude,
    required this.destLatitude,
    required this.destName,
  }) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  void initState() {
    super.initState();
    double longitude = widget.destLongitude;
    double latitude = widget.destLatitude;
    String name = widget.destName;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 32, right: 32, top: 64, bottom: 20),
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: SvgPicture.asset("assets/back.svg",
                        semanticsLabel: 'Navigate Back'),
                    onPressed: () => Navigator.pop(context)),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  "Plogging",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(children: [
              const GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: LatLng(1.3521, 103.8198), zoom: 11),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 32, right: 32),
                child: Column(
                  children: [
                    Card(
                        margin: const EdgeInsets.only(
                            left: 0, right: 0, bottom: 12),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 20, bottom: 20, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.destName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          )),
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/navigation.svg",
                                          semanticsLabel: 'Navigation'),
                                      Text("2.2km left",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset("assets/time.svg",
                                          semanticsLabel: 'Navigation'),
                                      Text(" 1 min 32 sec",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Eco-effort",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: const Color(0xFF747474),
                                          )),
                                  Text("2",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge)
                                ],
                              )
                            ],
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                              onPressed: () => (/** Open camera */),
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              child: Text("Take Picture",
                                  style:
                                      Theme.of(context).textTheme.labelLarge)),
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  actionsAlignment: MainAxisAlignment.center,
                                  contentPadding: const EdgeInsets.only(
                                      top: 30.0, bottom: 24.0),
                                  backgroundColor: Colors.white,
                                  content: Text(
                                    "End the Session?",
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    SizedBox(
                                      width: 118,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          elevation: 5,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Resume",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 118,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          elevation: 5,
                                        ),
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const EndPage(),
                                          ),
                                        ),
                                        child: Text("End",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                    color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                            child: Text(
                              "End",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
