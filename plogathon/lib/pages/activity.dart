import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pedometer/pedometer.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:plogathon/pages/camera.dart';
import 'package:plogathon/pages/end.dart';
import 'package:plogathon/widgets/end_session_dialog.dart';
import 'package:plogathon/widgets/non_recylable_dialog.dart';
import 'package:plogathon/widgets/recylable_dialog.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:convert';

class ActivityPage extends StatefulWidget {
  final double destLongitude;
  final double destLatitude;
  final String destName;
  final double destTime;
  final double distance;

  const ActivityPage({
    Key key = const Key('defaultKey'),
    required this.destLongitude,
    required this.destLatitude,
    required this.destName,
    required this.destTime,
    required this.distance,
  }) : super(key: key);

  @override
  State<ActivityPage> createState() {
    return _ActivityPageState();
  }
}

class _ActivityPageState extends State<ActivityPage> {
  // ignore: constant_identifier_names
  static const API_KEY =
      String.fromEnvironment('MAPS_API_KEY', defaultValue: '');

  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final DateTime startDateTime = DateTime.now();

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  StreamSubscription<LocationData>? _locationSubscription;
  int? _initialSteps;

  int _wasteCount = 0;
  int _holdingCount = 0;
  bool _nearBin = false;
  bool _initialLoad = false;
  double _distanceLeft = 0;
  double _distanceTravelled = 0;
  int _time = 0;
  int _latestSteps = 0;
  String _displayedSteps = "0";

  //Direction Service Variables:
  final Location _locationController = Location();
  final Map<PolylineId, Polyline> _polylines = {};
  final Map<MarkerId, Marker> _markers = {};
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  LatLng? _currentPosition;
  LatLng? _lastPosition;
  List<LatLng> _waypoints = [];

  @override
  void initState() {
    super.initState();

    _distanceLeft = widget.distance;
    initPlatformState();
    _getLocationUpdates();
  }

  Future<void> openCamera(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();

    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    if (context.mounted) {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CameraPage(camera: firstCamera),
        ),
      );
      if (context.mounted) {
        if (result['recylable']) {
          bool reroute = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return RecylableDialog(
                  instruction: result['instruction'],
                  nearBinShown: _waypoints.isNotEmpty);
            },
          );
          setState(() {
            _holdingCount++;
          });

          if (reroute) {
            //Find nearest bin (find current pos then read json then search compare dist then return nearest coords)
            //1) Current Position
            geolocator.Position userCurrentPosition =
                await geolocator.Geolocator.getCurrentPosition(
                    desiredAccuracy: geolocator.LocationAccuracy.high);
            //2)Load JSON
            String binsJson = await DefaultAssetBundle.of(context)
                .loadString('assets/CashForTrashGEOJSON.geojson');
            Map<String, dynamic> binsData = jsonDecode(binsJson);
            //3) Search thru json and compare
            double minDistance = double.infinity;
            Map<String, dynamic>? closestBin;
            String closestBinLocationName = 'Unknown Location';
            for (var bin in binsData['features']) {
              var binLocation = bin['geometry']['coordinates'];
              double distance = double.parse(
                  (geolocator.Geolocator.distanceBetween(
                              userCurrentPosition.latitude,
                              userCurrentPosition.longitude,
                              binLocation[1],
                              binLocation[0]) /
                          1000)
                      .toStringAsFixed(2));
              if (distance < minDistance) {
                minDistance = distance;
                closestBin = bin;
                String descriptionHtml = bin['properties']['Description'];
                RegExp regExp =
                    RegExp(r'<th>ADDRESSSTREETNAME<\/th>\s*<td>([^<]+)<\/td>');
                Match? match = regExp.firstMatch(descriptionHtml);
                closestBinLocationName = match?.group(1) ?? 'Unknown Location';
              }
            }
            if (closestBin != null) {
              LatLng nearestBinCoords = LatLng(
                  closestBin['geometry']['coordinates'][1],
                  closestBin['geometry']['coordinates'][0]);
              Map<String, dynamic> nearestBinData = {
                'closestBinLocationName': closestBinLocationName,
                'distance': minDistance,
                'coordinates': nearestBinCoords
              };
              print('Nearest Bin Coords!!!: $nearestBinCoords');
              print(nearestBinData);
              setState(() {
                _waypoints.add(nearestBinCoords);
                _markers[const MarkerId('nearestBin')] = Marker(
                  markerId: const MarkerId('nearestBin'),
                  position: nearestBinCoords,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue),
                  infoWindow: InfoWindow(
                      title: nearestBinData['closestBinLocationName'],
                      snippet: '${nearestBinData['distance']} km away'),
                );
              });
              print('distance before updating: $_distanceLeft');
              // Update distance left
              updateDistanceLeft(
                  LatLng(userCurrentPosition.latitude,
                      userCurrentPosition.longitude),
                  nearestBinCoords,
                  LatLng(widget.destLatitude, widget.destLongitude));
            }
          }
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const NonRecylableDialog();
            },
          );
        }
      }
    }
  }

  //when user adds a waypoint this function is invoked to update the new distance left.
  void updateDistanceLeft(
      LatLng currentPos, LatLng newWaypoint, LatLng finalDest) {
    // Current Location to WP
    double toWaypointDistance = geolocator.Geolocator.distanceBetween(
          currentPos.latitude,
          currentPos.longitude,
          newWaypoint.latitude,
          newWaypoint.longitude,
        ) /
        1000;

    // WP to final dest
    double toFinalDestDistance = geolocator.Geolocator.distanceBetween(
          newWaypoint.latitude,
          newWaypoint.longitude,
          finalDest.latitude,
          finalDest.longitude,
        ) /
        1000;
    print('to waypoint dest: $toWaypointDistance');
    print('to final dest:$toFinalDestDistance');

    setState(() {
      _distanceLeft = double.parse(
          (toWaypointDistance + toFinalDestDistance).toStringAsFixed(2));
      print('updated distanceleft: $_distanceLeft');
    });
  }

  // Step counter functions
  void onStepCount(StepCount event) {
    _initialSteps ??= event.steps;

    _latestSteps = event.steps - _initialSteps!;
    setState(() {
      _displayedSteps = _latestSteps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      if (event.status == "stopped") {
        _displayedSteps = 'Stopped';
      }
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _displayedSteps = 'Status not available';
    });
  }

  void onStepCountError(error) {
    setState(() {
      _displayedSteps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  void showEndPrompt() async {
    bool endSession = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const EndSessionDialog();
      },
    );

    if (endSession) {
      // Save in database
      if (mounted) {
        await Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => EndPage(
              distance: _distanceTravelled,
              time: _time,
              wasteCount: _wasteCount,
              stepCount: _latestSteps,
            ),
          ),
          (Route<dynamic> route) => false,
        );
      }
    }
  }

  @override
  void dispose() async {
    _locationSubscription?.cancel();
    await _stopWatchTimer.dispose();
    super.dispose();
  }

  Future<void> _getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationSubscription = _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      //this is to constantly update how much the user had walked
      if (_lastPosition != null) {
        final double distanceIncrement = geolocator.Geolocator.distanceBetween(
              _lastPosition!.latitude,
              _lastPosition!.longitude,
              currentLocation.latitude!,
              currentLocation.longitude!,
            ) /
            1000;
        _distanceTravelled = double.parse(
            (_distanceTravelled + distanceIncrement).toStringAsFixed(2));
      }
      setState(() {
        _currentPosition =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _lastPosition =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _updateDistanceToDestination();
        _updatePolyline(_currentPosition);
        _mapController.future.then((controller) {
          controller.animateCamera(CameraUpdate.newLatLng(
              LatLng(currentLocation.latitude!, currentLocation.longitude!)));
        });
        if (_holdingCount > 0) {
          _checkRadius();
        }
      });
    });
  }

  void disposeTrash() {
    setState(() {
      _nearBin = false;
      if(_waypoints.isNotEmpty) {
        _waypoints.removeLast();
        _markers.clear();
      }

      _wasteCount = _holdingCount;
      _holdingCount = 0;
    });
  }

  void _checkRadius() {
    double distance;

    LatLng destination = _waypoints.isNotEmpty
        ? _waypoints.last
        : LatLng(widget.destLatitude, widget.destLongitude);

    distance = geolocator.Geolocator.distanceBetween(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
      destination.latitude,
      destination.longitude,
    );

    setState(() {
      _nearBin = distance < 500;
    });
  }

  //this function is to keep updating the distance left when user are traveling towards it.
  void _updateDistanceToDestination() {
    if (_currentPosition == null) {
      return;
    }
    final distance = geolocator.Geolocator.distanceBetween(
          _currentPosition!.latitude,
          _currentPosition!.longitude,
          widget.destLatitude,
          widget.destLongitude,
        ) /
        1000;
    setState(() {
      _distanceLeft = double.parse(distance.toStringAsFixed(2));
    });
  }

  Future<void> _updatePolyline(LatLng? currentPosition) async {
    if (currentPosition == null) return;
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    List<PolylineWayPoint> polylineWayPoints = _waypoints
        .map((latLng) => PolylineWayPoint(
            location: "${latLng.latitude},${latLng.longitude}"))
        .toList();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        API_KEY,
        PointLatLng(currentPosition.latitude, currentPosition.longitude),
        PointLatLng(widget.destLatitude, widget.destLongitude),
        travelMode: TravelMode.walking,
        wayPoints: polylineWayPoints);

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    setState(() {
      _polylines[const PolylineId('route')] = Polyline(
        polylineId: const PolylineId('route'),
        color: const Color(0xFF67B274),
        points: polylineCoordinates,
        width: 5,
      );

      if (!_initialLoad) {
        _initialLoad = true;
        _stopWatchTimer.onStartTimer();
      }
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
            child: Text(
              "Plogging",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Expanded(
            child: Stack(children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _currentPosition ?? const LatLng(1.3521, 103.8198),
                  zoom: 13,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("_destinationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(widget.destLatitude, widget.destLongitude),
                    infoWindow: InfoWindow(
                        title: widget.destName,
                        snippet: '${widget.distance} km away'),
                  ),
                  ..._markers.values,
                },
                polylines: Set<Polyline>.of(_polylines.values),
                onMapCreated: (GoogleMapController controller) {
                  _mapController.complete(controller);
                },
                myLocationEnabled: true,
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
                            mainAxisAlignment: _initialLoad
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.start,
                            children: _initialLoad
                                ? [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            SizedBox(
                                              width: 18,
                                              height: 13,
                                              child: SvgPicture.asset(
                                                "assets/navigation.svg",
                                                semanticsLabel: 'Distance',
                                              ),
                                            ),
                                            Text("$_distanceLeft km left",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 18,
                                              height: 13,
                                              child: SvgPicture.asset(
                                                  "assets/time.svg",
                                                  semanticsLabel: 'Time'),
                                            ),
                                            StreamBuilder<int>(
                                              stream: _stopWatchTimer.rawTime,
                                              initialData: 0,
                                              builder: (context, snap) {
                                                _time = snap.data ?? 0;
                                                String displayTime =
                                                    "${StopWatchTimer.getDisplayTimeHours(_time)}:${StopWatchTimer.getDisplayTimeMinute(_time)}:${StopWatchTimer.getDisplayTimeSecond(_time)}";
                                                return Text(displayTime,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium);
                                              },
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 18,
                                              height: 13,
                                              child: SvgPicture.asset(
                                                "assets/run.svg",
                                                semanticsLabel: 'Steps',
                                              ),
                                            ),
                                            Text(_displayedSteps,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium)
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Eco-effort",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge
                                                ?.copyWith(
                                                  color:
                                                      const Color(0xFF747474),
                                                )),
                                        Text(_wasteCount.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge)
                                      ],
                                    )
                                  ]
                                : [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Loading...",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                          const SizedBox(
                                            height: 48,
                                          )
                                        ])
                                  ],
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                              onPressed: _initialLoad
                                  ? () => openCamera(context)
                                  : null,
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
                          width: 140,
                          child: ElevatedButton(
                            onPressed:
                                _initialLoad ? () => showEndPrompt() : null,
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
                    ),
                    const SizedBox(height: 12),
                    _nearBin
                        ? SizedBox(
                            width: 280,
                            child: ElevatedButton(
                              onPressed: _nearBin ? () => disposeTrash() : null,
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor: const Color(0xFFCCFA6E),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              child: Text(
                                "Dispose!",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
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
