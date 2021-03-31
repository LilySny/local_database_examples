import 'package:local_database_examples/shared/name_dao.dart';
import 'package:local_database_examples/sqlite/name.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesDao implements NameDao {
//   @override
//   Future<List<Name>> findAllNames() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String stringValue = prefs.getString('stringValue');
//     return stringValue;
//   }

//   @override
//   Future<void> saveName(Name name) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString(name.text, name.text);
//   }
// }
