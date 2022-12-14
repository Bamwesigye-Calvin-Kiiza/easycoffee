import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';

class ChatScreen extends StatefulWidget {
  final String friendUid;
  final String friendName;

  ChatScreen({Key key, this.friendUid, this.friendName}) : super(key: key);

  @override
  _ChatScreen createState() => _ChatScreen(friendUid, friendName);
}

class _ChatScreen extends State<ChatScreen> {
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  final String friendUid;
  final String friendName;
  final currentUserId = FirebaseAuth.instance.currentUser.uid;
  var chatDocId;
  var _textController = new TextEditingController();

  _ChatScreen(this.friendUid, this.friendName);
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    await chats
        .where('users', isEqualTo: {friendUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
              setState(() {
                chatDocId = querySnapshot.docs.single.id;
              });
              print(chatDocId);
            } else {
              await chats.add({
                'users': {currentUserId: null, friendUid: null},
                'names': {
                  currentUserId: FirebaseAuth.instance.currentUser?.displayName,
                  friendUid: friendName
                }
              }).then((value) => {chatDocId = value});
            }
          },
        )
        .catchError((error) {});
  }

  void sendMessage(String msg) {
    if (msg == '') return;
    chats.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'friendName': friendName,
      'msg': msg,
    }).then((value) {
      _textController.text = '';
    });
  }

  bool isSender(String friend) {
    return friend == currentUserId;
  }

  Alignment getAlignment(friend) {
    if (friend == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(chatDocId)
            .collection('messages')
            .orderBy('createdOn', descending: true)
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
                child: CircularProgressIndicator(color: Colors.orange));
          }

          if (snapshot.hasData) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: Colors.orange,
                middle: Text(friendName, style: TextStyle(color: Colors.white)),
              ),
              child: SafeArea(
                  child: Column(
                children: [
                  Expanded(
                      child: ListView(
                    reverse: true,
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ChatBubble(
                          clipper: ChatBubbleClipper6(
                            nipSize: 0,
                            radius: 25,
                            type: isSender(data['uid'].toString())
                                ? BubbleType.sendBubble
                                : BubbleType.receiverBubble,
                          ),
                          alignment: getAlignment(data['uid'].toString()),
                          margin: EdgeInsets.only(top: 20),
                          backGroundColor: isSender(data['uid'].toString())
                              ? Colors.orange
                              : Color(0xffe7e7ed),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(data['msg'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              isSender(data['uid'].toString())
                                                  ? Colors.white
                                                  : Colors.black),
                                      maxLines: 100,
                                      overflow: TextOverflow.ellipsis)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    data['CreatedOn'] == null
                                        ? DateTime.now().toString()
                                        : data['CreatedOn'].toDate().toString(),
                                    style: TextStyle(
                                        fontSize: 7,
                                        color: isSender(data['uid'].toString())
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              )
                            ]),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: CupertinoTextField(
                            controller: _textController,
                          ),
                        ),
                      ),
                      CupertinoButton(
                        child: Icon(Icons.send_sharp),
                        onPressed: () => sendMessage(_textController.text),
                      )
                    ],
                  )
                ],
              )),
            );
          }
        });
  }
}
