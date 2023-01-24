import 'dart:convert';

List<Demands> postFromJson(String str) => List<Demands>.from(json.decode(str).map((x) => Demands.fromJson(x)));
String postToJson(List<Demands> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Demands {
  Demands({
    required this.uid,
    required this.title,
    required this.status,
    required this.created,
    required this.updated,
    required this.lat,
    required this.lon,
  });
  String? uid;
  String? title;
  String? status;
  String? created;
  String? updated;
  String? lat;
  String? lon;

  factory Demands.fromJson(Map<String, dynamic> json) => Demands(
    uid: json["uid"],
    title: json["title"],
    status: json["status"],
    created: json["created"],
    updated: json["updated"],
    lat: json["lat"],
    lon: json["lon"],
  );
  Map<String, dynamic> toJson() => {
    "uid": uid,
    "title": title,
    "status": status,
    "created": created,
    "updated": updated,
    "lat": lat,
    "lon":lon,
  };
}