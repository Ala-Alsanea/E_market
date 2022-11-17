// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../Config/style.dart';
import '../api/app_notifier.dart';
import 'browse_page.dart';
import 'compare_page.dart';
import 'search_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

int _selectedIndex = 0;
bool isThePage = true;
List _listPages = [
  BrowsePage(),
  SearchPage(),
  ComparePage(),
];
checkThePage(int index) {
  isThePage = index != 1 ? true : false;
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool isThePage = true;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppNotifier()),
      ],
      child: Scaffold(
        appBar: (isThePage)
            ? AppBar(
                elevation: 0,
                backgroundColor: primaryColor,
              )
            : AppBar(
                elevation: 0,
                backgroundColor: backgroundColor,
                title: Text('E Market', style: bold_24(color: primaryColor)),
                centerTitle: true,
              ),
        extendBody: true,
        backgroundColor: backgroundColor,
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 5,
          ),
          padding: EdgeInsets.all(7.0),
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
              tabBackgroundColor: primaryColor,
              activeColor: whiteColor,
              color: Colors.black.withOpacity(0.55),
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                // print(_listPages.elementAt(index).toString() !=
                //     SearchPage().toString());
                setState(() {
                  checkThePage(index);
                  _selectedIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: FontAwesomeIcons.house,
                  text: "Browse",
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                ),
                GButton(
                  icon: FontAwesomeIcons.filter,
                  text: "Filter",
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
