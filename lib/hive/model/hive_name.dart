import 'package:hive/hive.dart';
part 'hive_name.g.dart';

@HiveType(typeId: 0)
class HiveName extends HiveObject{
  @HiveField(0)
  final String name;

  HiveName({this.name});
}