import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:easy_coffee_copy_1/components/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<QuerySnapshot> _future;
  Future<QuerySnapshot<Map<String, dynamic>>> _Future =
      FirebaseFirestore.instance.collection('tools').get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => Toolscreen()));
      //   },
      //   child: Icon(Icons.add),
      // ),
      body: FutureBuilder<QuerySnapshot>(
        future: _Future,
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
                      'imagePath': e['imagePath'],
                      'price': e['price'],
                      'description': e['description'],
                      'category': e['category'],
                      'name': e['name'],
                    })
                .toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0)),
                  Container(
                    height: 600.0,
                    width: 900,
                    child: ListView.builder(
                      itemCount: documents.length,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(left: 20.0),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (itemBuilder, index) {
                        Map thisItem = items[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Detail(thisItem)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Container(
                              width: 350.0,
                              height: 200.0,
                              margin:
                                  const EdgeInsets.only(right: 20, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10),
                                        child: Container(
                                          height: 180,
                                          width: 155,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  thisItem['imagePath'],
                                                ),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      SizedBox(
                                        height: 150,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Category',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                                const SizedBox(width: 10.0),
                                                Text(
                                                  thisItem['category'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Tool:',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                const SizedBox(width: 10.0),
                                                Text(
                                                  thisItem['name'],
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color.fromARGB(
                                                            255, 133, 83, 66)
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Price',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  'UGX-${thisItem['price']}',
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
