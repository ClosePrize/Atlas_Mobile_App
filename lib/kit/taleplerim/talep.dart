import 'package:flutter/material.dart';

import '../../kargo/constants.dart';
import '../widgets/bottomnavigationbar.dart';
import 'kit_talep.dart';

class KitTalepOnayPage extends StatelessWidget{
  const KitTalepOnayPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitBottomNavBar(),
      body: KitTalepScreen(),
    );
  }
}