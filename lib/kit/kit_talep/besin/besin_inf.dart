import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class besinDemandinf {

  String? type;
  String? kitname;
  String? uid;
  String? lat;
  String? lon;

  besinDemandinf({this.type, this.kitname, this.uid, this.lat, this.lon});

  factory besinDemandinf.fromJson(Map<String, dynamic> json) => besinDemandinf(
    type: json["type"],
    kitname: json["title"],
    uid: json["uid"],
    lat: json["lat"],
    lon: json["lon"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "title": kitname,
    "uid": uid,
    "lat": lat,
    "lon": lon,
  };
}