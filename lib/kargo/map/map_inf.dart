import 'dart:convert';

List<Locations> LocationFromJson(String str) => List<Locations>.from(json.decode(str).map((x) => Locations.fromJson(x)));

String post1ToJson(List<Locations> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Locations {
  Locations({
    required this.lat,
    required this.lon,
  });
  double lat;
  double lon;

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
    lat: json["lat"],
    lon: json["lon"],
  );
  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon":lon,
  };
}

List<Kargomat> KargomatFromJson(String str) => List<Kargomat>.from(json.decode(str).map((x) => Kargomat.fromJson(x)));

String post5ToJson(List<Kargomat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kargomat {
  Kargomat({
    required this.lat,
    required this.lon,
  });
  double lat;
  double lon;

  factory Kargomat.fromJson(Map<String, dynamic> json) => Kargomat(
    lat: json["lat"],
    lon: json["lon"],
  );
  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon":lon,
  };
}