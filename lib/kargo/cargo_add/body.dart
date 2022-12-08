import 'package:flutter/material.dart';
import 'package:v01/kargo/constants.dart';
import 'package:v01/kargo/widgets/bottomnavigationbar.dart';
import 'package:v01/kargo/widgets/optionsdownbox.dart';

class KargoAdd extends StatelessWidget {
  const KargoAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 12, 36),
        elevation: 2,
      ),
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: kbackgroundColor,
      body: Row(
      children: [
        OptionsBox()
      ],
      ),
    );
  }
}