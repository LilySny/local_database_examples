import 'package:flutter/material.dart';
import 'package:local_database_examples/sqlite/home_page.dart';
import 'package:local_database_examples/hive/hive_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text("SQLite"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          ListTile(
            title: Text("SharedPreferences"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Hive"),
            onTap: () {
               Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HivePage()));
            },
          ),
        ],
      ),
    );
  }
}