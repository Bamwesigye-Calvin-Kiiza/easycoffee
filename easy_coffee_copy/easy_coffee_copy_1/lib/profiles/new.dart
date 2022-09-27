import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';

class FarmerProfile extends StatefulWidget {
  const FarmerProfile({key});

  @override
  State<FarmerProfile> createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {
  //File file = File( _imageFile.path );
  File image;

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

  // Future pickImageC() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.camera);
  //     if (image == null) {
  //       return;
  //     }
  //     ;
  //     final imageTemp = File(image.path);

  //     setState(() {
  //       this.image = imageTemp;
  //     });
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // Future pickImage() async {
    //   var image = await ImagePicker().pickImage(source: ImageSource.camera);

    //   setState(() {
    //     _image = image as File;
    //     print('Image Path $_image');
    //   });
    // }

    Future UploadPic(BuildContext context) async {
      String fileName = basename(image.path);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = firebaseStorageRef.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;

      setState(() {
        print('Profile Pic Uploaded');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Pic Uploaded')));
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('PROFILE'),
      ),
      body: Builder(
          builder: (context) => Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Color(0xff476cfb),
                              child: ClipOval(
                                child: SizedBox(
                                    width: 200,
                                    height: 200,
                                    child: (image != null)
                                        ? Image.file(
                                            image,
                                            fit: BoxFit.fill,
                                          )
                                        : Text('Enter Image')),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 70),
                            child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.camera,
                                size: 30,
                              ),
                              onPressed: () {
                                pickImage();
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Column(children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Username',
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 20),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Biss tavv',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              child: Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Column(children: <Widget>[
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Username',
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 20),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Biss tavv',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              child: Icon(
                                FontAwesomeIcons.pen,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 18),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('Biss tavv',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: (() {
                                Navigator.of(context).pop();
                              }),
                              child: Text(
                                'cancel',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                          ElevatedButton(
                              onPressed: (() {
                                UploadPic(context);
                              }),
                              child: Text(
                                'submit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: modify, child: Text('Update Data'))
                        ],
                      )
                    ]),
              )),
    );
  }

  final firestoreInstance = FirebaseFirestore.instance;
  void addData() {
    firestoreInstance.collection('users').doc("hJqh5uWmxyaRbeA0PK3n").update({
      'name': 'Kiiza Calvin',
      'Phone.no': 0773345884,
      'email': 'kiizacals3@gmail.com',
      'District': 'Kiboga',
      'Type of coffee': 'Arabica'
    }).then((value) {
      print('finally');
    });
  }

  void modify() {
    firestoreInstance.collection('users').add({
      'name': 'Bairyo Kevin',
      'Phone.no': 0788645884,
      'email': 'bairyokels3@gmail.com',
      'District': 'Mpigi',
      'Type of coffee': 'Arabica'
    }).then((value) {
      print(value.id);
      firestoreInstance
          .collection('users')
          .doc(value.id)
          .collection('coffee')
          .add({'coffee': 'ripe'});
    });
  }

  void delete() {
    firestoreInstance
        .collection('users')
        .doc('QoVJ6fJ090YixqwZxZzh')
        .delete()
        .then((_) {
      print('deleted fially');
    });
  }

  void deletefield() {
    firestoreInstance.collection('users').doc('M7CZ1U7UrhVb62Bydo4K').update(
        {'name': FieldValue.delete()}).then((value) => print('great deleted'));
  }

  void retrieveOnce() {
    firestoreInstance.collection('users').get().then((value) => {
          value.docs.forEach((element) {
            print(element.data());
          })
        });
  }

  void retrieveSbuccol() {
    firestoreInstance.collection('users').get().then((value) => {
          value.docs.forEach((element) {
            firestoreInstance
                .collection('users')
                .doc(element.id)
                .collection('coffee')
                .get()
                .then((subcol) {
              subcol.docs.forEach((result) {
                print(result.data());
              });
            });
          })
        });
  }

  void retrievedoc() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
        .then((value) => print(value.data()));
  }
}





























//       body: Center(
//           child: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: ((context) => HomeScreen())));
//               },
//               child: Text('Edit profile')),
//           MaterialButton(
//             color: Colors.green,
//             child: Text(
//               'Pick image from Gallery',
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//             onPressed: () {
//               pickImage();
//             },
//           ),
//           MaterialButton(
//             color: Colors.green,
//             child: Text(
//               'Take a picture',
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//             onPressed: () {
//               pickImageC();
//             },
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           image != null ? Image.file(image!) : Text('No image selected')
//         ],
//       )),
//     );
//   }
// }
