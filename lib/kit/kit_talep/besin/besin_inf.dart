import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class besinDemandinf {

  String? kitname;
  String? uid;

  besinDemandinf({ this.kitname, this.uid});

  factory besinDemandinf.fromJson(Map<String, dynamic> json) => besinDemandinf(
    kitname: json["title"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "title": kitname,
    "uid": uid,
  };
}