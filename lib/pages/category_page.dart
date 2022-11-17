// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, prefer_typing_uninitialized_variables

import 'package:e_maecket/Config/size_config.dart';
import 'package:e_maecket/api/ConnectApi.dart';
import 'package:e_maecket/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Config/components/car_category_card.dart';
import '../Config/components/card_category_item.dart';
import '../Config/components/item_category.dart';
import '../Config/components/productCard.dart';
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
  var getProduct;
  var Endpoint;
  var search = TextEditingController();
  bool fetching = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct = AppNotifier().getAllProducts(widget.apiEntry);
  }

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
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
              future: getProduct,
              builder: (context, AsyncSnapshot<List<Products>> snapshot) {
                // !!!
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 54,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 50,
                                color: primaryColor.withOpacity(0.23))
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: search,
                              onEditingComplete: () {
                                widget.title == "Search"
                                    ? Endpoint =
                                        'products?populate=*&filters[\$and][0][type][name][\$containsi]=' +
                                            widget.title +
                                            '&filters[\$or][0][model][\$containsi]=' +
                                            search.text +
                                            '&filters[\$or][1][brand][name][\$containsi]=' +
                                            search.text
                                    : Endpoint =
                                        'products?populate=*&filters[\$or][0][type][name][\$containsi]=' +
                                            search.text +
                                            '&filters[\$or][1][model][\$containsi]=' +
                                            search.text +
                                            '&filters[\$or][2][brand][name][\$containsi]=' +
                                            search.text +
                                            '&filters[\$or][3][price][\$eq]=' +
                                            search.text;
                                setState(() {
                                  getProduct =
                                      notifier.getAllProducts(Endpoint);
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: primaryColor.withOpacity(0.23)),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                          SvgPicture.asset("assets/img/svg/search.svg")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getHeight(20),
                    ),
                    snapshot.hasData
                        ? Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(
                                horizontal: getWidth(2),
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                // ? debug
                                print(ConnectApi().Storge);
                                print(snapshot.data![index].attributes!.images!
                                    .data![0]?.attributes!.url
                                    .toString());
                                //
                                return ProductCardHome(
                                  brand: snapshot.data![index].attributes!
                                      .brand!.data!.attributes!.name
                                      .toString(),
                                  model: snapshot.data![index].attributes!.model
                                      .toString(),
                                  price: snapshot.data![index].attributes!.price
                                      .toString(),
                                  image: snapshot.data![index].attributes!
                                      .images!.data![0]?.attributes!.url
                                      .toString(),
                                  press: () {
                                    setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                              id: snapshot.data![index].id
                                                  .toString(),
                                            ),
                                          ));
                                    });
                                  },
                                );
                              },
                            ),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ],
                );
                // if (snapshot.hasData) {
                //   return GridView.builder(
                //     padding: EdgeInsets.symmetric(horizontal: 10),
                //     gridDelegate:
                //         SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 2),
                //     itemCount: snapshot.data!.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       // ? debug
                //       print(ConnectApi().Storge);
                //       print(snapshot.data![index].attributes!.images!
                //           .data![0]?.attributes!.url
                //           .toString());
                //       //
                //       return ProductCardHome(
                //         brand: snapshot.data![index].attributes!.brand!
                //             .data!.attributes!.name
                //             .toString(),
                //         model: snapshot.data![index].attributes!.model
                //             .toString(),
                //         price: snapshot.data![index].attributes!.price
                //             .toString(),
                //         image: snapshot.data![index].attributes!.images!
                //             .data![0]?.attributes!.url
                //             .toString(),
                //         press: () {
                //           setState(() {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => DetailPage(
                //                     id: snapshot.data![index].id
                //                         .toString(),
                //                   ),
                //                 ));
                //           });
                //         },
                //       );
                //     },
                //   );
                // } else {
                //   return Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }
              }),
        ),
      ),
    );
  }
}
