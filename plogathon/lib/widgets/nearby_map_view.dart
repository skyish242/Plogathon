import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plogathon/model/location.dart';
import 'package:plogathon/widgets/location_card.dart';

class NearbyMapView extends StatefulWidget {
  final List<Location>? locationData;

  const NearbyMapView({Key? key, this.locationData}) : super(key: key);

  @override
  State<NearbyMapView> createState() => _NearbyMapViewState();
}

class _NearbyMapViewState extends State<NearbyMapView> {
  GoogleMapController? _controller;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _onLocationTap(String markerId, double lat, double long) {
    _controller?.showMarkerInfoWindow(MarkerId(markerId));
    _controller?.moveCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
  }

  @override
  Widget build(BuildContext context) {
    // Create a list of Marker objects from the location data
    List<Marker> markers = widget.locationData?.map((location) {
          return Marker(
            markerId: MarkerId(location.locationName),
            position: LatLng(location.lat, location.long),
            infoWindow: InfoWindow(
              title: location.locationName,
              snippet: '${location.distance} km away',
            ),
          );
        }).toList() ??
        [];

    // Gmaps here
    return Expanded(
      child: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
                target: LatLng(1.3521, 103.8198), zoom: 11),
            markers: Set<Marker>.from(markers),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(bottom: 60.0),
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.only(bottom: 16.0, left: 32, right: 32),
                children: widget.locationData != null
                    ? widget.locationData!
                        .map(
                          (location) => GestureDetector(
                            onTap: () => _onLocationTap(location.locationName,
                                location.lat, location.long),
                            child: SizedBox(
                              width: 300,
                              child: LocationCard(
                                name: location.locationName,
                                distance: location.distance,
                                long: location.long,
                                lat: location.lat,
                                time: location.timeRequired,
                              ),
                            ),
                          ),
                        )
                        .toList()
                    : [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
