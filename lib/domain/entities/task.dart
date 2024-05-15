import 'package:isar/isar.dart';

part 'task.g.dart';

@Collection()
class Task {
  Id id = Isar.autoIncrement;

  late String title;

  late String rangeType;

  late int firstRange;

  late int? secoundRange;

  late DateTime startTime;

  late String memo;

  late int pallete;

  bool completedEvent = false;

  late DateTime? eventCompDay;

  @Backlink(to: 'task')
  final time = IsarLinks<NotificationTask>();

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

@Collection()
class NotificationTask {
  Id id = Isar.autoIncrement;

  late DateTime? dateTime;

  final task = IsarLink<Task>();
}
