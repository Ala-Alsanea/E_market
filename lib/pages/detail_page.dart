// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ffi';

import 'package:e_maecket/Config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Config/style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: gradientColor1,
        //   elevation: 0,
        // ),
        body: SafeArea(
      child: ListView(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  // pic
                  // TODO: redesigning
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Image.asset("assets/img/jpg/damas.jpg",
                            fit: BoxFit.cover),
                        Image.asset("assets/img/jpg/ferrari.jpg",
                            fit: BoxFit.cover),
                        Image.asset("assets/img/jpg/tesla.jpg",
                            fit: BoxFit.cover),
                      ],
                    ),
                  ),
                  //  X
                  // TODO: redesigning
                  Positioned(
                    top: 15.0,
                    left: 15.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: whiteColor, width: 2),
                            color: gradientColor1,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    //
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "newData[widget.index]['year']",
                          style: TextStyle(
                            color: secondTextColor,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "newData[widget.index]['name']",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: mainTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: getHeight(10)),
                          Text(
                            " newData[widget.index]['price']",
                            style: TextStyle(
                              fontSize: 21.0,
                              color: mainTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: backgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                "newData[widget.index]['speed']",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            height: 40.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: backgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                " newData[widget.index]['color']",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            height: 40.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: backgroundColor,
                            ),
                            child: Center(
                              child: Text(
                                "newData[widget.index]['location']",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Model S',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: mainTextColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Text(
                        """Dual Motor All-Wheel Drive unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.""",
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: mainTextColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Text(
                        """Dual Motor All-Wheel Drive unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.""",
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
