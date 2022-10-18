import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:easy_coffee_copy_1/chat_system/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class People extends StatelessWidget {
  People({Key key}) : super(key: key);
  var currentUser = FirebaseAuth.instance.currentUser.uid;

  void CallChatScreen(BuildContext context, String farmerName, String uid) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ChatScreen(
                  friendName: farmerName,
                  friendUid: uid,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('uid', isNotEqualTo: currentUser)
            .snapshots(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.orange),
            );
          }

          if (snapshot.hasData) {
            return Container(
                color: Colors.white,
                child: CustomScrollView(slivers: [
                  CupertinoSliverNavigationBar(
                    largeTitle: Text(
                      "Chats",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.orange,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return CupertinoListTile(
                        onTap: (() => CallChatScreen(
                            context, data['farmerName'], data['uid'])),
                        title: Text(
                          data['farmerName'],
                          style: TextStyle(color: Colors.black),
                        ),
                        /*subtitle: Text(data['status'],
                        style: TextStyle(color: Colors.white)),*/
                      );
                    }).toList()),
                  ),
                ]));
          }
        });
  }
}
