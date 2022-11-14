import 'package:flutter/material.dart';

class Msg {
  static final msgKey = GlobalKey<ScaffoldMessengerState>();

  static showSnakeBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    );

    msgKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
