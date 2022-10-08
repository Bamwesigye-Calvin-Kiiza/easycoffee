import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class farms extends StatelessWidget {
  // final Product product;
  // const DetailsScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 132, 255, 136),
      appBar: buildappbar(context),
      body: finalScreen(),
    );
  }

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
}

//calvo code for final screen
class finalScreen extends StatelessWidget {
  // final Product product;
  // const finalScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
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
                  height: 1000,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 238, 232),
                      //curving at the top
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),

                  //content of the card_0n tap ui
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.all(10),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('farms')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Container(
                                height: 730,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: snapshot.data.docs.map((snap) {
                                    return Card(
                                      color: Color.fromARGB(255, 245, 249, 252),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: SizedBox(
                                        height: 270,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Container(
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        snap['Url'],
                                                      ),
                                                      fit: BoxFit.fill

                                                      // height: 250,
                                                      ), // width: 100,
                                                ),
                                              ),
                                            ),
                                            // title: Center(
                                            //   child: Text(snap['farmerName']
                                            //       .toString()),
                                            // ),

                                            // subtitle: Center(
                                            //   child:
                                            //       Column(children: <Widget>[
                                            //     // Text(snap['District'].toString()),
                                            //     Text(snap['location']
                                            //         .toString()),
                                            //   ]),
                                            // ),

                                            //  trailing: Text(snap['image']),

                                            SizedBox(
                                              height: 100,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        'Farm Name: ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                          snap['Farm_Name']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 19))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        'Type of coffee: ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                          snap['Type']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 19))
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Text(
                                                        'Location: ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                          snap['location']
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 19)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            }),
                      ))
                      //code here
                    ],
                  )

                  //desighn of the background
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(''),
                    Text('Farms',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.brown, fontWeight: FontWeight.bold)),
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
        DetailContentMenu()
      ]),
    );
  }
}

//copyright code and social media handles
class DetailContentMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "© All rights reserved. e_coffee Limited",
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                height: 1.50),
            textAlign: TextAlign.justify,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.whatsapp,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.telegram,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.tiktok,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
