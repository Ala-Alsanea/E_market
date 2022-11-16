// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, prefer_typing_uninitialized_variables

import 'package:e_maecket/Config/size_config.dart';
import 'package:e_maecket/api/ConnectApi.dart';
import 'package:e_maecket/pages/detail_page.dart';
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
  String title;
  var apiEntry;

  CategoryPage({
    required this.title,
    required this.apiEntry,
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
          color: primaryColor, //change your color here
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(widget.title, style: bold_24(color: primaryColor)),
        titleTextStyle: TextStyle(color: primaryColor),
      ),
      body: Container(
        // ? fetch data
        child: Consumer<AppNotifier>(
          builder: (context, notifier, child) => FutureBuilder(
              // !: the url
              future: notifier.getAllProducts(widget.apiEntry),
              //
              builder: (context, AsyncSnapshot<List<Products>> snapshot) {
                // !!!
                if (snapshot.hasData) {
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      // ? debug
                      print(ConnectApi().Storge);
                      print(snapshot.data![index].attributes!.images!.data![0]
                          ?.attributes!.url
                          .toString());
                      //
                      return CardCategoryItem(
                        index: snapshot.data![index].id.toString(),
                        currency: snapshot
                            .data![index].attributes!.currency!.data
                            .toString(),
                        name:
                            snapshot.data![index].attributes!.model.toString(),
                        price:
                            snapshot.data![index].attributes!.price.toString(),
                        img: snapshot.data![index].attributes!.images!.data![0]
                            ?.attributes!.url
                            .toString(),
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    id: snapshot.data![index].id.toString(),
                                  ),
                                ));
                          });
                        },
                      );
                    },
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
