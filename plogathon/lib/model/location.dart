class Location {
  String locationName;
  double long;
  double lat;
  double distance;
  double timeRequired;

  Location({
    required this.locationName,
    required this.long,
    required this.lat,
    required this.distance,
    required this.timeRequired
  }); 

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'locationName': locationName,
      'long': long,
      'lat': lat,
      'distance': distance,
      'timeRequired': timeRequired,
    };
    return map;
  }

  static Location fromMap(Map<String, dynamic> map) {
    return Location(
      locationName: map['locationName'],
      long: map['long'],
      lat: map['lat'],
      distance: map['distance'],
      timeRequired: map['timeRequired']
    );
  }
}
