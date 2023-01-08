import 'package:flutter/material.dart';
import 'kargo/login.dart';
import 'kit/kitsign/kitlogin.dart';

class LogosPage extends StatelessWidget {
  const LogosPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight =MediaQuery.of(context).size.height*0.5;
    // double screenHeight =MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: Center(
                    child: Column(children: [
        Flexible(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const KitSignInScreen()));
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const SignInScreen()));
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
