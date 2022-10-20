import 'dart:io';

import 'package:easy_coffee_copy_1/admin/extension_worker.dart';
import 'package:easy_coffee_copy_1/admin/sample1.dart';
import 'package:easy_coffee_copy_1/admin/welsample.dart';
import 'package:easy_coffee_copy_1/components/dry_seeds.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class Harvest extends StatefulWidget {
  const Harvest({Key key}) : super(key: key);

  @override
  State<Harvest> createState() => _HarvestState();
}

class _HarvestState extends State<Harvest> {
  String title, content;
  bool _isloading = false;

  File GotImage;
  CrudHarvest cruds = new CrudHarvest();
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
          .child('harvest')
          .child('${randomAlphaNumeric(8)}.jpg');
      final UploadTask uploadTask = firebaseStorageRef.putFile(GotImage);
      var Url = await (await uploadTask).ref.getDownloadURL();
      print('this is the $Url');
      Map<String, String> blogMap = {
        'Url': Url,
        if (title != null) 'title': title,
        if (content != null) 'content': content,
      };

      cruds.addData(blogMap).then((value) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dry_seeds())));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        title: Text(
          'Coffee Harvest',
          style: TextStyle(fontSize: 15),
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
                          Row(
                            children: [
                              ElevatedButton(
                                child: Text('add info'),
                                onPressed: (() {
                                  Uploadpic();
                                }),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.brown),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                child: Text('wellbeing'),
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Wellbeing() //HomePage()
                                          ));
                                }),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.brown),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                child: Text('startups'),
                                onPressed: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StartPage() //HomePage()
                                          ));
                                }),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.brown),
                              ),
                            ],
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
