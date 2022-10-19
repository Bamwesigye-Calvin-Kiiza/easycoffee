class UserModel {
  String uid;
  String email;
  String name;
  String Location;
  String role;

  UserModel({this.uid, this.email, this.name, this.Location, this.role});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        name: map['name'],
        Location: map['Location'],
        role: map['role']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'Location': Location,
      'role': 'user',
    };
  }
}
