import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plogathon/model/location.dart';
import 'package:plogathon/widgets/location_card.dart';

class NearbyMapView extends StatelessWidget {
  final List<Location>? locationData;
  const NearbyMapView({super.key, this.locationData});

  @override
  Widget build(BuildContext context) {
    // Gmaps here
    return Expanded(
        child: Stack(
      children: [
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(1.3521, 103.8198), zoom: 11),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.only(bottom: 60.0),
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(bottom: 30.0, left: 32, right: 32),
              children: locationData != null
                  ? locationData!
                      .map(
                        (location) => SizedBox(
                          width: 300,
                          child: LocationCard(
                              name: location.locationName,
                              distance: location.distance,
                              long: location.long,
                              lat: location.lat),
                        ),
                      )
                      .toList()
                  : [],
            ),
          ),
        )
      ],
    ));
  }
}
