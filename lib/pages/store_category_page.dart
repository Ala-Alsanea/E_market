// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:e_maecket/Config/size_config.dart';
import 'package:e_maecket/api/ConnectApi.dart';
import 'package:e_maecket/api/app_notifier.dart';
import 'package:e_maecket/api/model/store.dart';

import 'package:e_maecket/pages/store_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../Config/components/btn_app.dart';
import '../Config/style.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<AppNotifier>(builder: (context, notifier, child) {
        return FutureBuilder(
            future: notifier.getAllStores('stores?populate=*'),
            builder: (context, AsyncSnapshot<List<Stores>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  // padding: EdgeInsets.fromLTRB(0, 0, 0, 10),

                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return StoreCard(
                      id: snapshot.data![index].id,
                      name: snapshot.data![index].attributes!.name,
                      img: snapshot.data![index].attributes!.avatar!.data!
                          .attributes!.url,
                      location: snapshot.data![index].attributes!.location,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return RefreshIndicator(
                  displacement: 250,
                  onRefresh: () => notifier.getAllProducts('stores?populate=*'),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Check your internet connection... ",
                          style: bold_18(color: primaryColor.withOpacity(0.7)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        BtnApp(
                          press: () {
                            setState(() {
                              notifier.getAllProducts('stores?populate=*');
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
            });
      }),
    );
  }
}

// ignore: must_be_immutable
class StoreCard extends StatelessWidget {
  var id;
  var name;
  var location;
  var img;
  StoreCard({
    this.id,
    this.name,
    this.img,
    this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // !! navigate
        print(id);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoreDetailPage(id: id),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 120,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment(0, 0),
              end: Alignment(1, 0),
              colors: [primaryColor, Color.fromARGB(255, 54, 210, 192)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: img != null
                          ? Image.network(
                              ConnectApi().Storge + img.toString(),
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/img/png/logoRounded2.png',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      children: [
                        Text(
                          name,
                          style: headText,
                        ),
                        Text(
                          location,
                          style: bold_16(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
