import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'kargo/login.dart';
import 'kit/home/home.dart';
import 'kit/kitsign/kitlogin.dart';
import 'animations.dart';

class LogosPage extends StatelessWidget {
  const LogosPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight =MediaQuery.of(context).size.height*0.5;
    late StreamSubscription<User?> user;
    // double screenHeight =MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: Center(
                    child: Column(children: [
        Flexible(
          child: InkWell(
            onTap: () {
              user = FirebaseAuth.instance.authStateChanges().listen((user) {
                if (user != null) {
                  print('User signed in!');
                  Navigator.push(context,
                      // MaterialPageRoute(builder: (context) =>  KitHomePage())
                      SlideRightRoute(page: KitHomePage())
                  );
                } else {
                  print('User is currently signed out!');
                  Navigator.push(
                      context, 
                      // SlideRightRoute(page: KitSignInScreen())
                      MaterialPageRoute(builder: (context) => KitSignInScreen())
                  );
                }
              });
            },
            child: Image.asset(
              "assets/kitlogo.png",
              width: MediaQuery.of(context).size.width,
              height:screenHeight,
              fit: BoxFit.cover,
            ),
          ),
        ),
    
     Flexible(
       child: InkWell(
            onTap: () {
              user = FirebaseAuth.instance.authStateChanges().listen((user) {
                if (user != null) {
                  print('User signed in!');
                  Navigator.push(context,
                      // MaterialPageRoute(builder: (context) =>  KargoHomeScreen())
                      SlideRightRoute(page: KargoHomeScreen())
                  );
                } else {
                  print('User is currently signed out!');
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen())
                      // SlideRightRoute(page: SignInScreen())
                  );
                }
              });
            },
            child: Image.asset(
              "assets/kargologo.png",
              width:  MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height*0.5,
              fit: BoxFit.cover,
              
            ),
          ),
     ),
      
    ])))));
  }
}
