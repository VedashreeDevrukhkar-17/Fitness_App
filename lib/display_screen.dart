// ignore_for_file: unnecessary_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_types_as_parameter_names

import 'dart:ui';

import 'package:fitnessapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Detailsc extends StatelessWidget {
  const Detailsc({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: KBlue,
                image: DecorationImage(
                    alignment: Alignment.centerRight,
                    image: AssetImage("assets/images/medit.png"),
                    fit: BoxFit.fitHeight)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Cormorant_Garamond"),
                    ),
                    SizedBox(
                      width: size.width * .6,
                      // ignore: prefer_const_constructors
                      child: Text(
                        "Calmness of mind is one of the beautiful jewels of wisdom",
                        style: TextStyle(
                          fontFamily: "Cormorant_Garamond",
                          fontWeight: FontWeight.w300,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Wrap(spacing: 20, runSpacing: 20, children: <Widget>[
                      SessionCard(
                        isDone: true,
                        sessionNo: 1,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNo: 2,
                        press: () {},
                        isDone: false,
                      ),
                      SessionCard(
                        sessionNo: 3,
                        press: () {},
                        isDone: false,
                      ),
                      SessionCard(
                        sessionNo: 4,
                        press: () {},
                        isDone: false,
                      ),
                      SessionCard(
                        sessionNo: 5,
                        press: () {},
                        isDone: false,
                      ),
                    ]),
                    SizedBox(height: 20),
                    Text("Meditation",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.normal))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNo;
  final bool isDone;
  final VoidCallback press;
  const SessionCard({
    Key? key,
    required this.sessionNo,
    required this.isDone,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    return LayoutBuilder(builder: (context, Constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: Constraint.maxWidth / 2 - 10,
          //padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  blurRadius: 23,
                  offset: Offset(0, 17),
                  spreadRadius: -13,
                  color: KShadow),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                          color: isDone ? KBlueLight : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: KBlueLight)),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: isDone ? Colors.white : KBlueLight,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Day $sessionNo",
                        style: Theme.of(context).textTheme.subtitle1),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
