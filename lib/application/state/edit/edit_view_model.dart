import 'package:ebbinghaus_forgetting_curve/application/types/edit/edit_state.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_view_model.g.dart';

@riverpod
class EditViewModel extends _$EditViewModel {
  late TextEditingController textController;

  @override
  EditState build() {
    textController = TextEditingController();

    final task = ref.watch(temporaryTaskProvider);
    final datetime = task != null
        ? task.dateTime
        : DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final titleText = task != null ? task.title : '';
    final intervalDays = task != null ? task.dates : [1, 3, 7, 14, 30];
    final hasTask = task != null ? true : false;
    ref.onDispose(() {
      print('onDisposeされました');
    });

    return EditState(
      dateTime: datetime,
      notification: true,
      titleText: textController.text = titleText,
      intervalDays: intervalDays,
      hasTask: hasTask,
    );
  }

  setDateTime(DateTime time) {
    state = state.copyWith(dateTime: time);
  }

  toggleNotification(bool toggle) {
    state = state.copyWith(notification: toggle);
  }

  updateIntervalDays(List<int> interval) {
    state = state.copyWith(intervalDays: interval);
  }
}
