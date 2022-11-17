// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_field

import 'package:e_maecket/pages/layout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../style.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);
// var
  final _myBox = Hive.box('mybox');

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Welcome to E MARKET',
      body: '',
      image: Center(
        child: Lottie.asset('assets/img/lottie/4.json'),
      ),
      decoration: PageDecoration(
          bodyFlex: 1,
          imageFlex: 2,
          titleTextStyle: bold_24(color: mainTextColor)),
    ),
    PageViewModel(
      title: 'browse to find your favorites products',
      body: '',
      image: Center(
        child: Lottie.asset('assets/img/lottie/1.json'),
      ),
      decoration: PageDecoration(
          bodyFlex: 1,
          imageFlex: 2,
          titleTextStyle: bold_24(color: mainTextColor)),
    ),
    PageViewModel(
      title: 'Get start NOW',
      body: '',
      image: Center(
        child: Lottie.asset('assets/img/lottie/5.json'),
      ),
      decoration: PageDecoration(
          bodyFlex: 1,
          imageFlex: 2,
          titleTextStyle: bold_24(color: mainTextColor)),
    ),
  ];

  // function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainTextColor,
      body: Container(
        color: mainTextColor,
        // padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: DotsDecorator(
            colors: [mainTextColor, primaryColor, darkTextColor],
            size: Size(15, 15),
            color: mainTextColor,
            activeSize: Size.square(20),
            activeColor: primaryColor,
          ),
          showDoneButton: true,
          done: Text('Done', style: normal_24(color: mainTextColor)),
          showSkipButton: true,
          skip: Text('Skip', style: normal_24(color: mainTextColor)),
          showNextButton: true,
          next: Text('Next', style: normal_24(color: mainTextColor)),
          onDone: () => OnDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void OnDone(context) async {
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('ON_BOARDING', false);
    _myBox.put('intro', true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LayoutPage()));
  }
}
