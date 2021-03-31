import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  static Future<Database> connectDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'names_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE names(id INTEGER PRIMARY KEY, name TEXT)",
        );
      },
      version: 1,
    );
  }
}
