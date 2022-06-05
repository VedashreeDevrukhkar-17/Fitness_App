// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables

import 'package:fitnessapp/constants.dart';
import 'package:flutter/material.dart';
// ignore: duplicate_import
import 'package:fitnessapp/constants.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imgSrc;
  final VoidCallback press;
  const CategoryCard(
      {Key? key,
      required this.imgSrc,
      required this.title,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
          //padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                // ignore: prefer_const_constructors
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 17,
                  spreadRadius: -23,
                  color: KShadow,
                ),
              ]),
          child: Material(
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: <Widget>[
                  Spacer(),
                  Image.network(imgSrc),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )
                ]),
              ),
            ),
          )),
    );
  }
}
