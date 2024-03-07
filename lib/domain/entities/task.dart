import 'package:isar/isar.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement; // id = nullでも自動インクリメントされます。

  late String title;

  String? memo;

  late DateTime dateTime;

  late List<int> dates;

  late String pallete;
}
