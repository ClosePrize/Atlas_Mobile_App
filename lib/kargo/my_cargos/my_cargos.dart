import 'package:flutter/material.dart';
import '../../kargo/my_cargos/body.dart';
import '../../kargo/widgets/reusable_widgets.dart';
import '../../kargo/widgets/bottomnavigationbar.dart';
import '../../kargo/constants.dart';
import '../../kit/home/home.dart';
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
