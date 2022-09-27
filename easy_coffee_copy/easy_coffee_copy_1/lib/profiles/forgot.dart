import 'package:easy_coffee_copy_1/profiles/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'colors_utill.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailTextController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset-Password",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("c6ff00"),
              hexStringToColor("4caf50"),
              hexStringToColor("00c853")
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
                    const SizedBox(
                      height: 20,
                    ),
                    logowidget("assets/with.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    reusableTextField("Enter E-mail", Icons.person_outline,
                        false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseButton(context, 'Reset Password', () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(
                            email: _emailTextController.text,
                          )
                          .then((value) => Navigator.of(context).pop());
                    }),
                  ],
                ))),
      ),
    );
  }
}
