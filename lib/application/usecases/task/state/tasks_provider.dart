import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks_provider.g.dart';

//　全データを取得してそれを日別で選別
@riverpod
Future<Map<DateTime, List<Task>>> tasks(TasksRef ref) async {
  return ref.watch(taskUsecaseProvider).fetchAll();
}

//一時起きタスク
final temporaryTaskProvider = StateProvider<Task?>((_) => null);

//　タスクId指定でタスク取得する
@riverpod
Future<Task?> tempTask(TempTaskRef ref, {required int taskId}) async {
  return ref.watch(taskUsecaseProvider).fetch(taskId);
}
