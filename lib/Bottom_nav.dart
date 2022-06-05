// ignore_for_file: file_names

import 'package:fitnessapp/constants.dart';
import 'package:flutter/material.dart';

class BottonNavItem extends StatelessWidget {
  final String title;
  final String imgSrc;
  final VoidCallback press;
  final bool isActive;
  const BottonNavItem({
    Key? key,
    required this.title,
    required this.imgSrc,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(child: Image.asset(imgSrc, scale: 0.8)),
          Text(
            title,
            style: TextStyle(color: isActive ? KactiveIcon : KTextColor),
          ),
        ],
      ),
    );
  }
}
