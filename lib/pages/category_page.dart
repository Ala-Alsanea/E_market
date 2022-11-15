// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:e_maecket/Config/size_config.dart';
import 'package:e_maecket/api/ConnectApi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Config/components/car_category_card.dart';
import '../Config/components/card_category_item.dart';
import '../Config/components/item_category.dart';
import '../Config/style.dart';
import '../api/app_notifier.dart';
import '../api/model/products.dart';

class CategoryPage extends StatefulWidget {
  var category;

  CategoryPage({
    required this.category,
    super.key,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: gradientColor1, //change your color here
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(widget.category, style: bold_24(color: gradientColor1)),
        titleTextStyle: TextStyle(color: gradientColor1),
      ),
      body: Container(
        child: Consumer<AppNotifier>(
          builder: (context, notifier, child) => FutureBuilder(
              // !: the url
              future: notifier.getAllProducts(
                  'products?populate=*&filters[type][name][\$containsi]=' +
                      widget.category.toString()),
              builder: (context, AsyncSnapshot<List<Products>> snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      // ? debug
                      print(ConnectApi().Storge);
                      print(snapshot.data![index].attributes!.images!.data![0]
                          ?.attributes!.formats!.medium!.url
                          .toString());

                      //

                      return CardCategoryItem(
                        index: snapshot.data![index].id.toString(),
                        currency: snapshot.data![index].attributes!.currency
                            .toString(),
                        name:
                            snapshot.data![index].attributes!.model.toString(),
                        price:
                            snapshot.data![index].attributes!.price.toString(),
                        img: snapshot.data![index].attributes!.images!.data![0]
                            ?.attributes!.formats!.medium!.url
                            .toString(),
                      );
                    },
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      'no data found',
                      style: bold_24(color: gradientColor1),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
