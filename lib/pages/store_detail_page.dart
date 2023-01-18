import 'package:e_maecket/Config/style.dart';
import 'package:e_maecket/api/ConnectApi.dart';
import 'package:e_maecket/api/app_notifier.dart';
import 'package:e_maecket/api/model/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Config/components/btn_app.dart';
import '../Config/components/tab.dart';

class StoreDetailPage extends StatefulWidget {
  var id;
  StoreDetailPage({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<StoreDetailPage> createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  final double coverHeight = 250;
  final double profileHeight = 130;
  Widget build(BuildContext context) {
    // final top =coverHeight -   profileHeight/2;
    return Scaffold(body: SafeArea(
        child: Consumer<AppNotifier>(builder: (context, notifier, child) {
          return FutureBuilder(
              future: notifier.getAllStores(
                  'stores?populate=*&filters[id]=' + widget.id.toString()),
              builder: (context, AsyncSnapshot<List<Stores>> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            buildStackPorfila(
                              cover: ConnectApi().Storge +
                                  snapshot.data![0].attributes!.cover!.data!
                                      .attributes!.url
                                      .toString(),
                              avatar: ConnectApi().Storge +
                                  snapshot.data![0].attributes!.avatar!.data!
                                      .attributes!.url
                                      .toString(),
                              name: snapshot.data![0].attributes!.name.toString(),
                            ),
                            tap(store: snapshot.data![0]),
                            // tap2()
                          ],
                        ),
                      ),
                    ],
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
        })));
  }

  Stack buildStackPorfila({cover, avatar, name}) {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(cover),
        ),
        Positioned(
          top: top,
          child: buildProfilaImage(avatar, name),
        )
      ],
    );
  }

// cover
  buildCoverImage(img) => Container(
    color: Colors.grey,
    child: Image.network(
      img,
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );

  buildProfilaImage(avatar, name) => Padding(
    padding: const EdgeInsets.only(
      left: 10,
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade50,
          backgroundImage: NetworkImage(avatar),
        ),
        SizedBox(
          width:15,
        ),
        buildConten(name)
      ],
    ),
  );

  buildConten(name) => Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 70,
        ),
        Text(
          name,
          style: bold_18(color: Colors.black),
        ),
      ],
    ),
  );
}
