import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class Demandinf {

  String? type;
  String? title;
  String? siparis_numarasi;
  String? uid;
  String? lat;
  String? lon;

  Demandinf({this.type, this.title, this.uid, this.lat, this.lon,this.siparis_numarasi});

  factory Demandinf.fromJson(Map<String, dynamic> json) => Demandinf(
    type: json["type"],
    title: json["title"],
    siparis_numarasi: json["sipariş numarası"],
    uid: json["uid"],
    lat: json["lat"],
    lon: json["lon"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "title": title,
    "sipariş numarası": siparis_numarasi,
    "uid": uid,
    "lat": lat,
    "lon": lon,
  };
}