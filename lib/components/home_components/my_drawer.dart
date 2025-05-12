import 'package:flutter/material.dart';
import 'package:messaging_app/services/auth/auth_services.dart';
import 'package:messaging_app/screens/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signout() {
    final _auth = AuthServices();
    _auth.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(child: Icon(Icons.message, size: 50)),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("home"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: signout,
            ),
          ),
        ],
      ),
    );
  }
}
