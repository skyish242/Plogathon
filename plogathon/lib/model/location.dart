class Location {
  String locationName;
  double long;
  double lat;
  double distance;

  Location(
      {required this.locationName,
      required this.long,
      required this.lat,
      required this.distance});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'locationName': locationName,
      'long': long,
      'lat': lat,
      'distance': distance
    };

    return map;
  }

  static Location fromMap(Map<String, dynamic> map) {
    return Location(
        locationName: map['locationName'],
        long: map['long'],
        lat: map['lat'],
        distance: map['distance']);
  }
}
