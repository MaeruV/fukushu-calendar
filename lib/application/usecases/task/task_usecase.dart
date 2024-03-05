import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/loading/overlay_loading_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/types/edit/edit_state.dart';
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
  StateController<Task?> get _temporaryTaskController =>
      _ref.read(temporaryTaskProvider.notifier);
  void _refreshTempTaskProvider(int taskId) =>
      _ref.refresh(tempTaskProvider(taskId: taskId).future);
  EditState get _editState => _ref.read(editViewModelProvider);

  Future<void> addTaskEvent() async {
    final task = Task()
      ..title = _ref.read(editViewModelProvider.notifier).textController.text
      ..memo = "1日300単語勉強する。これについてテストを行います。改行を出来るかどうかを確かめます。"
      ..dateTime = _editState.dateTime
      ..dates = _editState.intervalDays;

    await execute(
      loadingController: _loadingController,
      action: () async {
        await _taskRepository.add(task: task);
      },
    );

    _invalidateTasksProvider();
  }

  Future<void> updateTaskEvent() async {
    final task = _temporaryTaskController.state!
      ..title = _ref.read(editViewModelProvider.notifier).textController.text
      ..dateTime = _editState.dateTime
      ..dates = _editState.intervalDays;

    print('update');

    await execute(
      loadingController: _loadingController,
      action: () async {
        await _taskRepository.update(task: task);
      },
    );

    _refreshTempTaskProvider(task.id);
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

  void temporaryTask(Id taskId) async {
    final task = await execute(action: () async {
      return await _taskRepository.fetch(taskId: taskId);
    });

    _temporaryTaskController.state = task;
  }
}
