import 'dart:convert';

List<Demands> postFromJson(String str) => List<Demands>.from(json.decode(str).map((x) => Demands.fromJson(x)));

String postToJson(List<Demands> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/*class Demands {
  Demands({
    required this.demands,
    required this.uid,
  });
  String? demands;
  String? uid;

  factory Demands.fromJson(Map<String, dynamic> json) => Demands(
    demands: json["demands"],
    uid: json["uid"],
  );
  Map<String, dynamic> toJson() => {
    "demands": demands,
    "uid": uid,
  };
}*/

class Demands {
  Demands({
    required this.uid,
    required this.title,
    required this.status,
    required this.created,
    required this.updated,
  });
  String? uid;
  String? title;
  String? status;
  String? created;
  String? updated;

  factory Demands.fromJson(Map<String, dynamic> json) => Demands(
    uid: json["uid"],
    title: json["title"],
    status: json["status"],
    created: json["created"],
    updated: json["updated"],
  );
  Map<String, dynamic> toJson() => {
    "uid": uid,
    "title": title,
    "status": status,
    "created": created,
    "updated": updated,
  };
}
