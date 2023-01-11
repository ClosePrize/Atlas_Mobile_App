import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class yolDemandinf {

  String? kitname;
  String? uid;

  yolDemandinf({ this.kitname, this.uid});

  factory yolDemandinf.fromJson(Map<String, dynamic> json) => yolDemandinf(
    kitname: json["title"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "title": kitname,
    "uid": uid,
  };
}