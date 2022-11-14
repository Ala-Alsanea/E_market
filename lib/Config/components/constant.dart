// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

import '../size_config.dart';

const TextStyle catText = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xFF7115DB),
);

// ignore: non_constant_identifier_names
Widget NavItem(String text, IconData icon, {Function()? function}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF7115DB),
            // foregroundColor: Color(0xFFFFFFFF),
            radius: 25,
            child: IconButton(
              onPressed: function,
              icon: Icon(
                icon,
                size: 25,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          SizedBox(height: getHeight(8)),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),

          //
        ],
      ),
    );

Widget PageViewItem(
  BuildContext context, {
  String? price,
  String? name,
  String? img,
  double? imgSize = 150,
  Function()? function,
}) {
  return GestureDetector(
    onTap: function,
    child: Column(
      children: [
        priceBanner(price!),
        Container(
          // padding: EdgeInsets.symmetric(vertical: 200),
          child: Image.asset(img!, cacheWidth: getWidth(imgSize!).toInt()),
        ),
        Container(
          child: Text(
            name!,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Padding colorsCircle({Color color = Colors.black}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    child: CircleAvatar(
      backgroundColor: color,
      radius: 13,
    ),
  );
}

class ListRow extends StatelessWidget {
  final String title;
  final List<Widget> list;

  const ListRow(
    BuildContext context, {
    // ignore: type_init_formals
    String this.title = '',
    List<Widget> this.list = const <Widget>[],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: getHeight(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ),
      ],
    );
  }
}

Container priceBanner(String price) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
      color: Color(0xFF440C83),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      price,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

Padding textWithPadding(BuildContext context, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
