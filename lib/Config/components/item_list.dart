// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../pages/single_car.dart';
import '../style.dart';

class ItemList extends StatefulWidget {
  var newData;
  var index;
  BuildContext context;
  ItemList({
    super.key,
    required this.newData,
    required this.index,
    required this.context,
  });

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  SinglePage(index: widget.index),
            ),
          );
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.7,
        height: 115,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            // pic
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.newData[widget.index]['img']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  widget.newData[widget.index]['name'],
                  style: TextStyle(
                    color: mainTextColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      widget.newData[widget.index]['speed'],
                      style: TextStyle(
                        fontSize: 13.0,
                        color: secondTextColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "\$ " + widget.newData[widget.index]['price'],
                      style: TextStyle(
                        fontSize: 13.0,
                        color: secondTextColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
