import 'dart:ui';

import 'package:fitnessapp/constants.dart';
import 'package:flutter/material.dart';

class Yoga_page extends StatelessWidget {
  const Yoga_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 206, 71, 145),
                image: DecorationImage(
                    alignment: Alignment.centerRight,
                    image: AssetImage("assets/images/yot.png"),
                    fit: BoxFit.fitHeight)),
          ),
          SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        "Yoga",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(),
                      ),
                      SizedBox(
                        child: Text(
                          "Take the Time to make your Soul Happy",
                          style: TextStyle(
                            fontFamily: "Cormorant_Garamond",
                            fontWeight: FontWeight.w300,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Wrap(spacing: 20, runSpacing: 20, children: <Widget>[
                        Sessions(
                          isDone: true,
                          sessionNo: 1,
                          press: () {},
                        )
                      ]),
                      SizedBox(height: 20),
                      Text("Yoga",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.normal))
                    ],
                  )))
        ],
      ),
    );
  }
}

class Sessions extends StatelessWidget {
  final int sessionNo;
  final bool isDone;
  final VoidCallback press;
  const Sessions(
      {Key? key,
      required this.sessionNo,
      required this.isDone,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
            child: Container(
          width: Constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  blurRadius: 23,
                  offset: Offset(0, 17),
                  spreadRadius: -30,
                  color: KShadow),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? KBlueLight : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromARGB(255, 206, 71, 145),
                        ),
                      ),
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
        )),
      );
    });
  }
}
