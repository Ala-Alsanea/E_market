// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Config/style.dart';

class ComparePage extends StatelessWidget {
  const ComparePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primaryColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text("Compare", style: bold_24(color: lightTextColor)),
        titleTextStyle: TextStyle(color: lightTextColor),
      ),
      body: Center(
        child: Lottie.asset('assets/img/lottie/ComingSoon.json'),
      ),
    );
  }
}
