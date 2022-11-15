// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Config/components/item_list.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Consumer<AppNotifier>(
              builder: (context, notifier, child) {
                return FutureBuilder(
                    future: notifier.getAllProducts('products?populate=*'),
                    builder: (context, AsyncSnapshot<List<Products>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ItemList(
                              context: context,
                              index: snapshot.data![index].id,
                              image: snapshot.data![index].attributes!.images!
                                  .data![0]?.attributes!.formats!.medium!.url
                                  .toString(),
                              title: snapshot.data![index].attributes!.brand!
                                  .data!.attributes!.name
                                  .toString(),
                              price: snapshot.data![index].attributes!.price!
                                  .toString(),
                            );
                          },
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
