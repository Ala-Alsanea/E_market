import 'package:flutter/material.dart';

class SizeOfConfig {
  static late MediaQueryData _mediaQueryData;
  static late double widthScreen;
  static late double heightScreen;
  static double? defaultSize;
  static Orientation? rotation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    widthScreen = _mediaQueryData.size.width;
    heightScreen = _mediaQueryData.size.height;
    rotation = _mediaQueryData.orientation;
  }
}

double getWidth(double inputWidth) {
  return (inputWidth / 315.0) * SizeOfConfig.widthScreen;
}

double getHeight(double inputHeight) {
  return (inputHeight / 815.0) * SizeOfConfig.heightScreen;
}
