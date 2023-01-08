import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';

import '../widgets/bottomnavigationbar.dart';
import 'boody.dart';

class KitProfilePage extends StatelessWidget{
  const KitProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitBottomNavBarForProfile(),
      body: KitProfileScreen(),
    );
  }
}