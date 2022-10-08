import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:easy_coffee_copy_1/chat_system/states/lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'chat_screen.dart';

class Chats extends StatefulWidget {
  const Chats({Key key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatState();
}

class _ChatState extends State<Chats> {
  @override
  void initState() {
    super.initState();
    chatState.refreshChatForCurrentUser();
  }

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
    return Observer(
        builder: (BuildContext context) => CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                      chatState.messages.values.toList().map((data) {
                    return CupertinoListTile(
                      onTap: (() =>
                          CallChatScreen(context, data['name'], data['uid'])),
                      title: Text(data['friendName']),
                      subtitle: Text(data['msg']),
                    );
                  }).toList()),
                ),
              ],
            ));
  }
}
