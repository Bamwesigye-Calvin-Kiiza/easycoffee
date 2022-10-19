import 'package:easy_coffee_copy_1/chat_system/chats_list.dart';
import 'package:easy_coffee_copy_1/chat_system/people.dart';
import 'package:easy_coffee_copy_1/chat_system/states/lib.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int currentPage = 0;
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
    chatState.refreshChatForCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
            indicatorColor: Colors.green,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
            controller: _tabController,
            tabs: const [
              Tab(
                text: "People",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Chats(),
                People(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
