// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../api/ConnectApi.dart';

class CardCategoryItem extends StatelessWidget {
  var img;
  var index;
  var price;
  var name;
  var currency;
  CardCategoryItem({
    required this.index,
    required this.name,
    required this.price,
    required this.img,
    required this.currency,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(ConnectApi().Storge + img),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
            ),
            SizedBox(height: 3),
            Column(
              children: [
                // ! with condition
                Text(
                  (name.toString().length > 10)
                      ? name.toString().substring(0, 10) + "..."
                      : name.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
