import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kit/home/home.dart';

import 'talep_onay.dart';

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
        backgroundColor:kitPrimaryColor,
    leading: IconButton(
    icon: Icon(
    Icons.close_rounded, color: Colors.white, size: 30,),
    onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => KitHomePage())),
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
                MaterialPageRoute(builder: (context) => KitTalepOnayPage()));
              })
            ],
          ),
        ),
      ),
    ),
    );
  }
}

