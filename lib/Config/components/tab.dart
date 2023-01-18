import 'package:e_maecket/Config/components/item_list.dart';
import 'package:e_maecket/Config/size_config.dart';
import 'package:e_maecket/Config/style.dart';
import 'package:e_maecket/api/model/products.dart';
import 'package:e_maecket/api/model/store.dart';
import 'package:e_maecket/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/app_notifier.dart';
import 'abut.dart';
import 'btn_app.dart';

class tap extends StatefulWidget {
  Stores? store;
  tap({Key? key, this.store}) : super(key: key);

  @override
  State<tap> createState() => _tapState();
}

class _tapState extends State<tap> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Container(
                color: Color(0xFF2a9d8f),
                child: TabBar(
                  tabs: [
                    Tab(
                      text: "Details",
                      // icon: Icon(Icons.home,color: Colors.white,),
                    ),
                    Tab(
                      text: "Products",
                      // icon: Icon(Icons.home,color: Colors.white,),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  //1st tab
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                widget.store!.attributes!.location!.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                widget.store!.attributes!.phone!.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                widget.store!.attributes!.email!.toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "description:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 6,
                                  ),
                                  description(
                                    content: widget
                                        .store!.attributes!.Description!
                                        .toString(),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  //2an tab
                  Container(
                    child: Center(
                      child: Consumer<AppNotifier>(
                        builder: (context, notifier, child) {
                          return FutureBuilder(
                            future: notifier.getAllProducts(
                              'products?populate=*&filters[store][id]=' +
                                  widget.store!.id.toString(),
                            ),
                            builder: (context,
                                AsyncSnapshot<List<Products>> snapshot) {
                              print('products?populate=*&filters[store][id]=' +
                                  widget.store!.id.toString());
                              if (snapshot.hasData) {
                                return RefreshIndicator(
                                  onRefresh: () => notifier.getAllProducts(
                                    'products?populate=*&filters[store][id]=' +
                                        widget.store!.id.toString(),
                                  ),
                                  child: SizedBox(
                                    height: SizeOfConfig.heightScreen * 1.2,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        return ItemList(
                                          context: context,
                                          index: snapshot.data![index].id,
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
                                              .data![index].attributes!.price!
                                              .toString(),
                                          onTap: () {
                                            setState(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailPage(
                                                          id: snapshot
                                                              .data![index].id
                                                              .toString(),
                                                        ),
                                                  ));
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return RefreshIndicator(
                                  displacement: 250,
                                  onRefresh: () => notifier
                                      .getAllProducts('products?populate=*'),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Check your internet connection... ",
                                          style: bold_18(
                                              color: primaryColor
                                                  .withOpacity(0.7)),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        BtnApp(
                                          press: () {
                                            setState(() {
                                              notifier.getAllProducts(
                                                  'products?populate=*');
                                            });
                                          },
                                          title: "Refresh",
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
