import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/home/home.dart';

import '../widgets/bottomnavigationbar.dart';

class KitTalepOnayScreen extends StatefulWidget{
   KitTalepOnayScreen({Key? key}) : super(key: key);

  @override
  _KitTalepOnayScreenState createState() => _KitTalepOnayScreenState();
}

class _KitTalepOnayScreenState extends State<KitTalepOnayScreen>{

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1, milliseconds: 500), (){
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>  KitHomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kitPrimaryColor,
        leading: IconButton(
            icon:  Icon(
              Icons.close_rounded, color: Colors.white, size: 30,),
            onPressed: () {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>  KitHomePage(),
                ),
              );
            }
        ),
        elevation: 1,
      ),
      body: Container(
        /*decoration: BoxDecoration(
          color: kbackgroundColor,
          image: DecorationImage(
            image: AssetImage(
              'assets/taleponay.png'
            )
          )
        ),*/
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(100, 120, 100, 0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/taleponay.png',
                  height: 400,
                  width: 700,)
                ],
            ),
          ),
        ),
      ),
    );
  }
}

class KitTalepOnayPage extends StatelessWidget{
   KitTalepOnayPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kbackgroundColor,
      //bottomNavigationBar: KitBottomNavBar(),
      body: KitTalepOnayScreen(),
    );
  }
}