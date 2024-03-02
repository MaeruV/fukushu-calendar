import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/task_event_repository_interface.dart';
import 'package:isar/isar.dart';

class TaskEventRepositoryImpl implements TaskRepository {
  TaskEventRepositoryImpl({required this.isar});
  final Isar isar;

  @override
  Future<void> add({required Task task}) async {
    await isar.writeTxn(() async {
      await isar.tasks.put(task);
    });
  }

  @override
  Future<void> delete({required Id taskId}) async {
    await isar.writeTxn(() => isar.tasks.delete(taskId));
  }

  @override
  Future<Task?> fetch({required Id taskId}) async {
    final tasks = await isar.tasks.get(taskId);
    return tasks;
  }

  @override
  Future<List<Task>> fetchAll() async {
    return await isar.tasks.where().sortByDateTime().findAll();
  }

  @override
  Future<void> update({required Task task}) {
    throw UnimplementedError();
  }

  @override
  Future<int> getCount() {
    throw UnimplementedError();
  }
}
