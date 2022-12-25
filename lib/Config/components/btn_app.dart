import 'package:flutter/material.dart';

import '../style.dart';

class BtnApp extends StatelessWidget {
  String title = "More";

  BtnApp({
    Key? key,
    this.title = "More",
    required this.press,
  }) : super(key: key);

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: press,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
