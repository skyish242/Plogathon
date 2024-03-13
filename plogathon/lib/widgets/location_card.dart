import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plogathon/pages/activity.dart';

class LocationCard extends StatelessWidget {
  final String name;
  final double distance;
  final double long;
  final double lat;
  final double time; 

  const LocationCard(
      {super.key,
      required this.name,
      required this.distance,
      required this.long,
      required this.lat,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
        child: ListTile(
          title: Text(
            name,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/navigation.svg",
                    semanticsLabel: 'Navigation',
                  ),
                  Text(
                    '$distance km away',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/time.svg",
                    semanticsLabel: 'Time',
                  ),
                  Text(
                    '$time hours required',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            icon: SvgPicture.asset(
              "assets/right-arrow.svg",
              semanticsLabel: 'Start Run',
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityPage(
                  destLongitude: long,
                  destLatitude: lat,
                  destName: name,
                  destTime: time,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}