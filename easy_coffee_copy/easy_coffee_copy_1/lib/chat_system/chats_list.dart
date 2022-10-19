import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:easy_coffee_copy_1/chat_system/chat_screen.dart';
import 'package:easy_coffee_copy_1/chat_system/states/lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Chats extends StatefulWidget {
  const Chats({Key key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
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
                    return Observer(
                        builder: (_) => CupertinoListTile(
                              leading: CircleAvatar(
                                radius: 20,
                              ),
                              onTap: (() => CallChatScreen(
                                  context, data['name'], data['uid'])),
                              title: Text(data['friendName']),
                              subtitle: Text(data['msg']),
                            ));
                  }).toList()),
                ),
              ],
            ));
  }
}
