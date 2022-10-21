import 'package:easy_coffee_copy_1/admin/Prices.dart';
import 'package:easy_coffee_copy_1/admin/tools.dart';
import 'package:easy_coffee_copy_1/components/farm_tools.dart';
import 'package:easy_coffee_copy_1/screen/crud.dart';
import 'package:easy_coffee_copy_1/screen/farmers.dart';
import 'package:easy_coffee_copy_1/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool _isloading = false;

  // bool ableToEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 204, 202, 187),
        appBar: AppBar(
          title: Text(
            'Admin ',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 18, 211, 24),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginScreen() //HomePage()
                    )),
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: _isloading
                ? Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    child: Builder(builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 250,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/landhealth.webp',
                                              ),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Add Farmer',
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return Farmer();
                                      }),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 250,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/farmtools.jpg',
                                              ),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            'Add FarmTool',
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return ToolsScreen();
                                      }),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return LoginScreen();
                                  }),
                                );
                              },
                              child: Text('log out'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
          ),
        ));
    // Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text("Welcome Admin"),
    //       SizedBox(
    //         height: 50,
    //       ),
    //       TextFormField(
    //         controller: emailController,
    //         decoration: InputDecoration(
    //           hintText: "Email",
    //         ),
    //       ),
    //       GestureDetector(
    //         onTap: () async {
    //           String userEmail = emailController.text.trim();
    //           final QuerySnapshot snap = await FirebaseFirestore.instance
    //               .collection('users')
    //               .where('email', isEqualTo: userEmail)
    //               .get();
    //           setState(() {
    //             email = userEmail;
    //             uid = snap.docs[0]['uid'];
    //             role = snap.docs[0]['role'];
    //             password = snap.docs[0]['password'];
    //             ableToEdit = true;
    //           });
    //         },
    //         child: Container(
    //           height: 50,
    //           width: 100,
    //           color: Colors.blue,
    //           child: Center(
    //             child: Text(
    //               "Get User Data",
    //             ),
    //           ),
    //         ),
    //       ),
    //       ableToEdit
    //           ? GestureDetector(
    //               onTap: () {
    //                 // Navigator.push(
    //                 //     context,
    //                 //     MaterialPageRoute(
    //                 //         builder: (context) => EditUser(
    //                 //               uid: uid,
    //                 //             )));
    //               },
    //               child: Container(
    //                 height: 50,
    //                 width: 100,
    //                 color: Colors.blue,
    //                 child: Center(
    //                   child: Text(
    //                     "Edit User",
    //                   ),
    //                 ),
    //               ),
    //             )
    //           : Container(),
    //       GestureDetector(
    //         onTap: () async {
    //           // Navigator.push(context,
    //           //     MaterialPageRoute(builder: (context) => CreateUser()));
    //         },
    //         child: Container(
    //           height: 50,
    //           width: 100,
    //           color: Colors.blue,
    //           child: Center(
    //             child: Text(
    //               "Create User",
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: 50,
    //       ),
    //       Text('User Data :'),
    //       SizedBox(
    //         height: 50,
    //       ),
    //       Text('Email : ' + email),
    //       Text('UID : ' + uid),
    //       Text('Role : ' + role),
    //       Text('Password : ' + password),
    //     ],
    //   ),
    // );
  }
}
