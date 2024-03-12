import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plogathon/model/location.dart';

class NearbyMapView extends StatelessWidget {
  final List<Location>? locationData;
  const NearbyMapView({super.key, this.locationData});

  @override
  Widget build(BuildContext context) {
    // Gmaps here
    return Expanded(
        child: GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(1.3521, 103.8198), zoom: 11),
    ));
  }
}
