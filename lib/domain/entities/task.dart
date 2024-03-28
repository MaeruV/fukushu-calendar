import 'package:isar/isar.dart';

part 'task.g.dart';

@Collection()
class Task {
  Id id = Isar.autoIncrement;

  late String title;

  late DateTime startTime;

  late String memo;

  late int pallete;

  late DateTime time;

  @Backlink(to: 'task')
  final dates = IsarLinks<TaskDate>();
}

@Collection()
class TaskDate {
  Id id = Isar.autoIncrement;

  late int daysInterval;

  late bool checkFlag;

  late DateTime? completeDay;

  final task = IsarLink<Task>();
}
