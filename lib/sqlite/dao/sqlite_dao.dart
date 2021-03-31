import 'package:local_database_examples/shared/name_dao.dart';
import 'package:local_database_examples/sqlite/database_connection.dart';
import 'package:local_database_examples/sqlite/model/name.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDao implements NameDao {
  @override
  Future<List<Name>> findAllNames() async {
    final Database db = await DatabaseConnection.connectDB();

    final List<Map<String, dynamic>> maps = await db.query('names');

    return List.generate(maps.length, (i) {
      return Name(
        text: maps[i]['name'],
      );
    });
  }

  @override
  Future<void> saveName(Name name) async {
    final Database db = await DatabaseConnection.connectDB();

    await db.insert(
      'names',
      name.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
