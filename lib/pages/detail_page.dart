// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print

import 'package:e_maecket/api/ConnectApi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../Config/size_config.dart';
import '../Config/style.dart';
import '../api/app_notifier.dart';
import '../api/model/products.dart';

class DetailPage extends StatefulWidget {
  var id;
  DetailPage({
    this.id,
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //

  checkNullText(text) {
    if (text == null) return '-';

    return text;
  }

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Consumer<AppNotifier>(
          builder: (context, notifier, child) => FutureBuilder(
              future: notifier.getAllProducts(
                  'products?populate=*&filters[id]=' + widget.id.toString()),
              //
              builder: (context, AsyncSnapshot<List<Products>> snapshot) {
                // ? debug

                if (snapshot.hasData) {
                  print('__________start_________');
                  print(snapshot.data![0].id.toString());
                  print('products/' + widget.id + '?populate=*');
                  print(widget.id.toString());
                  print('_________end__________');

                  return ListView(
                    children: [
                      Stack(
                        children: [
                          Stack(
                            children: [
                              // pic
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data![0].attributes!
                                      .images!.data!.length,
                                  itemBuilder: (context, index) =>
                                      Image.network(
                                          ConnectApi().Storge +
                                              snapshot
                                                  .data![0]
                                                  .attributes!
                                                  .images!
                                                  .data![index]!
                                                  .attributes!
                                                  .url
                                                  .toString(),
                                          fit: BoxFit.contain),
                                ),
                              ),
                              //  X
                              Positioned(
                                top: 15.0,
                                left: 15.0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: whiteColor, width: 2),
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      FontAwesomeIcons.arrowLeft,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            // width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.32),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                //
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      snapshot.data![0].attributes!.price
                                          .toString(),
                                      style: TextStyle(
                                        color: secondTextColor,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025),
                                // ? model and brand text

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0,
                                  ),
                                  child: Column(
                                    children: [
                                      // ? model text
                                      RichText(
                                        text: TextSpan(
                                            text: checkNullText(snapshot
                                                .data![0]?.attributes?.model
                                                .toString()),
                                            style:
                                                bold_24(color: mainTextColor)),
                                      ),
                                      SizedBox(height: getHeight(10)),
                                      // ? brand text
                                      RichText(
                                        text: TextSpan(
                                            text: snapshot.data![0].attributes!
                                                .brand!.data!.attributes!.name
                                                .toString(),
                                            style:
                                                bold_18(color: mainTextColor)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0,
                                  ),
                                  child: Row(
                                    children: [
                                      //? cpu type
                                      Container(
                                        height: 40.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: primaryColor,
                                        ),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                                text: checkNullText(snapshot
                                                    .data![0]
                                                    ?.attributes
                                                    ?.cpuType
                                                    ?.data
                                                    ?.attributes
                                                    ?.name
                                                    .toString()),
                                                style: normal_16()),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(child: Container()),
                                      //? hard size and type

                                      Container(
                                        height: 40.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: primaryColor,
                                        ),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                                text: checkNullText(snapshot
                                                        .data![0]
                                                        ?.attributes
                                                        ?.prHardSize
                                                        ?.data
                                                        ?.attributes
                                                        ?.name
                                                        .toString()) +
                                                    " " +
                                                    checkNullText(snapshot
                                                        .data![0]
                                                        ?.attributes
                                                        ?.prHardType
                                                        ?.data
                                                        ?.attributes
                                                        ?.name
                                                        .toString()),
                                                style: normal_16()),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(child: Container()),
                                      //? ramr size

                                      Container(
                                        height: 40.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: primaryColor,
                                        ),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                                text: checkNullText(snapshot
                                                        .data![0]
                                                        ?.attributes
                                                        ?.ramSize
                                                        ?.data
                                                        ?.attributes
                                                        ?.name
                                                        .toString()) +
                                                    " Ram",
                                                style: normal_16()),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Model S',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: mainTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25.0,
                                  ),
                                  child: Text(
                                    """Dual Motor All-Wheel Drive unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.""",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: mainTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.015,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25.0,
                                  ),
                                  child: Text(
                                    """Dual Motor All-Wheel Drive unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.unlocks more range than any other vehicle in our current lineup, with insane power and maximum control.""",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    ));
  }
}
