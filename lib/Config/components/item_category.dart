// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../size_config.dart';
import '../style.dart';

class ItemCategory extends StatelessWidget {
  var onTap;
  var icon;
  var text;
  var title;
  var price;
  var img;

  ItemCategory({
    this.onTap,
    this.icon,
    this.text,
    this.title,
    this.price,
    this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(5),
        height: getHeight(190),
        width: getWidth(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          // color: gradientColor1,
          gradient: LinearGradient(
              colors: [primaryColor, Color.fromARGB(255, 10, 176, 157)]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (img == null)
                ? Icon(icon, color: whiteColor, size: 40)
                : Image.asset(img, fit: BoxFit.cover, width: getWidth(140)),
            SizedBox(height: getHeight(10)),
            (title == null)
                ? Text(text, style: bold_24())
                : RichText(
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    text: TextSpan(text: title, style: bold_24(), children: [
                      TextSpan(text: '\n\$' + price, style: normal_18())
                    ]),
                  ),
          ],
        ),
      ),
    );
  }
}
