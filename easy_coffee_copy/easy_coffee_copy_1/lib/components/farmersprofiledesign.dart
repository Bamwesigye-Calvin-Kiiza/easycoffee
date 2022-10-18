import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//calvo code for final screen
class farmersprofile_page extends StatelessWidget {
  farmersprofile_page(this.data, {Key key}) : super(key: key) {
    CollectionReference _referencePosts =
        FirebaseFirestore.instance.collection('users');
    Future<QuerySnapshot> _future = _referencePosts.get();
  }

  Map data;
  AppBar buildappbar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.black),
              color: Colors.transparent),
          SizedBox(
            width: 10,
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 220, 171),
        appBar: buildappbar(context),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Container(
                // color: Colors.black12,
                // padding: EdgeInsets.all(18),
                child: SingleChildScrollView(
                    child: Column(children: [
              SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/images/fields.webp'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: size.height * 0.12),
                        // height:1000,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 238, 232)),
                        //curving at the top
                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(50),
                        //     topRight: Radius.circular(50))),
                        child: SingleChildScrollView(
                            child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          height: 200,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        data['imgUrl'],
                                                      ),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          height: 250,
                                          child: Container(
                                            color: Color.fromARGB(
                                                255, 255, 238, 232),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Row(
                                                    children: [
                                                      Text('NAME:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(data['farmerName'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 15))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Row(
                                                    children: [
                                                      Text('AGE:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(data['Age'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 19))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Row(
                                                    children: [
                                                      Text('FARM NAME:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(data['Farm_Name'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 19))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Row(
                                                    children: [
                                                      Text('LOCATION:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(data['location'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 19))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Row(
                                                    children: [
                                                      Text('COFFEE TYPE:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(data['Type'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 19))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Row(
                                                    children: [
                                                      Text('PHONE NO.:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(data['Contact'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 19))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Row(
                                                    children: [
                                                      Text('Email:'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(data['email'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Divider(
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Center(
                                          child: Text(
                                        'BRIEF BACKGROUND',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Color.fromARGB(
                                              255, 255, 230, 220),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                data['Biography'].toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 10, 10, 10),
                                                    fontSize: 19)),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Divider(
                                      height: 1,
                                    ),
                                    Container(
                                      child: Center(
                                          child: Text(
                                        'FARM ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    Divider(
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 300,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      data['Url'],
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Color.fromARGB(
                                              255, 255, 230, 220),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                data['About farm'].toString(),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 5, 5, 5),
                                                    fontSize: 19)),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: ElevatedButton(
                                          child: Text(
                                            'Message farmer',
                                          ),
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor:
                                                Colors.orange.shade300,
                                            // shape:BeveledRectangleBorder(
                                            //     borderRadius:
                                            //         BorderRadius.all(Radius.circular(0))),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    )
                                  ]),
                            ),
                          ),
                        ]))
                        //content of the card_0n tap ui

                        //desighn of the background
                        ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(''),
                          Center(
                            child: Text('ABOUT FARMER',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        ?.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold))
                              ])),
                            ],
                          ) //headlining word
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]))),
          ),
        ));
  }
}

// //copyright code and social media handles
// class DetailContentMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(
//             "© All rights reserved. e_coffee Limited",
//             style: TextStyle(
//                 fontSize: 15.0,
//                 color: Colors.black87,
//                 fontWeight: FontWeight.w400,
//                 height: 1.50),
//             textAlign: TextAlign.justify,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: IconButton(
//                   onPressed: null,
//                   icon: Icon(
//                     Icons.facebook,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: IconButton(
//                   onPressed: null,
//                   icon: Icon(
//                     Icons.whatsapp,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: IconButton(
//                   onPressed: null,
//                   icon: Icon(
//                     Icons.telegram,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(6.0),
//                 child: IconButton(
//                   onPressed: null,
//                   icon: Icon(
//                     Icons.tiktok,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
