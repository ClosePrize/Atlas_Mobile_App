import 'package:flutter/material.dart';

import '../../../kargo/constants.dart';
import '../../widgets/bottomnavigationbar.dart';
import 'body.dart';

class YolYardimPage extends StatelessWidget{
  const YolYardimPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: KitBottomNavBar(),
      body: KitOzelYolYardimScreen(),
    );
  }
}