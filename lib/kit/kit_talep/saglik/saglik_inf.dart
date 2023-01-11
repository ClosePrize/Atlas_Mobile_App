import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class saglikDemandinf {

  String? kitname;
  String? uid;

  saglikDemandinf({ this.kitname, this.uid});

  factory saglikDemandinf.fromJson(Map<String, dynamic> json) => saglikDemandinf(
    kitname: json["title"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "title": kitname,
    "uid": uid,
  };
}