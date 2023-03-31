import 'package:flutter/material.dart';

import '../../kargo/constants.dart';
import '../../kargo/home/kargohome.dart';
import '../widgets/bottomnavigationbar.dart';
import 'body.dart';
class KitHomePage extends StatelessWidget{
   KitHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitHomeNavBar(),
      body: KitHomeScreen(),
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
floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, 
    );
  }
}
