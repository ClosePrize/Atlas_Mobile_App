import 'package:flutter/material.dart';

import '../../kargo/constants.dart';
import '../widgets/bottomnavigationbar.dart';
import 'body.dart';
class KitHomePage extends StatelessWidget{
  const KitHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitBottomNavBar(),
      body: KitHomeScreen(),
    );
  }
}