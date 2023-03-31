import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/profile/body.dart';
import 'package:v01/kargo/profile/boody.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';
import 'package:v01/kit/home/home.dart';

class KargoProfileScreen extends StatelessWidget{
  const KargoProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KargoProfileNavBar(),
      body: KargoProfileScreen1(),
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