import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditFet extends StatefulWidget {
  const EditFet({Key key}) : super(key: key);

  @override
  State<EditFet> createState() => _EditFetState();
}

class _EditFetState extends State<EditFet> {
  final controllerName = TextEditingController();
  final controllerPhone_no = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerDistrict = TextEditingController();
  final controllerType_of_coffee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('edit profile'), actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ]),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: controllerName,
            decoration: decoration('Name'),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            controller: controllerEmail,
            decoration: decoration('Email'),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            controller: controllerPhone_no,
            keyboardType: TextInputType.phone,
            decoration: decoration('Phone.no'),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            controller: controllerDistrict,
            decoration: decoration('District'),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            controller: controllerType_of_coffee,
            decoration: decoration('Type of coffee'),
          ),
          SizedBox(
            height: 24,
          ),
          ElevatedButton(
              child: Text('Create'),
              onPressed: (() {
                final user = User(
                    name: controllerName.text,
                    email: controllerEmail.text,
                    Phone_no: int.parse(controllerPhone_no.text),
                    District: controllerDistrict.text,
                    Type_of_coffee: controllerType_of_coffee.text);
                createUser(user);
                Navigator.pop(context);
              }))
        ],
      ),
    );
  }

  InputDecoration decoration(String label) {
    InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    // final user = User(
    //     // name: name,
    //     // Phone_no: 0773345884,
    //     // email: "kiizacals3@gmail.com",
    //     // District: "Kiboga",
    //     // Type_of_coffee: "Arabica");
    final json = user.toJson;

    // await docUser.set(json);
  }
}

class User {
  final String name;
  final int Phone_no;
  final String District;
  final String Type_of_coffee;
  final String email;

  User(
      {this.name,
      this.District,
      this.Type_of_coffee,
      this.Phone_no,
      this.email});

  Map<String, dynamic> toJson() => {
        'name': name,
        'Phone.no': Phone_no,
        'email': email,
        'District': District,
        'Type of coffee': Type_of_coffee,
      };
}
