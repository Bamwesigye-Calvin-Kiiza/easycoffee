import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  String name, imagePath, category, description, price;
  int uid;

  File toolImages;
  bool _isloading = false;

  Future PickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageTemp = File(image.path);
    setState(() {
      toolImages = imageTemp;
    });
  }

  UploadPic() async {
    if (toolImages != null) {
      setState(() {
        _isloading = true;
      });
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('tools')
          .child('${randomAlphaNumeric(7)}.jpg');
      final UploadTask uploadTask = firebaseStorageRef.putFile(toolImages);
      var imagepath = await (await uploadTask).ref.getDownloadURL();
      print('this is the $imagepath');
      Map<String, dynamic> toMap() {
        return {
          if (uid != null) 'uid': uid,
          if (imagePath != null) 'imagePath': imagePath,
          if (price != null) 'price': price,
          if (description != null) 'description': description,
          if (category != null) 'category': category,
          if (name != null) 'name': name,
        };
      }

      crudtools.addData(toMap());
    } else {}
  }

  Crudtools crudtools = new Crudtools();
  // Crud crud = new Crud();

  // TextEditingController emailController = new TextEditingController();
  // String email = " ";
  // String uid = " ";
  // String role = " ";
  // String password = " ";
  // bool ableToEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 166, 209, 168),
        appBar: AppBar(
          title: Text('Admin'),
          backgroundColor: Colors.green,
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
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                PickImage();
                              },
                              child: toolImages != null
                                  ? Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      height: 170,
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.file(
                                          toolImages,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      height: 170,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(31, 104, 103, 103),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_a_photo,
                                              color: Colors.black45,
                                              size: 30,
                                            ),
                                            Text('Add tool image')
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Tool Name'),
                                      onChanged: (value) {
                                        name = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration:
                                          InputDecoration(hintText: 'category'),
                                      onChanged: (value) {
                                        category = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration:
                                          InputDecoration(hintText: 'Id'),
                                      onChanged: (value) {
                                        uid = value as int;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration:
                                          InputDecoration(hintText: 'Price'),
                                      onChanged: (value) {
                                        price = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                          hintText: 'Description'),
                                      onChanged: (value) {
                                        description = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      child: Text('Update Records'),
                                      onPressed: (() {
                                        UploadPic();
                                      }),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green),
                                    )
                                  ],
                                ),
                              ),
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

class Crudtools {
  Future<void> addData(Data) async {
    FirebaseFirestore.instance.collection('tools').add(Data).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection('tools').snapshots();
  }
}
