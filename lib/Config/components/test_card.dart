// ignore_for_file: prefer_const_constructors

import 'package:e_maecket/Config/size_config.dart';
import 'package:e_maecket/Config/style.dart' show gradientColor1;
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: gradientColor1,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: 1,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/img/jpg/captiva.jpg",
                    image: "assets/img/jpg/captiva.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(0)),
                child: Text('data'),
              ),
              SizedBox(height: getHeight(0) / 2),
              Text("\$ {product.price}"),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
