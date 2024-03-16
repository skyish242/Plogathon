import 'package:flutter/material.dart';
import 'package:plogathon/model/location.dart';
import 'package:plogathon/widgets/location_card.dart';

class NearbyListView extends StatelessWidget {
  final int userID;
  final List<Location>? locationData;
  const NearbyListView({super.key, this.locationData, required this.userID});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 20.0, left: 32, right: 32),
        children: locationData != null
            ? locationData!
                .map((location) => LocationCard(
                    userID: userID,
                    name: location.locationName,
                    distance: location.distance,
                    long: location.long,
                    lat: location.lat,
                    time: location.timeRequired))
                .toList()
            : [],
      ),
    );
  }
}
