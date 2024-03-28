import 'package:isar/isar.dart';

part 'others.g.dart';

@Collection()
class Others {
  Id id = Isar.autoIncrement;

  bool darkMode = false;

  bool notification = false;
}
