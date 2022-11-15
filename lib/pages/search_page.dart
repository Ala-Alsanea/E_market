// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_maecket/Config/size_config.dart';
import 'package:e_maecket/Config/style.dart';
import 'package:e_maecket/pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Config/components/item_category.dart';
import '../Config/components/text_input.dart';

class SearchPage extends StatefulWidget {
  List category = [
    {'text': 'Laptops', 'icon': FontAwesomeIcons.computer},
    {'text': 'Screens', 'icon': Icons.monitor},
    {'text': 'Hard Drives', 'icon': FontAwesomeIcons.hardDrive},
    {'text': 'Rams', 'icon': FontAwesomeIcons.chrome},
  ];

  SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        text_input(context, 'Search here ...', icon: Icons.search),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: widget.category.length,
            itemBuilder: (context, index) => ItemCategory(
              text: widget.category[index]['text'],
              icon: widget.category[index]['icon'],
              onTap: () {
                print(index);
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryPage(),
                      ));
                });
              },
            ),
          ),
        )
      ],
    );
  }
}
