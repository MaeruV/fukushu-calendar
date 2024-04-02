import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/task_event_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:isar/isar.dart';

class TaskEventRepositoryImpl implements TaskRepository {
  TaskEventRepositoryImpl({required this.isar});
  final Isar isar;

  @override
  Future<void> add(
      {required Task task,
      required List<int> intervalDays,
      required DateTime? time}) async {
    DateTime? dt;
    await isar.writeTxn(() async {
      await isar.tasks.put(task);
      for (int days in intervalDays) {
        final taskDate = TaskDate()
          ..daysInterval = days
          ..checkFlag = false
          ..completeDay = null;

        final stTime = task.startTime.add(Duration(days: days));
        if (time != null) {
          dt = DateTime(
            stTime.year,
            stTime.month,
            stTime.day,
            time.hour,
            time.minute,
          );
          final notification = NotificationTask()..dateTime = dt;
          await isar.notificationTasks.put(notification);
          task.time.add(notification);
        }

        await isar.taskDates.put(taskDate);
        task.dates.add(taskDate);
        await task.time.save();
        await task.dates.save();
      }
    });
  }

  @override
  Future<void> update(
      {required Task task,
      required List<int> intervalDays,
      required DateTime? time}) async {
    await isar.writeTxn(() async {
      final existingDays = task.dates.map((d) => d.daysInterval).toList();
      final List<TaskDate> datesToRemove = [];

      for (final taskDate in task.dates) {
        if (!intervalDays.contains(taskDate.daysInterval)) {
          datesToRemove.add(taskDate);
        }
      }

      for (final taskDate in datesToRemove) {
        await isar.taskDates.delete(taskDate.id);
        task.dates.remove(taskDate);
      }

      for (final notificationTask in task.time) {
        await isar.notificationTasks.delete(notificationTask.id);
      }
      task.time.clear();

      for (int days in intervalDays) {
        if (!existingDays.contains(days)) {
          final taskDate = TaskDate()
            ..daysInterval = days
            ..checkFlag = false
            ..completeDay = null;
          await isar.taskDates.put(taskDate);
          task.dates.add(taskDate);
        }

        final stTime = task.startTime.add(Duration(days: days));
        if (time != null) {
          DateTime dt = DateTime(
            stTime.year,
            stTime.month,
            stTime.day,
            time.hour,
            time.minute,
          );

          final notification = NotificationTask()..dateTime = dt;
          await isar.notificationTasks.put(notification);
          task.time.add(notification);
        }
      }

      await isar.tasks.put(task);
      await task.dates.save();
      await task.time.save();
    });
  }

  @override
  Future<void> addTaskDate(
      {required TaskDate taskDate, required bool flag}) async {
    final now = DateTime.now().toZeroHour();
    final checkFlag = flag ? now : null;
    await isar.writeTxn(() async {
      final taslDates = taskDate
        ..checkFlag = flag
        ..completeDay = checkFlag;
      await isar.taskDates.put(taslDates);
    });
  }

  @override
  Future<void> delete({required Task task}) async {
    await isar.writeTxn(() async {
      for (var taskDate in task.dates) {
        await isar.taskDates.delete(taskDate.id);
      }
      for (var notificationTask in task.time) {
        await isar.notificationTasks.delete(notificationTask.id);
      }
      await isar.tasks.delete(task.id);
    });
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
  Future<TaskDate?> fetchDate({required Id dateId}) async {
    final taskDate = await isar.taskDates.get(dateId);
    return taskDate;
  }

  @override
  Future<List<TaskDate>> fetchCompDate() async {
    final datesAll = await isar.taskDates
        .filter()
        .checkFlagEqualTo(true)
        .sortByCompleteDay()
        .findAll();
    for (var taskDate in datesAll) {
      await taskDate.task.load();
    }
    return datesAll;
  }

  @override
  Future<List<NotificationTask>> fetchNotificationTask() async {
    final notificationAll =
        await isar.notificationTasks.where().sortByDateTime().findAll();
    for (NotificationTask notification in notificationAll) {
      await notification.task.load();
    }

    return notificationAll;
  }

  @override
  Future<List<Task>> fetchAll() async {
    final taskAll = await isar.tasks.where().sortByStartTime().findAll();
    final List<Task> tasks = [];
    for (Task task in taskAll) {
      await task.dates.load();
      await task.time.load();
      tasks.add(task);
    }
    return tasks;
  }
}
