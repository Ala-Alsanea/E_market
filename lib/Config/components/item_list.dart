// ignore_for_file: prefer_const_constructors

import 'package:e_maecket/Config/size_config.dart';
import 'package:e_maecket/api/ConnectApi.dart';
import 'package:flutter/material.dart';

import '../../pages/detail_page.dart';
import '../style.dart';

class ItemList extends StatefulWidget {
  // var newData;
  // var index;
  var image;
  var model;
  var price;
  var brand;
  var index;
  var onTap;
  BuildContext context;
  ItemList({
    super.key,
    required this.context,
    required this.index,
    required this.image,
    required this.model,
    required this.price,
    required this.brand,
    required this.onTap,
  });

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(7),
        height: getHeight(90),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            Container(
              width: getWidth(90),
              height: getHeight(90),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(ConnectApi().Storge + widget.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            SizedBox(width: getWidth(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  widget.model,
                  style: TextStyle(
                    color: darkTextColor.withOpacity(0.8),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      widget.brand,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: primaryColor.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "\$ " + widget.price,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: primaryColor.withOpacity(0.5),
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
