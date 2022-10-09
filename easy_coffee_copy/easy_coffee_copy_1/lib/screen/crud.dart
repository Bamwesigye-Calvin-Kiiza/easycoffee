import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class Cruds {
  String Uid = _auth.currentUser.uid;
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(Uid)
        .update(blogData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(Uid)
        .snapshots();
  }
}

// class Crud {
//   String Uid = _auth.currentUser.uid;
//   Future<void> addData(blogData) async {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(Uid)
//         .collection('farmers')
//         .add(blogData)
//         .catchError((e) {
//       print(e);
//     });
//   }

//   getData() async {
//     return await FirebaseFirestore.instance
//         .collection('users')
//         .doc(Uid)
//         .collection('farmers')
//         .snapshots();
//   }
// }

class CrudMethodes {
  Future<void> addData(blogData) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc()
        .collection('profile')
        .add(blogData)
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection('farmers').snapshots();
  }
}
