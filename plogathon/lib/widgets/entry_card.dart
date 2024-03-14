import 'package:flutter/material.dart';
import 'package:plogathon/model/entry.dart';

class EntryCard extends StatelessWidget {
  /// Entry should include:
  /// * Name
  /// * Time
  /// * eco-effort (waste count)
  /// * mileage
  /// * duration

  final Entry? entry;
  final Color? cardColor;
  final String? name;
  final int? wasteCount;
  final double? distance;
  const EntryCard({super.key, this.entry, this.name, this.wasteCount, this.distance, this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor ?? Color(0xFFFFFFFF),
      margin: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name?? '', style: Theme.of(context).textTheme.bodySmall),
            Text("12 minutes ago",
                style: Theme.of(context).textTheme.labelMedium),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Eco-effort",
                            style: Theme.of(context).textTheme.bodySmall),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text("+" + wasteCount.toString(),
                              style: Theme.of(context).textTheme.titleMedium),
                        )
                      ],
                    ),
                    const VerticalDivider(
                      width: 20,
                      thickness: 0.5,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Mileage",
                            style: Theme.of(context).textTheme.bodySmall),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(distance.toString() + "km",
                              style: Theme.of(context).textTheme.titleMedium),
                        )
                      ],
                    ),
                    const VerticalDivider(
                      width: 20,
                      thickness: 0.5,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Time",
                            style: Theme.of(context).textTheme.bodySmall),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text("20:32",
                              style: Theme.of(context).textTheme.titleMedium),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
