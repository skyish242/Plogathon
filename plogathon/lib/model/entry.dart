class Entry {
  static String table = "entries";

  int? id ;
  String? name;
  int? wasteCount;
  String? date;
  String? duration;
  double? speed;
  double? distance;
  int? time;

  Entry({this.id, this.name, this.wasteCount, this.date, this.duration, this.speed, this.distance, this.time});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'wasteCount': wasteCount,
      'date': date,
      'duration': duration,
      'speed': speed,
      'distance': distance
    };

    map['id'] = id;
  
    return map;
  }

  static Entry fromMap(Map<String, dynamic> map) {
    return Entry(
        id: map['id'],
        name: map['name'],
        wasteCount: map['wasteCount'],
        date: map['date'],
        duration: map['duration'],
        speed: map['speed'],
        distance: map['distance']);
  }
}
