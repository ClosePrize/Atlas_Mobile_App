import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.username,
    required this.email,
    required this.phone,
    this.password,
  });

  String? username;
  String? email;
  String? phone;
  String? password;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    username: json["username"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "phone": phone,
    "password": password,
  };
}