import 'package:e_maecket/Config/style.dart';
import 'package:e_maecket/pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var search = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(bottom: 20 * 2.5),
      // It will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.2 - 27,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 36 + 20,
            ),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'E Market',
                  style: bold_24(
                    color: lightTextColor,
                  ),
                ),
                // const Spacer(),
                // Image.asset("assets/images/logo.png")
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryPage(
                                  title: "Search",
                                  apiEntry: 'products?populate=*&filters[\$or][0][type][name][\$containsi]=' +
                                      search.text +
                                      '&filters[\$or][1][model][\$containsi]=' +
                                      search.text +
                                      '&filters[\$or][2][brand][name][\$containsi]=' +
                                      search.text +
                                      '&filters[\$or][3][price][\$eq]=' +
                                      search.text),
                            ),
                          );
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
              ))
        ],
      ),
    );
  }
}
