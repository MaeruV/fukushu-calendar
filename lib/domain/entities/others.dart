import 'package:isar/isar.dart';

part 'others.g.dart';

@Collection()
class Others {
  Id id = Isar.autoIncrement;

  String currentTheme = 'light';

  double fontSize = 13;

  String thickness = 'thin';

  String textFamily = 'Inter';

  String language = 'ja';
}
