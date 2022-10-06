import 'package:cloud_firestore/cloud_firestore.dart';

class Crud {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection('farmers')
        .add(blogData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection('farmers').snapshots();
  }
}

class Cruds {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection('farms')
        .add(blogData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection('farms').snapshots();
  }
}
