import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plogathon/model/location.dart';
import 'package:plogathon/pages/activity.dart';

class NearbyListView extends StatelessWidget {
  final List<Location>? locationData;
  const NearbyListView({super.key, this.locationData});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 20.0, left: 32, right: 32),
        children: locationData != null
            ? locationData!
                .map(
                  (location) => Card(
                    color: Colors.white,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                      child: ListTile(
                        title: Text(location.locationName,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset("assets/navigation.svg",
                                semanticsLabel: 'Navigation'),
                            Text('${location.distance} km away',
                                style: Theme.of(context).textTheme.labelMedium),
                          ],
                        ),
                        trailing: IconButton(
                          icon: SvgPicture.asset("assets/right-arrow.svg",
                              semanticsLabel: 'Start Run'),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ActivityPage(
                                destLongitude: location.long,
                                destLatitude: location.lat,
                                destName: location.locationName,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList()
            : [],
      ),
    );
  }
}
