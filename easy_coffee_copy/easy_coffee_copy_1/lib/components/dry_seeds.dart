import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../core/color.dart';
import 'farm_tools.dart';
import 'flutterwave.dart';

class Dry_seeds extends StatelessWidget {
  // final Product product;
  // const DetailsScreen({key, this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 141, 121),
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
    );
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
                            image: AssetImage('assets/images/coffe_type.jpg'),
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
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: harvest2()),
                //content of the card_0n tap ui

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(''),
                      Text('Harvest',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold)),

                      Row(
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                          ])),
                        ],
                      ) //headlining word
                    ],
                  ),
                ),
              ],
            )),
        DetailContentMenu()
      ]),
    );
  }
}

class harvest2 extends StatelessWidget {
  harvest2({Key key}) : super(key: key) {
    _referencePosts = FirebaseFirestore.instance.collection('harvest');
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
                    'content': e['content'],
                    'Url': e['Url'],
                  })
              .toList();

          return PageView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                Map thisItem = items[index];
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(thisItem['Url']),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '\n\n\n\n\t${thisItem['title'].toString()}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          thisItem['content'].toString(),
                          style: TextStyle(fontSize: 19),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
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
