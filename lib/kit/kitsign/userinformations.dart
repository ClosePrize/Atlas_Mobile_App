import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class User1 {

  String? name;
  String? email;
  String? phone;
  String? password;
  String? uid;

  User1({ this.name,  this.phone, this.email, this.password, this.uid});

  factory User1.fromJson(Map<String, dynamic> json) => User1(
    email: json["email"],
    phone: json["phone"],
    name: json["name"],
    password: json["password"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "phone": phone,
    "name": name,
    "password": password,
    "uid": uid,
  };
}

User1 _$User1FromJson(Map<String, dynamic> json) {
  return User1(
    name: json['name'] as String,
    phone: json['phone'] as String,
    password: json['password'] as String?,
    email: json['email'] as String?,
    uid: json['uid'] as String?,
  );
}

Map<String, dynamic> _$User1ToJson(User1 instance) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'password': instance.password,
  'email': instance.email,
  'uid': instance.uid,
};
