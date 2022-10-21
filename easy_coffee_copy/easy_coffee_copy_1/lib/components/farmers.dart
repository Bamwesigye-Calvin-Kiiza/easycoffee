import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'farmersprofiledesign.dart';

class farmersScreen extends StatelessWidget {
  // final Product product;
  // const DetailsScreen({key, this.product});
  // farmersScreen({Key key}) : super(key: key) {
  //   _referencePosts = FirebaseFirestore.instance.collection('users');
  //   _future = _referencePosts.get();
  // }
  // CollectionReference _referencePosts;
  // Future<QuerySnapshot> _future;
  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
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
  finalScreen({Key key}) : super(key: key) {
    _referencePosts = FirebaseFirestore.instance.collection('users');
    _future = _referencePosts.get();
  }
  CollectionReference _referencePosts;
  Future<QuerySnapshot> _future;
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
                          image: AssetImage('assets/images/landhealth.webp'),
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
                child: FutureBuilder<QuerySnapshot>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error:${snapshot.error}'));
                    }

                    if (snapshot.hasData) {
                      QuerySnapshot data = snapshot.data;
                      List<QueryDocumentSnapshot> documents = data.docs;
                      List<Map> items = documents
                          .map((e) => {
                                'id': e.id,
                                'Farm_Name': e['Farm_Name'],
                                'farmerName': e['farmerName'],
                                'imgUrl': e['imgUrl'],
                                'location': e['location'],
                                'Url': e['Url'],
                                'About farm': e['About farm'],
                                'Age': e['Age'],
                                // 'farm': e['farm'],
                                'Biography': e['Biography'],
                                'Contact': e['Contact'],
                                'Type': e['Type'],
                                'email': e['email'],
                              })
                          .toList();

                      return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            Map thisItem = items[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            farmersprofile_page(
                                                thisItem) //HomePage()
                                        ));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
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
                                                  thisItem['imgUrl'],
                                                ),
                                                fit: BoxFit.fill

                                                // height: 250,
                                                ), // width: 100,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text('Name: '),
                                                Text(
                                                    thisItem['farmerName']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 19))
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Address: '),
                                                Text(
                                                    thisItem['location']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 19)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                            // ListTile(
                            //   onTap: () {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => Detail(thisItem)));
                            //   },
                            //   title: Text(thisItem['Farm_Name']),
                            // );
                          });
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                ),

                //desighn of the background
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(''),
                    Text('Farmers',
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
