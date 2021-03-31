import 'package:flutter/material.dart';
import 'package:local_database_examples/database_connection.dart';
import 'package:local_database_examples/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseConnection.connectDB();

  runApp(MyApp());
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
