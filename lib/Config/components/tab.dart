
import 'package:flutter/material.dart';


import 'abut.dart';

class tap extends StatefulWidget {
  const tap({Key? key}) : super(key: key);

  @override
  State<tap> createState() => _tapState();
}

class _tapState extends State<tap> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
        child: Expanded(
          child: Column(
            children: [
              SizedBox(height: 12,),
              Container(

                color: Color(0xFF2a9d8f),
                child: TabBar(tabs:
                [

                  Tab(text: "Details",
                    // icon: Icon(Icons.home,color: Colors.white,),
                  ),
                  Tab(text: "Posts",
                    // icon: Icon(Icons.home,color: Colors.white,),
                  ),

                ],

                ),
              ),
            




              Expanded(
                child: TabBarView(children: [
                 //1st tab
                   Container(
                     child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Icon(Icons.location_on,color: Colors.black,),
                              SizedBox(width: 6,),
                              Text("Sanaa,Hadh ",style: TextStyle(fontSize: 16,),),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Icon(Icons.phone,color: Colors.black,),
                              SizedBox(width: 6,),
                              Text("77665544 ",style: TextStyle(fontSize: 16,),),
                            ],
                          ),

                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Icon(Icons.email,color: Colors.black,),
                              SizedBox(width: 6,),
                              Text("al@gmail.com ",style: TextStyle(fontSize: 16,),),
                            ],
                          ),

                         SizedBox(height: 6,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("descriptionn:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),

                              Row(
                                children: [
                                  SizedBox(width: 6,),
                                  description()
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                 //2an tab
                  Container(
                    child: Center(
                      child: Text("2an tab"),
                    ),
                  ),

                ]
                ),
              )
            ],

          ),
        ));
  }
}
