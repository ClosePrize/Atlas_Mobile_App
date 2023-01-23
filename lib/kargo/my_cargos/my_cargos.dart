import 'package:flutter/material.dart';
import 'package:v01/kargo/my_cargos/body.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/home/home.dart';
import 'boody.dart';
class MyCargosScreen extends StatelessWidget {
  const MyCargosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: CargosNavBar(),
      body:MyKargosBody() ,
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