import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pedometer/pedometer.dart';
import 'package:plogathon/pages/camera.dart';
import 'package:plogathon/pages/end.dart';
import 'package:plogathon/widgets/end_session_dialog.dart';
import 'package:plogathon/widgets/non_recylable_dialog.dart';
import 'package:plogathon/widgets/recylable_dialog.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';


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
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final DateTime startDateTime = DateTime.now();

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  int? _initialSteps;

  int _wasteCount = 0;
  double _distanceLeft = 0;
  double _distanceTravelled = 0;
  int _time = 0;
  int _latestSteps = 0;
  String _displayedSteps = "0";

  //Direction Service Variables:
  Location _locationController = Location();
  Map<PolylineId, Polyline> _polylines = {};
  Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  LatLng? _currentPosition;


  @override
  void initState() {
    super.initState();

    _distanceLeft = widget.distance;
    double longitude = widget.destLongitude;
    double latitude = widget.destLatitude;
    String name = widget.destName;
    _stopWatchTimer.onStartTimer();
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
              return RecylableDialog(instruction: result['instruction']);
            },
          );
          setState(() {
            _wasteCount++;
          });

          if (reroute) {
            // Find nearest bin
            // Add waypoint and update polyline
            // Update distance left
            // Thanks jr
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
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  Future<void> _getLocationUpdates() async {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  _serviceEnabled = await _locationController.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await _locationController.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await _locationController.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await _locationController.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationController.onLocationChanged.listen((LocationData currentLocation) {
    setState(() {
      _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
      _updatePolyline(_currentPosition);
      _mapController.future.then((controller) {
      controller.animateCamera(CameraUpdate.newLatLng(LatLng(currentLocation.latitude!, currentLocation.longitude!)));
    });
    });
  });
}

  Future<void> _updatePolyline(LatLng? currentPosition) async {
    if (currentPosition == null) return;
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'API_KEY_HERE!!!!!!!!!!!',
      PointLatLng(currentPosition.latitude, currentPosition.longitude),
      PointLatLng(widget.destLatitude, widget.destLongitude),
      travelMode: TravelMode.walking, 
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      _polylines[PolylineId('route')] = Polyline(
        polylineId: PolylineId('route'),
        color: Color(0xFF67B274), 
        points: polylineCoordinates,
        width: 5,
      );
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
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition ?? LatLng(1.3521, 103.8198), 
                zoom: 13,
              ),
              markers: {
                Marker(
                  markerId: MarkerId("_destinationLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(widget.destLatitude, widget.destLongitude) 
                )
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
                                            color: const Color(0xFF747474),
                                          )),
                                  Text(_wasteCount.toString(),
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
                              onPressed: () => openCamera(context),
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
                            onPressed: () => showEndPrompt(),
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
