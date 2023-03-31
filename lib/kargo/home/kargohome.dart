import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/home/body.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';
import 'package:v01/kit/home/home.dart';

import '../cargo_add/cargo_add.dart';

class KargoHomeScreen extends StatelessWidget {
  const KargoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KargoHomeNavBar(),
      body:KargoBody() ,
         floatingActionButton: FloatingActionButton(
          onPressed: () {  Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  KitHomePage(),
              ),
            );  },
          child: ClipRRect(child:Image.asset('assets/kitlogo1.jpg',
         
            fit: BoxFit.fitHeight,height: 120,),borderRadius: BorderRadius.circular(40),),
),
floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, 
      );
    
  }
}
