import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'users_state.g.dart';

// This is the class used by rest of your codebase
class UsersState = _UsersState with _$UsersState;

abstract class _UsersState with Store {
  var _currentUser = FirebaseAuth.instance.currentUser?.uid;

  @observable
  Map<String, dynamic> users = ObservableMap();
  final ImagePicker _picker = ImagePicker();

  @observable
  File imagefile;

  var _profilePicUrl;
  var _usersCollection = FirebaseFirestore.instance.collection('users');

  @observable
  String _searchUser = '';

  @computed
  List<dynamic> get people {
    return users.entries
        .where((user) => user.key != _currentUser)
        .where((user) => user.value['farmerName']
            .toLowerCase()
            .startsWith(_searchUser.toLowerCase()))
        .map((e) => e.value)
        .toList();
  }

  @action
  setSearchTerm(String value) {
    this._searchUser = value;
  }

  @action
  initUsersListener() {
    FirebaseFirestore.instance.collection("users").snapshots().listen(
      (QuerySnapshot snapshot) {
        snapshot.docs.forEach((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          users[data['uid']] = {
            'name': data['farmerName'],
            'picture': data['imgUrl']
          };
        });
      },
    );
  }
}
