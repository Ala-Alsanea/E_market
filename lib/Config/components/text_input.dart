// ignore_for_file: non_constant_identifier_names, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

import '../size_config.dart';
import '../style.dart';

Widget text_input(
  BuildContext context,
  String holder, {
  Color color = gradientColor1,
  bool passwd = false,
  IconData? icon,
  IconButton? iconButton,
  TextEditingController? controller,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
  Function()? onTap,
  Function(String)? onChanged,
}) {
  SizeOfConfig().init(context);

  return Container(
    // height: getHeight(0),
    padding: EdgeInsets.only(left: icon != null ? 0 : 9),
    margin: EdgeInsets.all(10),
    child: TextFormField(
      // maxLength: 50,
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 18, color: whiteColor),
      expands: false,
      obscureText: passwd,
      decoration: InputDecoration(
        errorMaxLines: null,
        errorBorder: InputBorder.none,
        focusColor: Colors.grey[300],
        border: InputBorder.none,
        hintText: holder,
        hintStyle: normal_18(),
        prefixIcon: icon != null ? Icon(icon, color: whiteColor) : null,
        suffixIcon: iconButton,
        // suffixIconColor: white,
      ),
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
