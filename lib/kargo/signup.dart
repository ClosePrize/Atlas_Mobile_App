// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v01/animations.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/home/kargohome.dart';

import 'widgets/reusable_widgets.dart';
/*import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<User> createUser(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class User {
  final int id;
  final String title;

  const User({required this.id, required this.title});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      title: json['title'],
    );
  }
// Data gönderimiyle alakalı:  https://docs.flutter.dev/cookbook/networking/send-data
}*/










class KargoSignUpScreen extends StatefulWidget {
  const KargoSignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KargoSignUpScreenState createState() => _KargoSignUpScreenState();
}

class _KargoSignUpScreenState extends State<KargoSignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 12, 36),
        elevation: 0,
        title: const Text(
          "Kayıt Ol",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
           color: kbackgroundColor,),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                reusableTextField("İsim- Soyisim", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 25,
                ),
                reusableTextField("E-posta", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 25,
                ),
                reusableTextField("Telefon Numarası", Icons.phone, false,
                    _phoneTextController),
                const SizedBox(
                  height: 25,
                ),
                 reusableTextField("Şifre", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 70,
                ),
                firebaseUIButton(context, "KAYIT OL", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => KargoHomeScreen())
                        SlideRightRoute(page: KargoHomeScreen())
                    );
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                })
                
              ],
            ),
          ))),
    );
  }
}

