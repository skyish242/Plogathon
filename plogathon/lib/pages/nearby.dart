import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plogathon/model/location.dart';
import 'package:plogathon/widgets/nearby_list_view.dart';
import 'package:plogathon/widgets/nearby_map_view.dart';
import 'dart:convert';

class NearbyPage extends StatefulWidget {
  const NearbyPage({Key key = const Key('defaultKey')}) : super(key: key);

  @override
  _NearbyPageState createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  final List<Location> _locations = [];
  bool _listView = true;
  bool _locationServiceEnabled = false;
  String? _noBinsMessage;

  void setListView(bool state) {
    setState(() {
      _listView = state;
    });
  }

  //Check for permission
  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    bool permissionGranted = await _requestLocationPermission();

    setState(() {
      _locationServiceEnabled = serviceEnabled && permissionGranted;
    });

    if (serviceEnabled && permissionGranted) {
      _fetchNearbyBins();
    }
  }

  Future<bool> _requestLocationPermission() async {
    final permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<void> _fetchNearbyBins() async {
    Position userCurrentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String binsJson = await DefaultAssetBundle.of(context)
        .loadString('assets/CashForTrashGEOJSON.geojson');
    Map<String, dynamic> binsData = jsonDecode(binsJson);
    bool binsFound = false;
    const double walkingSpeedKmph = 4.5;


    binsData['features'].forEach((bin) {
      double lat = bin['geometry']['coordinates'][1];
      double long = bin['geometry']['coordinates'][0];
      String descriptionHtml = bin['properties']['Description'];
      RegExp regExp =
          RegExp(r'<th>ADDRESSSTREETNAME<\/th>\s*<td>([^<]+)<\/td>');
      Match? match = regExp.firstMatch(descriptionHtml);
      String locationName = match?.group(1) ?? 'Unknown Location';
      double distance = double.parse((Geolocator.distanceBetween(
                  userCurrentPosition.latitude,
                  userCurrentPosition.longitude,
                  lat,
                  long) /
              1000)
          .toStringAsFixed(2));
      //in hours
      double timeRequired = double.parse((distance/walkingSpeedKmph).toStringAsFixed(2));

      print('Location: $locationName, Latitude: $lat, Longitude: $long, Distance: $distance, TimeRequired:$timeRequired');
      print('User location: $userCurrentPosition');

      if (distance <= 2) {
        setState(() {
          _locations.add(Location(
              locationName: locationName,
              long: long,
              lat: lat,
              distance: distance,
              timeRequired: timeRequired,));
        });
        binsFound = true;
      }
    });
    if (!binsFound) {
    setState(() {
      _noBinsMessage = 'There are no availabl bins within your current location';
    });
  }
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
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: _listView
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.white,
                        ),
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
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor: _listView
                              ? Colors.white
                              : Theme.of(context).colorScheme.secondary,
                        ),
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
        _locationServiceEnabled
            ? (_locations.isNotEmpty
                ? _listView
                    ? NearbyListView(locationData: _locations)
                    : NearbyMapView(locationData: _locations)
                : _noBinsMessage != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _noBinsMessage!,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : Center(child: CircularProgressIndicator()))
            : Center(
                child: Text('Location services are disabled.'),
              ),
      ],
    ),
  );
  }
}