// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:convert';

import '../widgets/item_list.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({
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
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/car_list.json'),
                builder: (context, snapshot) {
                  // Decode the JSON
                  var newData = json.decode(snapshot.data.toString());

                  return ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return ItemList(
                          context: context, index: index, newData: newData);
                    },
                    itemCount: newData == null ? 0 : newData.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 15.0,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
