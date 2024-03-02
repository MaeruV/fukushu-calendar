import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks_provider.g.dart';

//　全データを取得してそれを日別で選別
@riverpod
Future<Map<DateTime, List<Task>>> tasks(TasksRef ref) async {
  return ref.watch(taskUsecaseProvider).fetchAll();
}
