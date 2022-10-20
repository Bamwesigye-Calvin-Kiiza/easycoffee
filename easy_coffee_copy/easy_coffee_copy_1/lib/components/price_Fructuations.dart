import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class price_fructuatations extends StatelessWidget {
  // final Product product;
  // const DetailsScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 250, 238),
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
                          image: AssetImage('assets/images/graph.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.12),
                  height: 4500,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 252, 231, 223),
                      //curving at the top
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: pricing()
                  //  ListView(children: <Widget>[
                  //   Center(
                  //     child: Text('Kiboko',
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .headline3
                  //             ?.copyWith(
                  //                 color: Colors.brown,
                  //                 fontWeight: FontWeight.bold)),
                  //   ),
                  //   DataTable(
                  //     columns: [
                  //       DataColumn(
                  //           label: Text('Catergories',
                  //               style: TextStyle(
                  //                   fontSize: 24,
                  //                   fontWeight: FontWeight.bold))),
                  //       DataColumn(
                  //           label: Text('Price in UGX',
                  //               style: TextStyle(
                  //                   fontSize: 24,
                  //                   fontWeight: FontWeight.bold))),
                  //     ],
                  //     rows: [
                  //       DataRow(cells: [
                  //         DataCell(Text('Cherry',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //         DataCell(Text('3,000/= - 4,000/=',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //       ]),
                  //       DataRow(cells: [
                  //         DataCell(Text('Bean',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //         DataCell(Text('5,000/= - 7,000/=',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //       ]),
                  //       DataRow(cells: [
                  //         DataCell(Text('Dry beans',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //         DataCell(Text('8,800/= - 7,300/=',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //       ]),
                  //       DataRow(cells: [
                  //         DataCell(Text('Husks',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //         DataCell(Text('6,400/= - 7,000/=',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //       ]),
                  //       DataRow(cells: [
                  //         DataCell(Text('Powder',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //         DataCell(Text('8,900/= - 10,000/=',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //       ]),
                  //     ],
                  //   ),
                  //   Center(
                  //     child: Text('Seedlings',
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .headline3
                  //             ?.copyWith(
                  //                 color: Colors.brown,
                  //                 fontWeight: FontWeight.bold)),
                  //   ),
                  //   DataTable(
                  //     columns: [
                  //       DataColumn(
                  //           label: Text('Age',
                  //               style: TextStyle(
                  //                   fontSize: 24,
                  //                   fontWeight: FontWeight.bold))),
                  //       DataColumn(
                  //           label: Text('Price in UGX',
                  //               style: TextStyle(
                  //                   fontSize: 24,
                  //                   fontWeight: FontWeight.bold))),
                  //     ],
                  //     rows: [
                  //       DataRow(cells: [
                  //         DataCell(Text('3 Months',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //         DataCell(Text('3,210/= - 4,300/=',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //       ]),
                  //       DataRow(cells: [
                  //         DataCell(Text('6 Months',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //         DataCell(Text('4,250/= - 5,200/=',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //       ]),
                  //       DataRow(cells: [
                  //         DataCell(Text('9 Months',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //         DataCell(Text('5,200/= - 6,150/=',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //       ]),
                  //       DataRow(cells: [
                  //         DataCell(Text('12 Months',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //         DataCell(Text('6,800/= - 7,300/=',
                  //             style: TextStyle(
                  //                 fontSize: 17, fontWeight: FontWeight.bold))),
                  //       ]),
                  //     ],
                  //   ),
                  // ])
                  //content of the card_0n tap ui
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,

                  // children: [

                  //   Padding(
                  //       padding: EdgeInsets.all(20),
                  //       child: (Text('dhggfhgfjhhghgf')
                  //       )) //code here
                  //],
                  //)

                  //desighn of the background
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(''),
                    Text('Price  Fructuation',
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

class pricing extends StatelessWidget {
  pricing({Key key}) : super(key: key) {
    _referencePosts = FirebaseFirestore.instance.collection('Prices');
    _future = _referencePosts.get();
  }
  CollectionReference _referencePosts;
  Future<QuerySnapshot> _future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _future,
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Text('something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          QuerySnapshot data = snapshot.data;
          List<QueryDocumentSnapshot> documents = data.docs;
          List<Map> items = documents
              .map((e) => {
                    'id': e.id,
                    'title': e['title'],
                    'cherry': e['cherry'],
                    'bean': e['bean'],
                    'Dry': e['Dry'],
                    'husk': e['husk'],
                    'Processed': e['Processed'],
                    '3 Months': e['3 Months'],
                    '6 Months': e['6 Months'],
                    '9 Months': e['9 Months'],
                    '12 Months': e['12 Months'],
                  })
              .toList();

          return PageView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                Map thisItem = items[index];
                return ListView(
                  children: [
                    //],)
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            // Center(
                            //   child: Text(thisItem['title'],
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .headline3
                            //           ?.copyWith(
                            //               color: Colors.brown,
                            //               fontWeight: FontWeight.bold)),
                            // ),
                            DataTable(
                              columns: [
                                DataColumn(
                                    label: Text('Catergories',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Price in UGX',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold))),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text('Cherry',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text('${thisItem['cherry']}/=',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Bean',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text('${thisItem['bean']}/=',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Dry beans',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text('${thisItem['Dry']}/=',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Husked coffee',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text('${thisItem['husks']}/=',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('Processed',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                  DataCell(Text('${thisItem['Processed']}/=',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold))),
                                ]),
                              ],
                            ),
                            // Center(
                            //   child: Text('Seedlings',
                            //       style: Theme.of(context)
                            //           .textTheme
                            //           .headline3
                            //           ?.copyWith(
                            //               color: Colors.brown,
                            //               fontWeight: FontWeight.bold)),
                            // ),
                            // DataTable(
                            //   columns: [
                            //     DataColumn(
                            //         label: Text('Age',
                            //             style: TextStyle(
                            //                 fontSize: 24,
                            //                 fontWeight: FontWeight.bold))),
                            //     DataColumn(
                            //         label: Text('Price in UGX',
                            //             style: TextStyle(
                            //                 fontSize: 24,
                            //                 fontWeight: FontWeight.bold))),
                            //   ],
                            //   rows: [
                            //     DataRow(cells: [
                            //       DataCell(Text('3 Months',
                            //           style: TextStyle(
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.bold))),
                            //       DataCell(Text('${thisItem['3 Months']}/=',
                            //           style: TextStyle(
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.bold))),
                            //     ]),
                            //     DataRow(cells: [
                            //       DataCell(Text('6 Months',
                            //           style: TextStyle(
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.bold))),
                            //       DataCell(Text('${thisItem['6 Months']}/=',
                            //           style: TextStyle(
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.bold))),
                            //     ]),
                            //     DataRow(cells: [
                            //       DataCell(Text('9 Months',
                            //           style: TextStyle(
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.bold))),
                            //       DataCell(Text('${thisItem['9 Months']}/=',
                            //           style: TextStyle(
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.bold))),
                            //     ]),
                            //     DataRow(cells: [
                            //       DataCell(Text('12 Months',
                            //           style: TextStyle(
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.bold))),
                            //       DataCell(Text('${thisItem['12 Months']}/=',
                            //           style: TextStyle(
                            //               fontSize: 17,
                            //               fontWeight: FontWeight.bold))),
                            //     ]),
                            //   ],
                            // ),
                            // Container(
                            //   height: 200,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20),
                            //       image: DecorationImage(
                            //           image: NetworkImage(thisItem['Url']),
                            //           fit: BoxFit.cover)),
                            // ),
                            // Container(
                            //   alignment: Alignment.centerLeft,
                            //   child: Text(
                            //     '\n\n\n\n\t${thisItem['title'].toString()}',
                            //     style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 35,
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
