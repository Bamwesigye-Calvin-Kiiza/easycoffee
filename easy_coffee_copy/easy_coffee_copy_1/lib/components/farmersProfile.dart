import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;

class farmersprofile_page extends StatefulWidget {
  const farmersprofile_page({Key key}) : super(key: key);

  @override
  State<farmersprofile_page> createState() => _farmersprofile_pageState();
}

class _farmersprofile_pageState extends State<farmersprofile_page> {
  String Uid = _auth.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where(Uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              height: 600,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                shrinkWrap: true,
                children: snapshot.data.docs.map((snap) {
                  return SingleChildScrollView(
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
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  snap['imgUrl'],
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
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Text('NAME:'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(snap['farmerName'],
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 15))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Text('AGE:'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(snap['Age'],
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 19))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Text('FARM NAME:'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(snap['Farm_Name'],
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 19))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Text('LOCATION:'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(snap['location'],
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 19))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Text('COFFEE TYPE:'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(snap['Type'],
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 19))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Text('PHONE NO.:'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(snap['Contact'],
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 19))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              children: [
                                                Text('Email:'),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(snap['email'],
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold))
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
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromARGB(255, 255, 230, 220),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(snap['Biography'].toString(),
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
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                snap['Url'],
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
                                    width: MediaQuery.of(context).size.width,
                                    color: Color.fromARGB(255, 255, 230, 220),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(snap['About farm'].toString(),
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 5, 5, 5),
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
                                      backgroundColor: Colors.orange.shade300,
                                      // shape:BeveledRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.all(Radius.circular(0))),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0,
                              )
                            ]),
                      ),
                    ),
                  ]));
                }).toList(),
              ),
            );
          }),
    );
  }
}