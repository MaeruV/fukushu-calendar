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
Future<Map<DateTime, List<Task>>> taskDates(TaskDatesRef ref) async {
  return ref.watch(taskUsecaseProvider).fetchAll();
}

@riverpod
Future<Map<DateTime, List<TaskDate>>> compTaskDataPeriod(
    CompTaskDataPeriodRef ref,
    {required List<DateTime> weeks}) async {
  return ref.watch(taskUsecaseProvider).fetchCompTaskDataPeriod(weeks);
}

@riverpod
Future<Map<DateTime, List<Task>>> compEventDataPeriod(
    CompEventDataPeriodRef ref,
    {required List<DateTime> weeks}) async {
  return ref.watch(taskUsecaseProvider).fetchCompEventDataPeriod(weeks);
}

@riverpod
Future<List<TaskDate>> fetchDataForTapped(FetchDataForTappedRef ref,
    {required List<DateTime> times}) async {
  return ref.watch(taskUsecaseProvider).fetchDataForTapped(times);
}

@riverpod
Future<List<Task>> fetchCompEventForTapped(FetchCompEventForTappedRef ref,
    {required List<DateTime> times}) async {
  return ref.watch(taskUsecaseProvider).fetchCompEventForTapped(times);
}

//一時起きタスク
final temporaryTaskProvider = StateProvider<Task?>((_) => null);

//　タスクId指定でタスク取得する
@riverpod
Future<Task?> tempTask(TempTaskRef ref, {required int taskId}) async {
  return ref.watch(taskUsecaseProvider).fetch(taskId);
}

@riverpod
Future<List<CalendarEvent>> setCalendarEvents(SetCalendarEventsRef ref) {
  return ref.watch(taskUsecaseProvider).formatCalendarEvents();
}

@riverpod
Future<TaskDate?> tempTaskDate(TempTaskDateRef ref,
    {required TaskDate? taskDate}) async {
  if (taskDate != null) {
    return ref.watch(taskUsecaseProvider).fetchDate(taskDate.id);
  }
  return null;
}
