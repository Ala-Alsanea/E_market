
import 'package:flutter/material.dart';

import '../Config/components/tab.dart';


class profilapage extends StatefulWidget {
  const profilapage({Key? key}) : super(key: key);

  @override
  State<profilapage> createState() => _profilapageState();
}

class _profilapageState extends State<profilapage> {
  @override
  final double coverHeight=250;
  final double profileHeight=130;
  Widget build(BuildContext context) {

   // final top =coverHeight -   profileHeight/2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text("E markt", style: TextStyle(color: Color(0xFF2a9d8f),fontWeight: FontWeight.bold),)),
      ),
      body:Column(
        children: [
          Expanded(
            child: Column(
              children:<Widget> [
                buildStackPorfila(),
                tap(),
               // tap2()


              ],

            ),
          ),
        ],
      ),

    );
  }

  Stack buildStackPorfila() {
    final top =coverHeight -   profileHeight/2;
    final bottom = profileHeight /2;

    return Stack(
      clipBehavior: Clip.none,
      alignment:Alignment.centerLeft ,
      children: [
        Container(
        margin: EdgeInsets.only(bottom:bottom ),
        child: buildCoverImage(),
      ),
       Positioned(
         top:top ,
         child: buildProfilaImage(),)

      ],
  );
  }

  buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV7AshBw-aFd1kvPauyiqxBca5mvEhgn9pgQ&usqp=CAU'

      ,width: double.infinity,
      height: coverHeight ,
      fit: BoxFit.cover,
    ),

  );

  buildProfilaImage() =>Row(
    children: [

      CircleAvatar(
                 radius: profileHeight /2,
             backgroundColor: Colors.grey.shade50,
        backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV7AshBw-aFd1kvPauyiqxBca5mvEhgn9pgQ&usqp=CAU'),

      ),

      buildConten()
    ],
  );

  buildConten()=>Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 50,),

          Text("Name of profila",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
        ],
      ),
    );



}
