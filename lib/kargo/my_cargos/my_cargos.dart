import 'package:flutter/material.dart';
import 'package:v01/kargo/my_cargos/body.dart';
import 'package:v01/kargo/widgets/reusable_widgets.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';
import 'package:v01/kargo/constants.dart';
class MyCargosScreen extends StatelessWidget {
  const MyCargosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomNavBarForKargolarim(),
      body:MyKargosBody() ,
    );
  }
}