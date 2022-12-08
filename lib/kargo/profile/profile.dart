import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/profile/body.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';

class KargoProfileScreen extends StatelessWidget{
  const KargoProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomNavBar(),
      body: ProfileScreen(),
    );
  }
}