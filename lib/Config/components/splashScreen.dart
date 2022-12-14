import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_maecket/Config/components/intro_page.dart';
import 'package:e_maecket/Config/style.dart';
import 'package:e_maecket/main.dart';
import 'package:e_maecket/pages/browse_page.dart';
import 'package:e_maecket/pages/layout_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatelessWidget {
  SpalshScreen({super.key});

  final _myBox = Hive.box('mybox');

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Image.asset('assets/img/png/logo.png'),
      ),
      nextScreen: (_myBox.get('intro') != null) ? LayoutPage() : IntroPage(),
      splashIconSize: 300,
      duration: 1500,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      backgroundColor: primaryColor,
    );
  }
}
