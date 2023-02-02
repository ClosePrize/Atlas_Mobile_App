import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v01/kit/home/home.dart';
import '../../kargo/widgets/reusable_widgets.dart';
import 'kitsignup.dart';
// import 'package:v01/kargo/constants.dart';
class KitSignInScreen extends StatefulWidget {
  const KitSignInScreen({Key? key}) : super(key: key);

  @override
  _KitSignInScreenState createState() => _KitSignInScreenState();
}

class _KitSignInScreenState extends State<KitSignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  var alert = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height*0.45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50),
                  bottomRight: Radius.circular(50) ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:AssetImage("assets/kitbaslik.png"),
                  ),
                ),
              ),
            ),
            Padding(padding:
            EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.09, 30, 0),
                child: Column(
                  children:<Widget>[
                reusableTextField("E-posta", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Şifre", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 40,
                ),
                // forgetPassword(context),
                firebaseUIButton(context, "GİRİŞ YAP", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  KitHomePage()));
                  }).onError((error, stackTrace) {
                    showDialog<String>(
                      barrierColor: Colors.transparent,
                      useSafeArea: false,
                      context: context,
                      builder: (BuildContext context) => Container(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height/10,
                            decoration: BoxDecoration(
                              //color: Color.fromARGB(255, 189, 23, 34).withOpacity(0.9),
                              color: Colors.grey,
                              //borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                              ),
                              child: Container(
                                //padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                child: Text("E-posta veya Sifreniz yanlıS",style: TextStyle(fontSize: 15,color: Colors.black),),
                              )
                            )
                          ],
                        ),
                      )
                    );
                  });
                }),
                const SizedBox(
                  height: 30,
                ),
                signUpOption()
              ],
                ), )
          ],
          
        ),
          ),
        );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Hesabın yok mu ?",
            style: TextStyle(color: Color.fromARGB(179, 0, 0, 0), fontSize: 20)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const KitSignUpScreen()));
          },
          child: const Text(
            " Kaydol",
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold, fontSize: 20),
          ),
        )
      ],
    );
  }

}