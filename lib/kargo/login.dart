import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v01/kargo/home/kargohome.dart';
//import 'package:v01/kit/taleplerim/kit_talep.dart';
import 'package:v01/kargo/widgets/talep_onay.dart';
// import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/map/map.dart';
import 'signup.dart';
import 'widgets/reusable_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
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
                    image:AssetImage("assets/kargobaslik.png"),
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
                        MaterialPageRoute(builder: (context) => KargoHomeScreen()));
                  }).onError((error, stackTrace) {
                    if(_emailTextController.text == "" ||_passwordTextController.text == ""){
                      showDialog<String>(
                          barrierColor: Colors.transparent,
                          useSafeArea: false,
                          context: context,
                          builder: (BuildContext context) => Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                                  child: Material(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height/12,
                                      decoration: BoxDecoration(
                                        //color: Color.fromARGB(255, 189, 23, 34).withOpacity(0.9),
                                        color: Colors.red.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                                        child: Text(
                                          "E-posta ve şifre alanı boş bırakılamaz!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(

                                              fontSize: 15,color: Colors.black),),
                                      ),

                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,)
                              ],
                            ),
                          )
                      );
                    }
                    else{showDialog<String>(
                            barrierColor: Colors.transparent,
                            useSafeArea: false,
                            context: context,
                            builder: (BuildContext context) => Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 20, 0),
                                        child: Material(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                12,
                                            decoration: BoxDecoration(
                                              //color: Color.fromARGB(255, 189, 23, 34).withOpacity(0.9),
                                              color:
                                                  Colors.red.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  30, 20, 30, 20),
                                              child: Text(
                                                "E-posta veya şifreniz yanlış",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ));
                      }
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
                MaterialPageRoute(builder: (context) => const KargoSignUpScreen()));
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