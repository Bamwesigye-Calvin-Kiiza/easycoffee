import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:easy_coffee_copy_1/chat_system/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class People extends StatelessWidget {
  People({Key key}) : super(key: key);
  var currentUser = FirebaseAuth.instance.currentUser.uid;

  void CallChatScreen(BuildContext context, String name, String uid) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => ChatScreen(
                  friendName: name,
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
              child: CircularProgressIndicator(color: Colors.green),
            );
          }

          if (snapshot.hasData) {
            return CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                    snapshot.data.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return CupertinoListTile(
                    onTap: (() =>
                        CallChatScreen(context, data['name'], data['uid'])),
                    title: Text(
                      data['name'],
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(data['status'],
                        style: TextStyle(color: Colors.white)),
                  );
                }).toList()),
              ),
            ]);
          }
        });
  }
}

/*class People extends StatelessWidget {
  People({Key key}) : super(key: key);
  var currentUser = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .where('uid', isNotEqualTo: currentUser)
                .snapshots(),
            // ignore: missing_return
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshop) {
              if (snapshop.hasError) {
                return Center(
                  child: Text('Something went wrong'),
                );
              }

              if (snapshop.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshop.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshop.hasData) {
                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                          snapshop.data.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data();
                        return ListTile(
                          //title: Text(data['name']),
                          subtitle: Text(data['status']),
                        );
                      }).toList()),
                    )
                  ],
                );
              }
            }));
  }
}

 if (snapshot.hasData) {
    var snapshot;
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text('People'),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            snapshot.data.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                return ListTile(
                  onTap: ()=> callChatscreen(data['name'],data['uid']),
                  title: Text(data['name']),
                  subtitle: Text(data['status'])
                );
              },
            ).toList(),
          ) ,
          )
      ],
    );
  }
}*/
