import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_coffee_copy_1/screen/FarmsN.dart';
import 'package:easy_coffee_copy_1/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_coffee_copy_1/map.dart';

import '../../models/user_model.dart';
import '../../screen/pic.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((value) => this.loggedInUser = UserModel.fromMap(value.data()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.brown[50],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 40, bottom: 420),
          child: Drawer(
            backgroundColor: Color.fromARGB(255, 245, 217, 206),
            width: MediaQuery.of(context).size.width - 150,
            child: Column(
              children: [
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).closeEndDrawer();
                    },
                    child: Icon(Icons.clear),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('Develop farmer card'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return BeFarm();
                    }),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Locate farms'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return MapScreen();
                    }),
                  ),
                ),
                // ListTile(
                //   leading: Icon(Icons.share),
                //   title: Text(''),
                //   onTap: () => null,
                // ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.landscape),
                  title: Text('Develop farm card'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return BeFarm();
                    }),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text('Create Profile'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return UserProfile(
                        Userid: loggedInUser.uid,
                      );
                    }),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About us'),
                  onTap: () => null,
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log out'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return LoginScreen();
                    }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
