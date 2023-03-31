import 'package:flutter/material.dart';
import 'package:v01/kargo/home/kargohome.dart';
import 'package:v01/kit/taleplerim/body.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/widgets/bottomnavigationbar.dart';
import '../../kargo/constants.dart';

import '../widgets/bottomnavigationbar.dart';

class TaleplerimScreen extends StatelessWidget {
  const TaleplerimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitTaleplerimBar(),
      body:TaleplerimBody() ,
        floatingActionButton: FloatingActionButton(
          onPressed: () { Navigator.pushReplacement<void, void>(
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

