import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v01/animations.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/home/home.dart';
import '../../kargo/widgets/reusable_widgets.dart';
import 'userinformations.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class KitSignUpScreen extends StatefulWidget {
  const KitSignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KitSignUpScreenState createState() => _KitSignUpScreenState();
}

class _KitSignUpScreenState extends State<KitSignUpScreen> {

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _uidTextController = TextEditingController();

  User1 user1 = User1();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () => Navigator.pop(context, false)
        ),
        elevation: 1,
      ),
      body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
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
                    reusableTextField(
                        "İsim- Soyisim", Icons.person_outline, false,
                        _userNameTextController),
                    const SizedBox(
                      height: 25,
                    ),
                    reusableTextField("E-posta", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 25,
                    ),
                    reusableNumberField("Telefon Numarası", Icons.phone, false,
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
                            send();
                        print("Created New Account");
                        print(_passwordTextController.text);
                        Navigator.push(context,
                            SlideRightRoute(page: KitHomePage())
                            // MaterialPageRoute(builder: (context) => KitHomePage())
                        );
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                    })
                  ],
                ),
              )
          )
      ),
    );
  }

  void send() async {
    print("çalışıyor");
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    var uid = user?.uid.toString();
    var _uidTextController = uid.toString();
    user1 = User1(name: _userNameTextController.text, phone: _phoneTextController.text, email: _emailTextController.text ,password: _passwordTextController.text, uid: _uidTextController);
    var response = await http.post(Uri.parse("http://185.77.96.79:8000/api/register/"),
        headers: {"Content-type": "application/json"},
        body: json.encode(user1.toJson()));
    print(response.body);
  }
}


