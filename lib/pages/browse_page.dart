// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:e_maecket/Config/components/header_with_searchbox.dart';
import 'package:e_maecket/Config/components/title_with_more_btn.dart';
import 'package:e_maecket/Config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Config/components/item_list.dart';
import '../Config/components/productCard.dart';
import '../api/app_notifier.dart';
import '../api/model/products.dart';

class BrowsePage extends StatefulWidget {
  BrowsePage({
    Key? key,
  }) : super(key: key);

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          HeaderWithSearchBox(size: MediaQuery.of(context).size),
          Expanded(
            child: Consumer<AppNotifier>(
              builder: (context, notifier, child) {
                return FutureBuilder(
                    future: notifier.getAllProducts('products?populate=*'),
                    builder: (context, AsyncSnapshot<List<Products>> snapshot) {
                      if (snapshot.hasData) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              TitleWithMoreBtn(
                                  title: "New Arrival", press: () {}),
                              SizedBox(
                                height: SizeOfConfig.heightScreen * 0.3,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 5,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        ProductCardHome(
                                          image: snapshot
                                              .data![index]
                                              .attributes!
                                              .images!
                                              .data![0]
                                              ?.attributes!
                                              .url
                                              .toString(),
                                          model: snapshot
                                              .data![index].attributes!.model
                                              .toString(),
                                          brand: snapshot
                                              .data![index]
                                              .attributes!
                                              .brand!
                                              .data!
                                              .attributes!
                                              .name
                                              .toString(),
                                          price: snapshot
                                              .data![index].attributes!.price
                                              .toString(),
                                          press: () {},
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: getWidth(10),
                              ),
                              TitleWithMoreBtn(title: "Popular", press: () {}),
                              SizedBox(
                                height: SizeOfConfig.heightScreen * 0.3,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    return ItemList(
                                      context: context,
                                      index: snapshot.data![index].id,
                                      image: snapshot.data![index].attributes!
                                          .images!.data![0]?.attributes!.url
                                          .toString(),
                                      model: snapshot
                                          .data![index].attributes!.model
                                          .toString(),
                                      brand: snapshot.data![index].attributes!
                                          .brand!.data!.attributes!.name
                                          .toString(),
                                      price: snapshot
                                          .data![index].attributes!.price!
                                          .toString(),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("OOh"),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
