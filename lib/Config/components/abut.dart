
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class description extends StatelessWidget {
String content="gvghvghbvvvvv jhhnjk kjnkjn kjnkjn kjnjn kjnjkn kjnkjn kjnjknkljn kjnjkn "
    "jknkll kjmk lkj lij lijl. j ijil kjjnk jijj  hgjh htg"
    "jknkll kjmk lkj lij lijl. j ijil kjjnk jijj jijknkj jijk jhiuk fluyfyu hygjhb hgjh htg""jhhgujug hgvbv";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(2 ),
          child: ReadMoreText(
             content,
            trimLines: 5,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: "Show More",
            trimExpandedText: "Show Less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
                color: Colors.black54

            ),



          ),
        ),

      ),
    );
  }
}
