import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/run_usecase_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/domain/repository/task_event_repository_interface.dart';
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

  Future<void> addTaskEvent({
    required String title,
    required String memo,
    required DateTime dateTime,
    required List<int> dates,
  }) async {
    await execute(
      loadingController: _loadingController,
      action: () async {
        await _taskRepository.add(
          task: Task()
            ..title = title
            ..memo = memo
            ..dateTime = dateTime
            ..dates = dates,
        );
      },
    );
    _invalidateTasksProvider();
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
      final dateOnly =
          DateTime(task.dateTime.year, task.dateTime.month, task.dateTime.day);
      groupedTasks.putIfAbsent(dateOnly, () => []).add(task);
    }

    return groupedTasks;
  }

  Future<void> deleteTaskEvent(Id taskId) async {
    await _taskRepository.delete(taskId: taskId);
    _invalidateTasksProvider();
  }

  Future<Task?> fetchTask(Id taskId) async {
    final task = await execute(action: () async {
      return await _taskRepository.fetch(taskId: taskId);
    });
    return task;
  }
}
