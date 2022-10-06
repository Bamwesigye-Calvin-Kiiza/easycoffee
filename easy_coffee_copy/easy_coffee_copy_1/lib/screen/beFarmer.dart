import 'dart:io';

import 'package:easy_coffee_copy_1/components/farmers.dart';
import 'package:easy_coffee_copy_1/screen/crud.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class BeFarmer extends StatefulWidget {
  const BeFarmer({Key key}) : super(key: key);

  @override
  State<BeFarmer> createState() => _BeFarmerState();
}

class _BeFarmerState extends State<BeFarmer> {
  String farmerName, location, type_of_coffee, Farm_Name, Contact;
  File selectedImage, GotImage;
  bool _isloading = false;
  Crud crud = new Crud();

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
        'farmerName': farmerName,
        'location': location,
        'Farm_Name': Farm_Name,
        'Contact': Contact,
        'Type': type_of_coffee,
      };

      crud.addData(blogMap).then((value) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => farmersScreen())));
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
                child: Padding(
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
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(6)),
                                width: MediaQuery.of(context).size.width,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black45,
                                  size: 30,
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(hintText: 'farmer'),
                              onChanged: (value) {
                                farmerName = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: 'location'),
                              onChanged: (value) {
                                location = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration:
                                  InputDecoration(hintText: 'Type of Coffee'),
                              onChanged: (value) {
                                type_of_coffee = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration:
                                  InputDecoration(hintText: 'Farm_Name'),
                              onChanged: (value) {
                                Farm_Name = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: 'Contact'),
                              onChanged: (value) {
                                Contact = value;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                child: Text('Update Records'),
                                onPressed: (() {
                                  UploadPic();
                                }))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    ));
  }
}
