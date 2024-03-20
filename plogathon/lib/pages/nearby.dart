import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plogathon/model/location.dart';
import 'package:plogathon/widgets/nearby_list_view.dart';
import 'package:plogathon/widgets/nearby_map_view.dart';
import 'dart:convert';

Map<String, dynamic> loadGeoJson(String binsJson) {
  return jsonDecode(binsJson);
}

List<Location> processBinsData(Map<String, dynamic> params) {
  final binsData = params['binsData'];
  final double currLat = params['currLat'];
  final double currLong = params['currLong'];
  final double minKm = params['minSearchRadius'];
  final double maxKm = params['maxSearchRadius'];
  const double walkingSpeedKmph = 4.5;

  List<Location> locations = [];

  RegExp regExp = RegExp(r'<th>ADDRESSSTREETNAME<\/th>\s*<td>([^<]+)<\/td>');

  binsData['features'].forEach((bin) {
    double lat = bin['geometry']['coordinates'][1];
    double long = bin['geometry']['coordinates'][0];
    String descriptionHtml = bin['properties']['Description'];

    Match? match = regExp.firstMatch(descriptionHtml);
    String locationName = match?.group(1) ?? 'Unknown Location';
    double distance = double.parse(
        (Geolocator.distanceBetween(currLat, currLong, lat, long) / 1000)
            .toStringAsFixed(2));
    double timeRequired =
        double.parse((distance / walkingSpeedKmph).toStringAsFixed(2));

    if (distance <= maxKm && distance >= minKm) {
      locations.add(Location(
        locationName: locationName,
        long: long,
        lat: lat,
        distance: distance,
        timeRequired: timeRequired,
      ));
    }
  });
  // Sort locations by distance
  locations.sort((a, b) => a.distance.compareTo(b.distance));
  return locations;
}

class NearbyPage extends StatefulWidget {
  final int userID;
  const NearbyPage({Key key = const Key('defaultKey'), required this.userID})
      : super(key: key);

  @override
  State<NearbyPage> createState() {
    return _NearbyPageState();
  }
}

class _NearbyPageState extends State<NearbyPage> {
  final List<Location> _locations = [];
  final _minRadiusController = TextEditingController(text: "5");
  final _maxRadiusController = TextEditingController(text: "6");

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
    setState(() {
      _locations.clear();
      _noBinsMessage = null;
    });

    if (double.parse(_minRadiusController.text) >
        double.parse(_maxRadiusController.text)) {
      setState(() {
        _noBinsMessage =
            "Ensure that your maximum search radius is lower than your minimum search radius!";
      });
      return;
    }

    Position userCurrentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String binsJson = await DefaultAssetBundle.of(context)
        .loadString('assets/RecyclingBins.geojson');

    final Map<String, dynamic> binsData = await compute(loadGeoJson, binsJson);

    final params = {
      'binsData': binsData,
      'currLat': userCurrentPosition.latitude,
      'currLong': userCurrentPosition.longitude,
      'minSearchRadius': double.parse(_minRadiusController.text),
      'maxSearchRadius': double.parse(_maxRadiusController.text),
    };

    final List<Location> locations = await compute(processBinsData, params);

    setState(() {
      _locations.addAll(locations);
      _noBinsMessage = locations.isEmpty
          ? 'There are no available bins within your current location'
          : '';
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
                Container(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text("Min Radius: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _minRadiusController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4),
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^[0-9]+.?[0-9]*'))
                                    ],
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    cursorColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 0),
                                      suffixText: "km",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: const Color(0xFFB3B3B3),
                                          ),
                                      fillColor: const Color(0xFFEEEEEE),
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
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text("Max Radius: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _maxRadiusController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(4),
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'^[0-9]+.?[0-9]*'))
                                    ],
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    cursorColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 0),
                                      suffixText: "km",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: const Color(0xFFB3B3B3),
                                          ),
                                      fillColor: const Color(0xFFEEEEEE),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          await _fetchNearbyBins();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text("Update",
                            style: Theme.of(context).textTheme.bodyMedium),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 145,
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
                      width: 145,
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
                          padding: const EdgeInsets.only(left: 32, right: 32),
                          child: Text(
                            _noBinsMessage!,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()))
              : const Center(
                  child: Text('Location services are disabled.'),
                ),
        ],
      ),
    );
  }
}
