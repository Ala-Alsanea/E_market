// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../size_config.dart';
import '../style.dart';

Widget header(
  BuildContext context,
  String title, {
  IconData? icon,
  Function()? function,
}) {
  SizeOfConfig().init(context);
  return Container(
    padding: EdgeInsets.only(top: getHeight(24)),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon != null
            ? GestureDetector(
                onTap: function,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: whiteColor,
                    ),
                    SizedBox(width: getWidth(10)),
                  ],
                ),
              )
            : Container(),

        Text(
          title,
          style: bold_24(),
        ),
        // SizedBox(width: getWidth(15)),
      ],
    ),
  );
}
