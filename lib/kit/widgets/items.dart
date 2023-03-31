// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  final String kitName;
  // final String itemPrice;
  final String imagePath;
  // final color;
  void Function()? onPressed;

  CardItems({
    super.key,
    required this.kitName,
    // required this.itemPrice,
    required this.imagePath,
    // required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
            // color: Colors.white,
            image: DecorationImage(
              image: AssetImage(
                 imagePath),
              fit: BoxFit.fill,
            )
        )
      ),
    );
  }
}
