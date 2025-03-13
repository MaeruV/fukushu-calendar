import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_selection_view_model.g.dart';

final editTaskAllProvider = StateProvider<bool>((ref) => false);

@riverpod
class TaskSelectionViewModel extends _$TaskSelectionViewModel {
  @override
  Map<Task, bool> build() {
    return {};
  }

  void toggleTask(Task task) {
    state = {
      ...state,
      task: !(state[task] ?? false),
    };
  }

  void clearSelections() {
    state = {};
  }

  List<Task> get selectedTasks => state.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();
}
