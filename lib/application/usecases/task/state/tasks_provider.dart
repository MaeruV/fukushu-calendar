import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks_provider.g.dart';

//　全データを取得してそれを日別で選別
@riverpod
Future<Map<DateTime, List<Task>>> tasks(TasksRef ref) async {
  return ref.watch(taskUsecaseProvider).fetchAll();
}

@riverpod
Future<Map<DateTime, List<Task>>> taskDates(TasksRef ref) async {
  return ref.watch(taskUsecaseProvider).fetchAll();
}

@riverpod
Future<Map<DateTime, List<TaskDate>>> compWeekData(CompWeekDataRef ref,
    {required List<DateTime> weeks}) async {
  return ref.watch(taskUsecaseProvider).fetchCompWeekData(weeks);
}

@riverpod
Future<List<TaskDate>> fetchDataForPeriod(FetchDataForPeriodRef ref,
    {required List<DateTime> times}) async {
  return ref.watch(taskUsecaseProvider).fetchDataForPeriod(times);
}

//一時起きタスク
final temporaryTaskProvider = StateProvider<Task?>((_) => null);

//　タスクId指定でタスク取得する
@riverpod
Future<Task?> tempTask(TempTaskRef ref, {required int taskId}) async {
  return ref.watch(taskUsecaseProvider).fetch(taskId);
}

@riverpod
Future<Map<DateTime, List<CalendarEvent>>> tasksCalendar(TasksCalendarRef ref) {
  return ref.watch(taskUsecaseProvider).groupTasksByReviewDates();
}

@riverpod
Future<TaskDate?> tempTaskDate(TempTaskDateRef ref,
    {required TaskDate? taskDate}) async {
  if (taskDate != null) {
    return ref.watch(taskUsecaseProvider).fetchDate(taskDate.id);
  }
  return null;
}
