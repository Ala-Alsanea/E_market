// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print

import 'package:e_maecket/api/ConnectApi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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

  PageController _controller = PageController();

  checkNullText(text) {
    if (text == null) return 'Non';

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
                                  controller: _controller,
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
                                        color: primaryColor.withOpacity(.5),
                                        borderRadius:
                                            BorderRadius.circular(50)),
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
                                // Indicator

                                Container(
                                  child: SmoothPageIndicator(
                                    effect: SlideEffect(
                                        activeDotColor: primaryColor),
                                    controller: _controller,
                                    count: snapshot.data![0].attributes!.images!
                                        .data!.length,
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                // ? price
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "\$" +
                                          snapshot.data![0].attributes!.price
                                              .toString(),
                                      style: bold_16(color: primaryColor),
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
                                      snapshot.data![0].attributes!.model !=
                                              null
                                          ? RichText(
                                              text: TextSpan(
                                                  text: checkNullText(snapshot
                                                      .data![0]
                                                      .attributes!
                                                      .model
                                                      .toString()),
                                                  style: bold_24(
                                                      color: mainTextColor)),
                                            )
                                          : Container(),
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
                                  child: SizedBox(
                                    height: 40,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        //? cpu type
                                        snapshot.data![0].attributes!.cpuType!
                                                    .data !=
                                                null
                                            ? Container(
                                                height: 40.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: primaryColor,
                                                ),
                                                child: Center(
                                                  child: RichText(
                                                    text: TextSpan(
                                                        text: checkNullText(
                                                            snapshot
                                                                .data![0]
                                                                .attributes!
                                                                .cpuType!
                                                                .data!
                                                                .attributes!
                                                                .name
                                                                .toString()),
                                                        style: normal_16()),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        const SizedBox(width: 10.0),
                                        //? hard size and type
                                        snapshot.data![0].attributes!
                                                        .prHardSize!.data !=
                                                    null &&
                                                snapshot.data![0].attributes!
                                                        .prHardType !=
                                                    null
                                            ? Container(
                                                height: 40.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: primaryColor,
                                                ),
                                                child: Center(
                                                  child: RichText(
                                                    text: TextSpan(
                                                        text: checkNullText(
                                                                snapshot
                                                                    .data![0]
                                                                    .attributes!
                                                                    .prHardSize!
                                                                    .data!
                                                                    .attributes!
                                                                    .name
                                                                    .toString()) +
                                                            " " +
                                                            checkNullText(
                                                                snapshot
                                                                    .data![0]
                                                                    .attributes!
                                                                    .prHardType!
                                                                    .data!
                                                                    .attributes!
                                                                    .name
                                                                    .toString()),
                                                        style: normal_16()),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        const SizedBox(width: 10.0),
                                        //? ram size
                                        snapshot.data![0].attributes!.ramSize!
                                                    .data !=
                                                null
                                            ? Container(
                                                height: 40.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: primaryColor,
                                                ),
                                                child: Center(
                                                  child: RichText(
                                                    text: TextSpan(
                                                        text: checkNullText(
                                                                snapshot
                                                                    .data![0]
                                                                    .attributes!
                                                                    .ramSize!
                                                                    .data!
                                                                    .attributes!
                                                                    .name
                                                                    .toString()) +
                                                            " Ram",
                                                        style: normal_16()),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025),
                                // ? store
                                snapshot.data![0].attributes!.store!.data !=
                                        null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0,
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: RichText(
                                            text: TextSpan(
                                                text: "Store : " +
                                                    checkNullText(snapshot
                                                        .data![0]
                                                        .attributes!
                                                        .store!
                                                        .data!
                                                        .attributes!
                                                        .name
                                                        .toString()),
                                                style: bold_18(
                                                    color: mainTextColor)),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025),
                                //? stock
                                snapshot.data![0].attributes!.stock!.data !=
                                        null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: RichText(
                                            text: TextSpan(
                                                text: checkNullText(snapshot
                                                    .data![0]
                                                    .attributes!
                                                    .stock!
                                                    .data!
                                                    .attributes!
                                                    .name
                                                    .toString()),
                                                style: normal_16(
                                                    color: mainTextColor)),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.025),
                                // ? Details
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Details",
                                            style:
                                                bold_24(color: primaryColor)),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        RichText(
                                          overflow: TextOverflow.clip,
                                          text: TextSpan(
                                            text: 'Status:',
                                            style:
                                                bold_18(color: mainTextColor),
                                            children: [
                                              TextSpan(
                                                  text: "   " +
                                                      checkNullText(snapshot
                                                          .data![0]
                                                          .attributes
                                                          ?.status
                                                          ?.data
                                                          ?.attributes
                                                          ?.name
                                                          .toString()) +
                                                      " ",
                                                  style: normal_16(
                                                      color: mainTextColor))
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        RichText(
                                          overflow: TextOverflow.clip,
                                          text: TextSpan(
                                            text: 'screenSize:',
                                            style:
                                                bold_18(color: mainTextColor),
                                            children: [
                                              TextSpan(
                                                  text: "   " +
                                                      checkNullText(snapshot
                                                          .data![0]
                                                          .attributes
                                                          ?.screenSize
                                                          ?.data
                                                          ?.attributes
                                                          ?.name
                                                          .toString()) +
                                                      " ",
                                                  style: normal_16(
                                                      color: mainTextColor))
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        RichText(
                                          overflow: TextOverflow.clip,
                                          text: TextSpan(
                                            text: 'OS:',
                                            style:
                                                bold_18(color: mainTextColor),
                                            children: [
                                              TextSpan(
                                                  text: "   " +
                                                      checkNullText(snapshot
                                                          .data![0]
                                                          .attributes
                                                          ?.operatingSystem
                                                          ?.data
                                                          ?.attributes
                                                          ?.name
                                                          .toString()) +
                                                      " ",
                                                  style: normal_16(
                                                      color: mainTextColor))
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        RichText(
                                          overflow: TextOverflow.clip,
                                          text: TextSpan(
                                            text: 'ram speed:',
                                            style:
                                                bold_18(color: mainTextColor),
                                            children: [
                                              TextSpan(
                                                  text: "   " +
                                                      checkNullText(snapshot
                                                          .data![0]
                                                          .attributes
                                                          ?.ramSpeed
                                                          ?.data
                                                          ?.attributes
                                                          ?.name
                                                          .toString()) +
                                                      " ",
                                                  style: normal_16(
                                                      color: mainTextColor))
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5.0),
                                        RichText(
                                          overflow: TextOverflow.clip,
                                          text: TextSpan(
                                            text: 'ram type:',
                                            style:
                                                bold_18(color: mainTextColor),
                                            children: [
                                              TextSpan(
                                                  text: "   " +
                                                      checkNullText(snapshot
                                                          .data![0]
                                                          .attributes
                                                          ?.ramType
                                                          ?.data
                                                          ?.attributes
                                                          ?.name
                                                          .toString()) +
                                                      " ",
                                                  style: normal_16(
                                                      color: mainTextColor))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
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
