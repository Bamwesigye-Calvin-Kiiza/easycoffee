import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/home/home_screen.dart';
import 'adminscreen.dart';
import 'extension_worker.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String role = 'user';

  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole() async {
    User user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection('All').doc(user.uid).get();

    setState(() {
      role = snap['role'];
    });

    if (role == 'user') {
      navigateNext(HomeScreen());
    } else if (role == 'admin') {
      navigateNext(AdminScreen());
    } else if (role == 'extension_worker') {
      navigateNext(extension_worker());
    }
  }

  void navigateNext(Widget route) {
    Timer(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => route));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 234, 224),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: CircularProgressIndicator())
            // Text('Welcome',
            //     style: Theme.of(context).textTheme.headline4?.copyWith(
            //         color: Colors.brown, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
