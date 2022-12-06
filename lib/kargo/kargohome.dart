import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';

class KargoHomeScreen extends StatelessWidget {
  const KargoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      bottomNavigationBar: BottomNavBar(),
    );
  }
}