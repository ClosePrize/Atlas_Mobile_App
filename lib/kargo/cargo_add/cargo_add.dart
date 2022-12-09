import 'package:flutter/material.dart';
import 'package:v01/kargo/cargo_add/kargooptions.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';

class KargoAddScreen extends StatelessWidget {
    TextEditingController _siparisTextController = TextEditingController();

   KargoAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 12, 36),
        elevation: 2,
      ),
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomNavBar(),
      body:
     
          Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
children: [
  Flexible(child: Padding(padding:
          EdgeInsets.fromLTRB(
              40, MediaQuery.of(context).size.height * 0.09, 30, 55),
              child: const KargoOptions(),
              )
              ),
],  ),);
  }
}