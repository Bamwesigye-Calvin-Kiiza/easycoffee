import 'package:cloud_firestore/cloud_firestore.dart';

class Crudstart {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection('startups')
        .add(blogData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection('startups').snapshots();
  }
}

class Crudwell {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection('wellbeing')
        .add(blogData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection('wellbeing').snapshots();
  }
}
