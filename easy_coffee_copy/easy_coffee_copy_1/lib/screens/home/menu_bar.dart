import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.brown[50],
        ),
        child: Drawer(
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
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Your Location'),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About us'),
                onTap: () => null,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () => null,
              ),
              ListTile(
                leading: Icon(Icons.description),
                title: Text('Policies'),
                onTap: () => null,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Exit'),
                onTap: () => null,
              ),
            ],
          ),
        ));
  }
}
