import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plogathon/model/location.dart';
import 'package:plogathon/widgets/nearbyListView.dart';
import 'package:plogathon/widgets/nearbyMapView.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage({Key key = const Key('defaultKey')}) : super(key: key);

  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  final List<Location> _locations = [
    Location(
        locationName: "Bedok North Road", long: 1.0, lat: 2.0, distance: 2.5),
    Location(
        locationName: "Upper Changi Road", long: 4.0, lat: 5.0, distance: 3.5),
    Location(locationName: "Kembangan", long: 4.0, lat: 5.0, distance: 4.0),
    Location(locationName: "Eunos", long: 4.0, lat: 5.0, distance: 6.2),
    Location(locationName: "Paya Lebar", long: 4.0, lat: 5.0, distance: 7.9),
    Location(locationName: "Aljunied", long: 4.0, lat: 5.0, distance: 8.9),
  ];
  bool _listView = true;

  void setListView(bool state) {
    setState(() {
      _listView = state;
    });
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
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: SvgPicture.asset("assets/back.svg",
                            semanticsLabel: 'Navigate Back'),
                        onPressed: () => Navigator.pop(context)),
                    const SizedBox(
                      width: 14,
                    ),
                    Text(
                      "Nearest Bins",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    )
                  ],
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () => setListView(true),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          _listView
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.white,
                        )),
                        child: Text(
                          "List View",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                color: _listView
                                    ? Theme.of(context).colorScheme.onSecondary
                                    : Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () => setListView(false),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          _listView
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary,
                        )),
                        child: Text(
                          "Map View",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                color: _listView
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          _listView
              ? NearbyListView(locationData: _locations)
              : NearbyMapView(locationData: _locations)
        ],
      ),
    );
  }
}
