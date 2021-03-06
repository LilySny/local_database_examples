import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_database_examples/hive/hive_boxes.dart';
import 'package:local_database_examples/hive/model/hive_name.dart';
import 'package:local_database_examples/shared_preferences/shared_preferences_page.dart';
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
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SharedPreferencesPage()));
            },
          ),
          ListTile(
            title: Text("Hive"),
            onTap: () async {
              _navigateToHive(context);
            },
          ),
        ],
      ),
    );
  }

  void _navigateToHive(BuildContext context) async {
    if (Hive.isBoxOpen(HiveBoxes.names)) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HivePage()));
    } else {
      await Hive.openBox<HiveName>(HiveBoxes.names);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HivePage()));
    }
  }
}
