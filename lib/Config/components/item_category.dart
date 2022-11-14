// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../size_config.dart';
import '../style.dart';

class ItemCategory extends StatelessWidget {
  var onTap;
  var icon;
  var text;

  ItemCategory({
    this.onTap,
    this.icon,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        height: getHeight(100),
        width: getWidth(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: gradientColor1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: whiteColor),
            SizedBox(
              height: getHeight(10),
            ),
            Text(
              text,
              style: bold_24(),
            )
          ],
        ),
      ),
    );
  }
}
