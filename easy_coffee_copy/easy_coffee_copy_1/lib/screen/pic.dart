// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class EditProfile extends StatefulWidget {
//    EditProfile({Key key}) : super(key: key);
//   TextEditingController NameController = TextEditingController();
//   TextEditingController PhoneController = TextEditingController();
//   TextEditingController EmailController = TextEditingController();
//   TextEditingController DistrictController = TextEditingController();
//   TextEditingController TypeController = TextEditingController();
//   TextEditingController ImageController = TextEditingController();

//   _buildTextField(TextEditingController controller, String labelText) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//           color: Colors.amber, border: Border.all(color: Colors.blue)),
//       child: TextField(
//         controller: controller,
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 10),
//             labelText: labelText,
//             labelStyle: TextStyle(color: Colors.white),
//             // prefix: Icon(icon),
//             border: InputBorder.none),
//       ),
//     );
//   }

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit profile'),
//       ),
//       body: Column(
//         children: [
//           _buildTextField(NameController,'Name');]),
//     );
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  String Userid;
  UserProfile({Key key, this.Userid}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File image;
  String Url;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      ;
      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future UploadPic(BuildContext context) async {
    // String fileName = basename(image.path);
    final postId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('${widget.Userid}/image')
        .child('post_$postId');
    UploadTask uploadTask = firebaseStorageRef.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    Url = await firebaseStorageRef.getDownloadURL();
    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(widget.Userid)
    //     .collection('image')
    //     .add({'Url': Url});
    // .whenComplete(() =>
    //     showSnackBar('Image Uploaded', Duration(seconds: 2)));

    setState(() {
      print('Profile Pic Uploaded');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Profile Pic Uploaded')));
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController NameController = TextEditingController();
    TextEditingController PhoneController = TextEditingController();
    TextEditingController EmailController = TextEditingController();
    TextEditingController DistrictController = TextEditingController();
    TextEditingController TypeController = TextEditingController();
    TextEditingController ImageController = TextEditingController();

    Map<String, dynamic> addProfile;

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');

    addProf() {
      final postId = DateTime.now().microsecondsSinceEpoch.toString();
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('${widget.Userid}/image')
          .child('post_$postId');
      Url = firebaseStorageRef.getDownloadURL() as String;
      addProfile = {
        'name': NameController.text,
        'email': EmailController.text,
        'Phone': PhoneController.text,
        'District': DistrictController.text,
        'Type': TypeController.text,
        'Url': Url
      };
      collectionReference.add(addProfile).whenComplete(() => print('greate'));
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: 50),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 80),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffeeff41),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: NameController,
                              decoration: InputDecoration(
                                labelText: 'Names',
                                prefixIcon: Icon(Icons.person),
                                border: myInputBorder(),
                                enabledBorder: myInputBorder(),
                                focusedBorder: myFocusBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: EmailController,
                              decoration: InputDecoration(
                                labelText: 'email',
                                prefixIcon: Icon(Icons.email),
                                border: myInputBorder(),
                                enabledBorder: myInputBorder(),
                                focusedBorder: myFocusBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: PhoneController,
                              decoration: InputDecoration(
                                labelText: 'Phone.no',
                                prefixIcon: Icon(Icons.phone),
                                border: myInputBorder(),
                                enabledBorder: myInputBorder(),
                                focusedBorder: myFocusBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: DistrictController,
                              decoration: InputDecoration(
                                labelText: 'District',
                                prefixIcon: Icon(Icons.place),
                                border: myInputBorder(),
                                enabledBorder: myInputBorder(),
                                focusedBorder: myFocusBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: TypeController,
                              decoration: InputDecoration(
                                labelText: 'Type of coffee',
                                prefixIcon: Icon(Icons.radar),
                                border: myInputBorder(),
                                enabledBorder: myInputBorder(),
                                focusedBorder: myFocusBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                child: Text('Update profile'),
                                onPressed: (() {
                                  addProf();
                                  UploadPic(context);
                                }))
                          ],
                        ))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: <Widget>[
                    ClipOval(
                        child: (image == null)
                            ? Image.asset(
                                'assets/images/coffee_type.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                image,
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                              )),
                    Positioned(
                        bottom: 1,
                        right: 1,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.camera,
                              size: 30,
                            ),
                            onPressed: () {
                              pickImage();
                            },
                          ),
                        ))
                  ],
                ),
              )
            ],
          )),
    ));
  }

  OutlineInputBorder myInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.brown, width: 3));
  }

  // ignore: unused_element
  OutlineInputBorder myFocusBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: Colors.blueGrey, width: 3));
  }

  // showSnackBar(String snackText, Duration d) {
  //   final snackBar = SnackBar(content: Text(snackText), duration: d);
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}
