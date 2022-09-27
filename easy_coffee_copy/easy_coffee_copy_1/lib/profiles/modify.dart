import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class profilview extends StatefulWidget {
  const profilview({Key key}) : super(key: key);

  @override
  State<profilview> createState() => _profilviewState();
}

class _profilviewState extends State<profilview> {
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: snapshot.data.docs.map((snap) {
                    return Card(
                      child: ListTile(
                        leading: Text(snap['name'].toString()),
                        title: Text(snap['email'].toString()),
                        subtitle: Text(snap['District'].toString()),
                        // trailing: Text(snap['Phone.no'].toString()),
                      ),
                    );
                  }).toList(),
                ),
              );
            })
      ],
    )));
  }

  // final firestoreInstance = FirebaseFirestore.instance;
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

  Future<QuerySnapshot> retrieveSbuccol() {
    firestoreInstance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        firestoreInstance
            .collection('users')
            .doc(element.id)
            .collection('coffee')
            .snapshots();
        // .get()
        //   .then((subcol) {
        // subcol.docs.forEach((result) {
        //   print(result.data());
        // });
      });
    });
    // });
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
