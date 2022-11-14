// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'pages/browse_page.dart';
import 'pages/compare_page.dart';
import 'pages/search_page.dart';
import 'widgets/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

int _selectedIndex = 0;
bool isThePage = true;
List _listPages = [
  BrowsePage(),
  SearchPage(),
  ComparePage(),
];

checkThePage(int index) {
  isThePage = _listPages.elementAt(index).toString() != SearchPage().toString();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: (isThePage)
            ? AppBar(
                elevation: 0,
                backgroundColor: AppColor.gradientColor1,
                centerTitle: true,
                title: Text('E Market'),
              )
            : null,
        extendBody: true,
        backgroundColor: AppColor.backgroundColor,
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 9),
          padding: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                spreadRadius: 1.0,
                blurRadius: 8.0,
                offset: const Offset(1, 1),
              ),
            ],
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: GNav(
              gap: 13.0,
              backgroundColor: Colors.white,
              tabBorderRadius: 40.0,
              tabBackgroundColor: AppColor.gradientColor1,
              activeColor: AppColor.whiteColor,
              color: Colors.black.withOpacity(0.55),
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                // print(_listPages.elementAt(index).toString() ==
                //     BrowsePage().toString());
                checkThePage(index);
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: FontAwesomeIcons.scroll,
                  text: "Browse",
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 15.0,
                    bottom: 15.0,
                  ),
                ),
                GButton(
                  icon: FontAwesomeIcons.magnifyingGlass,
                  text: "Search",
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 15.0,
                    bottom: 15.0,
                  ),
                ),
                GButton(
                  icon: FontAwesomeIcons.arrowRightArrowLeft,
                  text: "Compare",
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 15.0,
                    bottom: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: _listPages[_selectedIndex],
        ),
      ),
    );
  }
}
