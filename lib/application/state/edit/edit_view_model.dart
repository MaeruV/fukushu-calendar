import 'package:ebbinghaus_forgetting_curve/application/types/edit/edit_state.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_view_model.g.dart';

@riverpod
class EditViewModel extends _$EditViewModel {
  late Task? task;

  @override
  EditState build() {
    task = ref.watch(temporaryTaskProvider);

    final datetime = task != null
        ? task!.startTime
        : DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final titleText = task != null ? task!.title : '';
    final memoText = task != null ? task!.memo ?? '' : '';
    final List<int> intervalDays = task != null
        ? task!.dates.map((date) => date.daysInterval).toList()
        : [1, 3, 7, 14];
    final pallete = task != null ? task!.pallete : 'yellow';
    final hasTask = task != null ? true : false;

    return EditState(
      title: titleText,
      memo: memoText,
      dateTime: datetime,
      intervalDays: intervalDays,
      hasTask: hasTask,
      hasChanges: false,
      pallete: pallete,
    );
  }

  setTitleText(String text) {
    state = state.copyWith(title: text);
    _checkForChanges();
  }

  setMemoText(String text) {
    final memoText = text.replaceAll('\n', ' ');
    state = state.copyWith(memo: memoText);
    _checkForChanges();
  }

  setDateTime(DateTime time) {
    state = state.copyWith(dateTime: time);
    _checkForChanges();
  }

  updateIntervalDays(List<int> interval) {
    state = state.copyWith(intervalDays: interval);
    _checkForChanges();
  }

  setPalette(String pallete) {
    state = state.copyWith(pallete: pallete);
  }

  void _checkForChanges() {
    bool hasChanges = false;
    if (task != null) {
      bool isIntervalDaysEqual =
          listEquals(task!.dates.toList(), state.intervalDays);
      bool isDateTimeEqual = task!.startTime == state.dateTime;
      if (state.title != '') {
        hasChanges = task!.title != state.title ||
            task!.memo != state.memo ||
            !isDateTimeEqual ||
            !isIntervalDaysEqual;
      }
    } else {
      hasChanges = state.title != '';
    }
    state = state.copyWith(hasChanges: hasChanges);
  }
}
