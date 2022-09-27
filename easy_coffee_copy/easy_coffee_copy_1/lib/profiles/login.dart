import 'package:easy_coffee_copy_1/profiles/sign-in.dart';
import 'package:easy_coffee_copy_1/profiles/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import 'colors_utill.dart';
import 'forgot.dart';

class LogIn extends StatefulWidget {
  const LogIn({key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
      ),
      // title: const Text(
      //   'E_Coffee',
      //   style: TextStyle(
      //       fontSize: 50,
      //       fontFamily: "IndieFlower",
      //       fontWeight: FontWeight.bold),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("76ff03"),
              hexStringToColor("c6ff00"),
              hexStringToColor("827717")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.fromLTRB(
                    20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin: EdgeInsets.fromLTRB(1, 0, 1, 0),
                      color: Colors.transparent,
                      child: Text(
                        'E_Coffee',
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: 40,
                            fontFamily: "IndieFlower",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    logowidget("assets/images/yan.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    reusableTextField("Enter E-mail", Icons.person_outline,
                        false, _emailTextController),
                    const SizedBox(
                      height: 10,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outline,
                        true, _passwordTextController),
                    forgot(context),
                    firebaseButton(context, 'Log-in', () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomeScreen())));
                      }).onError((error, stackTrace) {
                        print('Error ${error.toString()}');
                      });
                    }),
                    sighUp()
                  ],
                ))),
      ),
    );
  }

  Row sighUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Don't have an account",
          style: TextStyle(fontSize: 14, color: Colors.white70),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: ((context) => SignIN()))),
          child: const Text(
            "    Sign-Up",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgot(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomRight,
        child: TextButton(
          child: const Text(
            'forgotpassword?',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => ForgotPassword())));
          },
        ));
  }
}
