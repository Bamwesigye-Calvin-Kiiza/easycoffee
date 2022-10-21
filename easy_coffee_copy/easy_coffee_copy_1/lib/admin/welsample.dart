import 'dart:io';

import 'package:easy_coffee_copy_1/admin/extension_worker.dart';
import 'package:easy_coffee_copy_1/admin/sample1.dart';
import 'package:easy_coffee_copy_1/components/coffee_well_being.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import 'Prices.dart';
import 'harvestSample.dart';

class Wellbeing extends StatefulWidget {
  const Wellbeing({Key key}) : super(key: key);

  @override
  State<Wellbeing> createState() => _WellbeingState();
}

class _WellbeingState extends State<Wellbeing> {
  String title, content;
  bool _isloading = false;

  File GotImage;
  Crudwell cruds = new Crudwell();
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
          .child('wellbeing')
          .child('${randomAlphaNumeric(8)}.jpg');
      final UploadTask uploadTask = firebaseStorageRef.putFile(GotImage);
      var Url = await (await uploadTask).ref.getDownloadURL();
      print('this is the $Url');
      Map<String, String> blogMap = {
        'Url': Url,
        if (title != null) 'title': title,
        if (content != null) 'content': content,
      };

      cruds.addData(blogMap).then((value) => Navigator.push(context,
          MaterialPageRoute(builder: (context) => coffee_well_being())));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 223, 214),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 148, 89, 67),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        title: Text(
          'Coffee wellbeing',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
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
                          TextField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter title',
                            ),
                            onChanged: (value) {
                              title = value;
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          GestureDetector(
                            onTap: () {
                              pickImage();
                            },
                            child: GotImage != null
                                ? Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    height: 170,
                                    width: 170,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(80),
                                      child: Image.file(
                                        GotImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    height: 170,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(80)),
                                    width: 170,
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
                                          Text('Add image')
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Container(
                            margin: EdgeInsets.all(4),
                            height: 240,
                            child: TextField(
                              maxLines: 10,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'enter info',
                              ),
                              onChanged: (value) {
                                content = value;
                              },
                            ),
                          ),
                          ElevatedButton(
                            child: Text(
                              'add info',
                              style: TextStyle(fontSize: 25),
                            ),
                            onPressed: (() {
                              Uploadpic();
                            }),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 134, 75, 54)),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
        ),
      ),
    );
  }
}
