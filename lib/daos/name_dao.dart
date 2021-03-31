import 'package:local_database_examples/models/name.dart';

abstract class NameDao {

  Future<List<Name>> findAllNames();

  Future<void> saveName(Name name);
}