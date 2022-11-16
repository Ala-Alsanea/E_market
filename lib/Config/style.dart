// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFFeaeef7);
const Color gradientColor1 = Color(0xFF323fa3);
const Color gradientColor2 = Color(0xFF5b47ec);
const Color whiteColor = Color(0xFFFFFFFF);
const dynamic heartRedColor = Color(0xFFff7575);
const dynamic eartGreyColor = Color(0xFFa6aebe);
const dynamic mainTextColor = Color(0xFF202442);
const dynamic secondTextColor = Color(0xFF919db0);
const Color pinkAccentColor = Color(0xFFffeaea);
const dynamic redCircleColor = Color(0xFFFF7575);
const dynamic purpleCircleColor = Color(0xFF5c32a3);
const Color tealCircleColor = Color(0xFF52b8b2);
const Color blueCircleColor = Color(0xFF526fb8);
const Color redPurpleCircleColor = Color(0xFFB85284);
const Color yellowCircleColor = Color(0xFFF2CB6C);
//
const Color lightTextColor = Color(0xFFedf4ed);
const Color darkTextColor = Color(0xFF074358);
const Color primaryColor = Color(0xFF2a9d8f);

TextStyle normal_24({color = whiteColor}) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

TextStyle bold_24({color = whiteColor}) {
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color,
    fontFamily: 'Montserrat',
  );
}

TextStyle normal_18({color = whiteColor}) => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: color,
    );

TextStyle bold_18({color = whiteColor}) => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: color,
    );

TextStyle normal_16({color = whiteColor}) => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: color,
    );

TextStyle normal_12({color = whiteColor}) => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: color,
    );

TextStyle bold_16({color = whiteColor}) => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color,
    );

TextStyle bold_12({color = whiteColor}) => TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: color,
    );
