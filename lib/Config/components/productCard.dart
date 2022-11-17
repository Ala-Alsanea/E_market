// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../api/ConnectApi.dart';
import '../size_config.dart';
import '../style.dart';

class ProductCardHome extends StatelessWidget {
  ProductCardHome({
    Key? key,
    required this.image,
    required this.model,
    required this.brand,
    required this.price,
    required this.press,
  }) : super(key: key);

  var image, model, brand, price;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return GestureDetector(
        onTap: press,
        child: Container(
          // It will cover 40% of our total width
          width: SizeOfConfig.widthScreen * 0.45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 30 / 2,
            bottom: 10 * 2.5,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 5,
                  ),
                  width: SizeOfConfig.widthScreen * 0.45,
                  child: Image.network(
                    ConnectApi().Storge + image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(
                    getWidth(5),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 50,
                            color: primaryColor.withOpacity(0.23))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                        child: Text(
                          model,
                          style: const TextStyle(
                            color: primaryColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              brand,
                              style: TextStyle(
                                  color: primaryColor.withOpacity(0.5)),
                            ),
                            const Spacer(),
                            Text(
                              "\$$price",
                              style: bold_12(color: darkTextColor),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
