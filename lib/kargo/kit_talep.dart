import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kargo/talep_onay.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/signup.dart';

class KitTalepScreen extends StatefulWidget{
  const KitTalepScreen({Key? key}) : super(key: key);

  @override
  _KitTalepScreenState createState() => _KitTalepScreenState();
}

class _KitTalepScreenState extends State<KitTalepScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 12, 36),
    leading: IconButton(
    icon: Icon(
    Icons.close, color: Colors.white, size: 50,),
    onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => KargoHomeScreen())),
    ),
    elevation: 0,
    title: const Text(
    "",
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
      )
    ),
    body: Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 300, 40, 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 180,
                width: 240,
                child: Container(
                  color: Colors.white,
                  child: Text(
                    'Kitin Açıklaması'
                  ),
                ),
              ),
              firebaseUIButton_2(context,'Kiti Talep Et', () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => KargoTalepOnayScreen()));
              })
            ],
          ),
        ),
      ),
    ),
    );
  }
}

class KargoKitTalepScreen extends StatelessWidget{
  const KargoKitTalepScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomNavBar(),
      body: KitTalepScreen(),
    );
  }
}