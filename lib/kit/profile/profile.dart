import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';

import '../../kargo/home/kargohome.dart';
import '../widgets/bottomnavigationbar.dart';
import 'boody.dart';

class KitProfilePage extends StatelessWidget{
   KitProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitProfileNavBar(),
      
       floatingActionButton: FloatingActionButton(
          onPressed: () {  Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  KargoHomeScreen(),
              ),
            );  },
          child: ClipRRect(child:Image.asset('assets/kargologo.png',
         
            fit: BoxFit.fitHeight,height: 120,),borderRadius: BorderRadius.circular(40),),
),
floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // This trailing comma makes auto-formatting nicer for build methods.
 
      body: KitProfileScreen(),
    );
  }
}