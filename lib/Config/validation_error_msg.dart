// ignore_for_file: unused_import, unused_element

import 'package:flutter/material.dart';

const String msgEmailEmpty = 'email address is required !!!';
const String msgPasswdEmpty = 'password is required !!!';
const String msgUsernameEmpty = 'username is required !!!';
const String msgUsernameLength =
    'username is short [at least 4 characters] !!!';
const String msgPasswdLength =
    'password is too short [at least 8 characters] !!!';
const String msgPasswdDontMatch = 'password does not match !!!';
const String msgValidEmailError = "email is not valid !!!";
final RegExp regExpEmailValidator =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
