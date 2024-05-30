import 'dart:ui';
import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/others/others_notification_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/run_usecase_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/task_event_repository_interface.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  void _refreshCompleteTaskPeriodProvider(List<DateTime> weeks) =>
      _ref.refresh(compTaskDataPeriodProvider(weeks: weeks).future);

  void _refreshCompletedTaskTappedProvider(List<DateTime> time) =>
      _ref.refresh(fetchDataForTappedProvider(times: time).future);

  void _refreshCompletedEventPeriodProvider(List<DateTime> time) =>
      _ref.refresh(fetchCompEventForTappedProvider(times: time).future);
  void _refreshCompleteEventPeriodProvider(List<DateTime> weeks) =>
      _ref.refresh(CompEventDataPeriodProvider(weeks: weeks).future);

  void _refreshTempTaskProvider(int taskId) =>
      _ref.refresh(tempTaskProvider(taskId: taskId).future);
  void _refreshTempTaskDateProvider(TaskDate taskDate) =>
      _ref.refresh(tempTaskDateProvider(taskDate: taskDate).future);

  Future<void> saveTaskEvent({
    required String title,
    required ReviewRange rangeType,
    required int firstRange,
    required int? secoundRange,
    required String memo,
    required DateTime dateTime,
    required List<int> intervalDays,
    required int pallete,
    required DateTime? eventCompDay,
    required DateTime? time,
    required bool flagNotification,
    required AppLocalizations appLocalizations,
  }) async {
    Task task;
    final formatRange = rangeType.enumToString();
    if (_temporaryTaskController.state == null) {
      // 新規タスクの作成
      task = Task()
        ..title = title
        ..rangeType = formatRange
        ..firstRange = firstRange
        ..secoundRange = secoundRange
        ..memo = memo
        ..startTime = dateTime
        ..pallete = pallete
        ..eventCompDay = eventCompDay;
    } else {
      // 既存のタスクの更新
      task = _temporaryTaskController.state!
        ..title = title
        ..rangeType = formatRange
        ..firstRange = firstRange
        ..secoundRange = secoundRange
        ..memo = memo
        ..startTime = dateTime
        ..pallete = pallete
        ..eventCompDay = eventCompDay;
    }

    await execute(
      loadingController: _loadingController,
      action: () async {
        if (_temporaryTaskController.state == null) {
          await _taskRepository.add(
              task: task,
              intervalDays: intervalDays,
              time: time,
              flagNotification: flagNotification);
        } else {
          await _taskRepository.update(
              task: task,
              intervalDays: intervalDays,
              time: time,
              flagNotification: flagNotification);
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
    _fetchNotificationTaskAll(appLocalizations: appLocalizations);
  }

  Future<void> saveTaskDate({
    required TaskDate taskDate,
    required bool flag,
    required List<DateTime> time,
    required List<DateTime> weeks,
  }) async {
    await execute(action: () async {
      return await _taskRepository.addTaskDate(taskDate: taskDate, flag: flag);
    });

    _refreshTempTaskDateProvider(taskDate);
    _invalidateTasksProvider();
    _refreshCalendarProvider();
    _refreshCompleteTaskPeriodProvider(weeks);
    _refreshCompleteEventPeriodProvider(weeks);
    if (time != []) {
      _refreshCompletedTaskTappedProvider(time);
      _refreshCompletedEventPeriodProvider(time);
    }
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

  Future<Map<DateTime, List<TaskDate>>> fetchCompTaskDataPeriod(
      List<DateTime> weeks) async {
    final taskDates = await execute(action: () async {
      return await _taskRepository.fetchCompTaskDataPeriod(weeks: weeks);
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

  Future<Map<DateTime, List<Task>>> fetchCompEventDataPeriod(
      List<DateTime> weeks) async {
    final tasks = await execute(action: () async {
      return await _taskRepository.fetchCompEventDataPeriod(weeks: weeks);
    });
    final Map<DateTime, List<Task>> groupedTasks = {};

    for (final task in tasks) {
      final dateOnly = DateTime(task.eventCompDay!.year,
          task.eventCompDay!.month, task.eventCompDay!.day);
      if (!groupedTasks.containsKey(dateOnly)) {
        groupedTasks[dateOnly] = [];
      }
      groupedTasks[dateOnly]!.add(task);
    }

    return groupedTasks;
  }

  Future<List<TaskDate>> fetchDataForTapped(List<DateTime> times) async {
    final taskDates = await execute(action: () async {
      return await _taskRepository.fetchDataForTapped(times: times);
    });
    return taskDates;
  }

  Future<List<Task>> fetchCompEventForTapped(List<DateTime> times) async {
    final taskDates = await execute(action: () async {
      return await _taskRepository.fetchCompEventForTapped(times: times);
    });
    return taskDates;
  }

  Future<void> _fetchNotificationTaskAll(
      {required AppLocalizations appLocalizations}) async {
    final notificationTasks = await execute(action: () async {
      return await _taskRepository.fetchNotificationTask();
    });

    final Map<DateTime, List<NotificationTask>> groupedTaskDates = {};

    for (final notificationTask in notificationTasks) {
      if (notificationTask.dateTime != null) {
        final dateOnly = DateTime(
            notificationTask.dateTime!.year,
            notificationTask.dateTime!.month,
            notificationTask.dateTime!.day,
            notificationTask.dateTime!.hour,
            notificationTask.dateTime!.minute);

        if (!groupedTaskDates.containsKey(dateOnly)) {
          groupedTaskDates[dateOnly] = [];
        }
        groupedTaskDates[dateOnly]!.add(notificationTask);
      }
    }

    _ref
        .read(othersNotifierModelProvider.notifier)
        .scheduleNotificationOnSpecificDate(
            notificationTasks: groupedTaskDates,
            appLocalizations: appLocalizations);
  }

  Future<Map<DateTime, List<CalendarEvent>>> groupTasksByReviewDates() async {
    final tasks = await _taskRepository.fetchAll();
    final Map<DateTime, List<CalendarEvent>> calendarEventsByDate = {};

    for (final task in tasks) {
      final formatRangeType = task.rangeType.stringToReviewRange();
      final startDate = DateTime(
          task.startTime.year, task.startTime.month, task.startTime.day);
      final startEvent = CalendarEvent(
        eventName: task.title,
        eventDate: startDate,
        eventBackgroundColor: Color(task.pallete),
        eventID: task.id,
        taskDate: null,
        completedFlag: task.completedEvent,
        rangeType: formatRangeType,
        firstRange: task.firstRange,
        secoundRange: task.secoundRange,
      );
      calendarEventsByDate.putIfAbsent(startDate, () => []).add(startEvent);

      for (final daysToAdd in task.dates) {
        if (daysToAdd.checkFlag != true) {
          final reviewDate =
              startDate.add(Duration(days: daysToAdd.daysInterval));
          final reviewEvent = CalendarEvent(
            eventName: task.title,
            eventDate: reviewDate,
            eventBackgroundColor: Color(task.pallete),
            eventID: task.id,
            taskDate: daysToAdd,
            completedFlag: false,
            rangeType: formatRangeType,
            firstRange: task.firstRange,
            secoundRange: task.secoundRange,
          );
          calendarEventsByDate
              .putIfAbsent(reviewDate, () => [])
              .add(reviewEvent);
        }
      }
    }
    return calendarEventsByDate;
  }

  Future<void> deleteTaskEvent(
    Task task,
    List<DateTime> times,
    List<DateTime> weeks,
    AppLocalizations appLocalizations,
  ) async {
    await _taskRepository.delete(task: task);
    _invalidateTasksProvider();
    _refreshCalendarProvider();
    _fetchNotificationTaskAll(appLocalizations: appLocalizations);
    _refreshCompleteTaskPeriodProvider(weeks);
    _refreshCompleteEventPeriodProvider(weeks);
    if (times.isNotEmpty) {
      _refreshCompletedTaskTappedProvider(times);
      _refreshCompletedEventPeriodProvider(times);
    }
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
