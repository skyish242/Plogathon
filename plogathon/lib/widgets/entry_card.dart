import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plogathon/model/entry.dart';

class EntryCard extends StatelessWidget {
  final Entry? entry;
  const EntryCard({super.key, this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry?.date ?? 'No Date',
                      style: GoogleFonts.montserrat(fontSize: 18)),
                  Text("${(entry?.distance ?? 0 / 1000).toStringAsFixed(2)} km",
                      style: GoogleFonts.montserrat(fontSize: 18)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry?.duration ?? '',
                      style: GoogleFonts.montserrat(fontSize: 14)),
                  Text("${(entry?.speed ?? 0.0).toStringAsFixed(2)} km/h",
                      style: GoogleFonts.montserrat(fontSize: 14)),
                ],
              )
            ],
          )),
    );
  }
}
