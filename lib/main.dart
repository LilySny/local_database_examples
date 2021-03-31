import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_database_examples/hive/model/hive_name.dart';
import 'package:local_database_examples/sqlite/database_connection.dart';
import 'package:local_database_examples/sqlite/home_page.dart';
import 'package:local_database_examples/hive/hive_boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _initializeHive();
  _initializeSqlite();

  runApp(MyApp());
}

Future<void> _initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveNameAdapter());
  await Hive.openBox<HiveName>(HiveBoxes.names);
}

void _initializeSqlite() {
  DatabaseConnection.connectDB();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
