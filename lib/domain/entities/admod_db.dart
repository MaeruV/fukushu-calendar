import 'package:isar/isar.dart';

part 'admod_db.g.dart';

@Collection()
class AdmodDB {
  Id id = Isar.autoIncrement;

  late int num;

  late DateTime dateTime;
}
