import 'package:easy_coffee_copy_1/profiles/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'colors_utill.dart';
import 'login.dart';

class SignIN extends StatefulWidget {
  const SignIN({key});

  @override
  State<SignIN> createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
  TextEditingController _homeTownTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign-Up",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("00c853"),
              hexStringToColor("4caf50"),
              hexStringToColor("c6ff00")
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
                    reusableTextField("Enter Userame", Icons.person_outline,
                        false, _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter E-mail", Icons.person_outline,
                        false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outline,
                        true, _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter Phone number",
                        Icons.phone_android_outlined,
                        false,
                        _phoneNumberTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Enter Home Address",
                        Icons.holiday_village_outlined,
                        false,
                        _homeTownTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseButton(context, 'Sign-Up', () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => LogIn())));
                      }).onError((error, stackTrace) {
                        print("Error${error.toString()}");
                      });
                    }),
                  ],
                ))),
      ),
    );
  }
}
