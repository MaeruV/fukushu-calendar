import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/task_event_repository_interface.dart';
import 'package:isar/isar.dart';

class TaskEventRepositoryImpl implements TaskRepository {
  TaskEventRepositoryImpl({required this.isar});
  final Isar isar;

  @override
  Future<void> add(
      {required Task task, required List<int> intervalDays}) async {
    await isar.writeTxn(() async {
      await isar.tasks.put(task);
      for (int days in intervalDays) {
        final taskDate = TaskDate()
          ..daysInterval = days
          ..checkFlag = false;
        await isar.taskDates.put(taskDate);
        task.dates.add(taskDate);
        await task.dates.save();
      }
    });
  }

  @override
  Future<void> delete({required Id taskId}) async {
    await isar.writeTxn(() => isar.tasks.delete(taskId));
  }

  @override
  Future<Task?> fetch({required Id taskId}) async {
    final task = await isar.tasks.get(taskId);
    if (task != null) {
      await task.dates.load();
      return task;
    } else {
      return task;
    }
  }

  @override
  Future<List<Task>> fetchAll() async {
    final taskAll = await isar.tasks.where().findAll();
    final List<Task> tasks = [];
    for (Task task in taskAll) {
      await task.dates.load();
      tasks.add(task);
    }
    return tasks;
  }

  @override
  Future<void> update(
      {required Task task, required List<int> intervalDays}) async {
    await isar.writeTxn(() async {
      final existingDates = task.dates;
      for (final taskDate in existingDates) {
        await isar.taskDates.delete(taskDate.id);
      }
      task.dates.clear();
      for (int days in intervalDays) {
        final taskDate = TaskDate()
          ..daysInterval = days
          ..checkFlag = false;
        await isar.taskDates.put(taskDate);
        task.dates.add(taskDate);
        await task.dates.save();
      }
    });
  }

  @override
  Future<int> getCount() {
    throw UnimplementedError();
  }

  @override
  Future<TaskDate?> fetchDate({required Id dateId}) async {
    final taskDate = await isar.taskDates.get(dateId);
    return taskDate;
  }

  @override
  Future<void> addTaskDate(
      {required TaskDate taskDate, required bool flag}) async {
    await isar.writeTxn(() async {
      final taslDates = taskDate..checkFlag = flag;
      await isar.taskDates.put(taslDates);
    });
  }
}
