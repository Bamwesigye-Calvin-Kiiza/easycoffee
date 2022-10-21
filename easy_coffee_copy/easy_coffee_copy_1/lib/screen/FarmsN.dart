import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_coffee_copy_1/core/color.dart';
import 'package:easy_coffee_copy_1/models/user_model.dart';
import 'package:easy_coffee_copy_1/screen/crud.dart';
import 'package:easy_coffee_copy_1/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import '../components/farmers.dart';

class BeFarm extends StatefulWidget {
  const BeFarm({Key key}) : super(key: key);

  @override
  State<BeFarm> createState() => _BeFarmState();
}

class _BeFarmState extends State<BeFarm> {
  String farmerName, location, Type, Farm_Name, Contact, Bio, Age, farmData;

  File selectedImage;
  bool _isloading = false;

  Future PickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageTemp = File(image.path);
    setState(() {
      selectedImage = imageTemp;
    });
  }

  UploadPic() async {
    if (selectedImage != null) {
      setState(() {
        _isloading = true;
      });
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('farmers')
          .child('${randomAlphaNumeric(9)}.jpg');
      final UploadTask uploadTask = firebaseStorageRef.putFile(selectedImage);
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();
      print('this is the $downloadUrl');
      Map<String, String> blogMap = {
        'imgUrl': downloadUrl,
      };

      cruds.addData(blogMap).then((value) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => farmersScreen())));
    } else {}
  }

  File GotImage;
  Cruds cruds = new Cruds();
  // Crud crud = new Crud();

  Future pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageTemp = File(image.path);
    setState(() {
      GotImage = imageTemp;
    });
  }

  Uploadpic() async {
    if (GotImage != null) {
      setState(() {
        _isloading = true;
      });
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('farmers')
          .child('${randomAlphaNumeric(8)}.jpg');
      final UploadTask uploadTask = firebaseStorageRef.putFile(GotImage);
      var Url = await (await uploadTask).ref.getDownloadURL();
      print('this is the $Url');
      Map<String, String> blogMap = {
        'Url': Url,
        if (farmerName != null) 'farmerName': farmerName,
        if (location != null) 'location': location,
        if (Farm_Name != null) 'Farm_Name': Farm_Name,
        if (Contact != null) 'Contact': Contact,
        if (Type != null) 'Type': Type,
        if (Bio != null) 'Biography': Bio,
        if (farmData != null) 'About farm': farmData,
        if (Age != null) 'Age': Age,
      };

      cruds.addData(blogMap).then((value) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen())));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Text(
                          'The information below will be used to generate a card containing information entered it will be displayed to your customers',
                          style: TextStyle(fontSize: 20, color: green),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            PickImage();
                          },
                          child: selectedImage != null
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  height: 170,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.file(
                                      selectedImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  height: 170,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(31, 126, 108, 108),
                                      borderRadius: BorderRadius.circular(6)),
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
                                        Text('Add your image')
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
                                  decoration: InputDecoration(hintText: 'Name'),
                                  onChanged: (value) {
                                    farmerName = value;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  decoration: InputDecoration(hintText: 'Age'),
                                  onChanged: (value) {
                                    Age = value;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  decoration:
                                      InputDecoration(hintText: 'Contact'),
                                  onChanged: (value) {
                                    Contact = value;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.all(4),
                                  height: 240,
                                  child: TextField(
                                    maxLines: 10,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Biography',
                                    ),
                                    onChanged: (value) {
                                      Bio = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: GotImage != null
                                      ? Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: 170,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.file(
                                              GotImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: 170,
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                Text('Add farm image')
                                              ],
                                            ),
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Farm location'),
                                  onChanged: (value) {
                                    location = value;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Type of Coffee'),
                                  onChanged: (value) {
                                    Type = value;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  decoration:
                                      InputDecoration(hintText: 'Farm Name'),
                                  onChanged: (value) {
                                    Farm_Name = value;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.all(4),
                                  height: 240,
                                  child: TextField(
                                    maxLines: 10,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Farm Details',
                                    ),
                                    onChanged: (value) {
                                      farmData = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  child: Text('Update data'),
                                  onPressed: (() {
                                    Uploadpic();
                                    UploadPic();
                                    postallDetailsToFirestore();
                                    postDetailsToFirestore();
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
  }

  final _auth = FirebaseAuth.instance;
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.name = farmerName;
    userModel.Location = location;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account updated successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  postallDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.name = farmerName;
    userModel.Location = location;

    await firebaseFirestore
        .collection("All")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
