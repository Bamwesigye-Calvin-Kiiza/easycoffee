import 'dart:io';

import 'package:easy_coffee_copy_1/components/farmers.dart';
import 'package:easy_coffee_copy_1/components/farms.dart';
import 'package:easy_coffee_copy_1/screen/crud.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class BeFarm extends StatefulWidget {
  const BeFarm({Key key}) : super(key: key);

  @override
  State<BeFarm> createState() => _BeFarmState();
}

class _BeFarmState extends State<BeFarm> {
  String farmerName, location, type_of_coffee, Farm_Name, Contact;
  File GotImage;
  bool _isloading = false;
  Cruds cruds = new Cruds();

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
          .child('farms')
          .child('${randomAlphaNumeric(8)}.jpg');
      final UploadTask uploadTask = firebaseStorageRef.putFile(GotImage);
      var Url = await (await uploadTask).ref.getDownloadURL();
      print('this is the $Url');
      Map<String, String> blogMap = {
        'Url': Url,
        'farmerName': farmerName,
        'location': location,
        'Farm_Name': Farm_Name,
        'Contact': Contact,
        'Type': type_of_coffee,
      };

      cruds.addData(blogMap).then((value) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => farms())));
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
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child: GotImage != null
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  height: 170,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.file(
                                      GotImage,
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
                                decoration:
                                    InputDecoration(hintText: 'location'),
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
                                decoration:
                                    InputDecoration(hintText: 'Contact'),
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
                                    Uploadpic();
                                  }))
                            ],
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
}
