// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter, import_of_legacy_library_into_null_safe, camel_case_types, unnecessary_import, duplicate_ignore

import 'dart:ui';

import 'package:fitnessapp/Yoga.dart';
import 'package:fitnessapp/constants.dart';
import 'package:fitnessapp/display_screen.dart';
// ignore: unnecessary_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:fitnessapp/category_card';

void main() {
  runApp(const fitness());
}

class fitness extends StatefulWidget {
  const fitness({Key? key}) : super(key: key);

  @override
  State<fitness> createState() => _fitnessState();
}

class _fitnessState extends State<fitness> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness',
      theme: ThemeData(
        fontFamily: "Cormorant_Garamond",
        scaffoldBackgroundColor: kBackgroundcolor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: KTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 80,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              BottonNavItem(
                imgSrc: 'assets/images/cal.png',
                title: 'Today',
                press: () {},
              ),
              BottonNavItem(
                imgSrc: 'assets/images/free.png',
                title: 'Today',
                press: () {},
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * .45,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 185, 216),
                  image: DecorationImage(
                      alignment: Alignment.centerRight,
                      image: AssetImage("assets/images/yoga.png"))),
            ),
            SafeArea(
                child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          alignment: Alignment(-1.0, -1.0),
                          image: AssetImage("assets/images/menu.png"))),
                ),
                /*
            Text(
              "Good Morning \nVedashree",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
            ),*/
                Container(
                  // ignore: unnecessary_new
                  padding: new EdgeInsets.only(bottom: 0.0),
                  child: Text(
                    "Good Morning \n vedashree",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 11, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Search"),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .45,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      CategoryCard(
                        title: "Diet",
                        imgSrc: "assets/images/burger.png",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Exercise",
                        imgSrc: "assets/images/ext.png",
                        press: () {},
                      ),
                      CategoryCard(
                          title: "Yoga",
                          imgSrc: "assets/images/yot.png",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Yoga_page();
                            }));
                          }),
                      CategoryCard(
                        title: "Meditation",
                        imgSrc: "assets/images/medit.png",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Detailsc();
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ))
          ],
        ));
  }
}

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
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
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
