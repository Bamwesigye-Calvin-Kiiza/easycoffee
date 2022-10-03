class UserModel {
  String uid;
  String email;
  String name;
  String Location;

  UserModel({this.uid, this.email, this.name, this.Location});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      Location: map['Location'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'Location': Location,
    };
  }
}
