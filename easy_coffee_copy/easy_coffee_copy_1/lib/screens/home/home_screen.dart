import 'package:easy_coffee_copy_1/screens/home/menu_bar.dart';
import 'package:easy_coffee_copy_1/screens/home/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/body1.dart';

class HomeScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 124, 223, 128)));
  }

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      endDrawer: NavBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          color: Color.fromARGB(255, 62, 243, 68),
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: (() {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                }),
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Body(),
    ));
  }
}

//home screen code

//class HomeScreen extends StatelessWidget {
 // @override
 // Widget build(BuildContext context) {
//    return Scaffold(
//      endDrawer: NavBar(),
 //     appBar: buildappbar(),
 //     body: Body(),
 //   );
 // }

//  AppBar buildappbar() {
 //   return AppBar(
 //     backgroundColor: Color.fromARGB(255, 113, 251, 117),
 //     elevation: 0,
 //     leading: IconButton(
 //       onPressed: () {
 //         showSearch(context: context, delegate: CustomSearchDelegate());
 //       },
 //       icon: Icon(Icons.search, color: Colors.black),
 //     ),
 //     actions: [
 //       Builder(
 //         builder: (context) => GestureDetector(
 //           onTap: () {
 //             Scaffold.of(context).openEndDrawer();
 //           },
 //           child: Icon(
 //             Icons.menu,
 //             color: Colors.black,
 //           ),
 //         ),
 //       ),
  //      SizedBox(width: 10)
  //    ],
 //   );
//  }
//}
