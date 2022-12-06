// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/kargohome.dart';

import 'widgets/reusable_widgets.dart';

class KargoSignUpScreen extends StatefulWidget {
  const KargoSignUpScreen({Key? key}) : super(key: key);

  @override
  _KargoSignUpScreenState createState() => _KargoSignUpScreenState();
}

class _KargoSignUpScreenState extends State<KargoSignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
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
                reusableTextField("Şifre", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 25,
                ),
                 reusableTextField("Şifre Tekrarı", Icons.lock_outlined, true,
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
                        MaterialPageRoute(builder: (context) => KargoHomeScreen()));
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

