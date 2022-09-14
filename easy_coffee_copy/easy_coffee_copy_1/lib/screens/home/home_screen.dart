
import 'package:easy_coffee_copy_1/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(),
      body: Body(),
    );
  }

  AppBar buildappbar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 113, 251, 117),
      elevation: 0,
      leading: IconButton(onPressed: (){}, icon: Icon(Icons.search,
      color: Colors.black),
      ),
      
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.menu,
      color: Colors.black),
      color: Colors.transparent),
      
      SizedBox(width: 10 )],
    );
  }
}
