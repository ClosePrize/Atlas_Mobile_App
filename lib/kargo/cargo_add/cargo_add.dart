import 'package:flutter/material.dart';
import 'package:v01/kargo/cargo_add/body.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';

class KargoAddScreen extends StatelessWidget {
  const KargoAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomNavBar(),
      body:KargoAdd() ,
    );
  }
}