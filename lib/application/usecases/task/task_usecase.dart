import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/run_usecase_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/task_event_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final taskUsecaseProvider = Provider<TaskUsecase>(
  TaskUsecase.new,
);

class TaskUsecase with RunUsecaseMixin {
  TaskUsecase(this._ref);

  final Ref _ref;

  /// 別Providerに依存するものはここに定義して利用する
  TaskRepository get _taskRepository => _ref.read(taskRepositoryProvider);
  StateController<bool> get _loadingController =>
      _ref.read(overlayLoadingProvider.notifier);
  void _invalidateTasksProvider() => _ref.refresh(tasksProvider.future);
  StateController<Task?> get _temporaryTaskController =>
      _ref.read(temporaryTaskProvider.notifier);
  void _refreshCalendarProvider() => _ref.refresh(tasksCalendarProvider.future);
  void _refreshCompleteProvider() => _ref.refresh(compTaskDatesProvider.future);
  void _refreshTempTaskProvider(int taskId) =>
      _ref.refresh(tempTaskProvider(taskId: taskId).future);
  void _refreshTempTaskDateProvider(TaskDate taskDate) =>
      _ref.refresh(tempTaskDateProvider(taskDate: taskDate).future);

  Future<void> saveTaskEvent({
    required String title,
    required String memo,
    required DateTime dateTime,
    required List<int> intervalDays,
    required String pallete,
  }) async {
    Task task;

    if (_temporaryTaskController.state == null) {
      // 新規タスクの作成
      task = Task()
        ..title = title
        ..memo = memo
        ..startTime = dateTime
        ..pallete = pallete;
    } else {
      // 既存のタスクの更新
      task = _temporaryTaskController.state!
        ..title = title
        ..memo = memo
        ..startTime = dateTime
        ..pallete = pallete;
    }

    await execute(
      loadingController: _loadingController,
      action: () async {
        if (_temporaryTaskController.state == null) {
          await _taskRepository.add(task: task, intervalDays: intervalDays);
        } else {
          await _taskRepository.update(task: task, intervalDays: intervalDays);
        }
      },
    );

    if (_temporaryTaskController.state != null) {
      _refreshTempTaskProvider(task.id);
    }

    for (final daysToAdd in task.dates) {
      _refreshTempTaskDateProvider(daysToAdd);
    }
    _invalidateTasksProvider();
    _refreshCalendarProvider();
  }

  Future<void> saveTaskDate(
      {required TaskDate taskDate, required bool flag}) async {
    await execute(action: () async {
      return await _taskRepository.addTaskDate(taskDate: taskDate, flag: flag);
    });
    _refreshTempTaskDateProvider(taskDate);
    _refreshCalendarProvider();
    _refreshCompleteProvider();
  }

  Future<Task?> fetch(Id taskId) async {
    final tasks = await execute(action: () async {
      return await _taskRepository.fetch(taskId: taskId);
    });

    return tasks;
  }

  Future<Map<DateTime, List<Task>>> fetchAll() async {
    final tasks = await execute(action: () async {
      return await _taskRepository.fetchAll();
    });

    final Map<DateTime, List<Task>> groupedTasks = {};

    for (final task in tasks) {
      final dateOnly = DateTime(
          task.startTime.year, task.startTime.month, task.startTime.day);
      groupedTasks.putIfAbsent(dateOnly, () => []).add(task);
    }

    return groupedTasks;
  }

  Future<Map<DateTime, List<TaskDate>>> fetchCompTaskAll() async {
    final taskDates = await execute(action: () async {
      return await _taskRepository.fetchCompDate();
    });
    final Map<DateTime, List<TaskDate>> groupedTaskDates = {};

    for (final taskDate in taskDates) {
      final dateOnly = DateTime(taskDate.completeDay!.year,
          taskDate.completeDay!.month, taskDate.completeDay!.day);
      if (!groupedTaskDates.containsKey(dateOnly)) {
        groupedTaskDates[dateOnly] = [];
      }
      groupedTaskDates[dateOnly]!.add(taskDate);
    }

    return groupedTaskDates;
  }

  Future<Map<DateTime, List<CalendarEvent>>> groupTasksByReviewDates() async {
    final tasks = await _taskRepository.fetchAll();
    final Map<DateTime, List<CalendarEvent>> calendarEventsByDate = {};

    for (final task in tasks) {
      // タスクの開始日に基づいてCalendarEventを追加
      final startDate = DateTime(
          task.startTime.year, task.startTime.month, task.startTime.day);
      final startEvent = CalendarEvent(
        eventName: task.title,
        eventDate: startDate,
        eventBackgroundColor: TaskColorPalette.noamlPalette[task.pallete]!,
        eventID: task.id,
        taskDate: null,
      );
      calendarEventsByDate.putIfAbsent(startDate, () => []).add(startEvent);

      for (final daysToAdd in task.dates) {
        if (daysToAdd.checkFlag != true) {
          final reviewDate =
              startDate.add(Duration(days: daysToAdd.daysInterval));
          final reviewEvent = CalendarEvent(
            eventName: task.title,
            eventDate: reviewDate,
            eventBackgroundColor: TaskColorPalette.noamlPalette[task.pallete]!,
            eventID: task.id,
            taskDate: daysToAdd,
          );
          calendarEventsByDate
              .putIfAbsent(reviewDate, () => [])
              .add(reviewEvent);
        }
      }
    }
    return calendarEventsByDate;
  }

  Future<void> deleteTaskEvent(Task task) async {
    await _taskRepository.delete(task: task);
    _invalidateTasksProvider();
    _refreshCalendarProvider();
    _refreshCompleteProvider();
  }

  void temporaryTask(Id taskId) async {
    final task = await execute(action: () async {
      return await _taskRepository.fetch(taskId: taskId);
    });
    _temporaryTaskController.state = task;
  }

  Future<TaskDate?> fetchDate(Id dateId) async {
    final taskDate = await execute(action: () async {
      return await _taskRepository.fetchDate(dateId: dateId);
    });
    return taskDate;
  }
}
