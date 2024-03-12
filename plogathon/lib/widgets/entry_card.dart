import 'package:flutter/material.dart';
import 'package:plogathon/model/entry.dart';

class EntryCard extends StatelessWidget {
  /// Entry should include:
  /// * Name
  /// * Time
  /// * eco-effort
  /// * mileage
  /// * duration

  final Entry? entry;
  final Color? cardColor;
  const EntryCard({super.key, this.entry, this.cardColor});

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
            Text("Dinie Aziz", style: Theme.of(context).textTheme.bodySmall),
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
                          child: Text("+10",
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
                          child: Text("2.5km",
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
