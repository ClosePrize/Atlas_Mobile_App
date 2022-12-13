import 'package:flutter/material.dart';
import 'package:v01/kit/taleplerim/body.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kit/widgets/bottomnavigationbar.dart';

class TaleplerimScreen extends StatelessWidget {
  const TaleplerimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitBottomNavBar(),
      body:TaleplerimBody() ,
    );
  }
}