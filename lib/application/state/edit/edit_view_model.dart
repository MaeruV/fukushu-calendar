import 'package:ebbinghaus_forgetting_curve/application/types/edit/edit_state.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_view_model.g.dart';

@riverpod
class EditViewModel extends _$EditViewModel {
  late Task? task;

  @override
  EditState build() {
    task = ref.watch(temporaryTaskProvider);

    final startTime = task?.startTime ??
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final titleText = task?.title ?? '';
    final memoText = task?.memo ?? '';
    final List<int> intervalDays =
        task?.dates.map((date) => date.daysInterval).toList() ?? [1, 3, 7, 14];
    final pallete = task?.pallete ?? 0xFF388E3C;
    final hasTime = task?.time.toList() != null;
    final checkDateTime = hasTime && task?.time.toList().isNotEmpty == true
        ? task?.time.toList().first.dateTime
        : null;
    final bool flagNotification =
        hasTime && task?.time.toList().isNotEmpty == true;

    return EditState(
      title: titleText,
      memo: memoText,
      startTime: startTime,
      intervalDays: intervalDays,
      hasTask: false,
      pallete: pallete,
      time: checkDateTime,
      flagNotification: flagNotification,
    );
  }

  setNotificationFlag(bool flag) {
    state =
        state.copyWith(flagNotification: flag, time: flag ? state.time : null);
    _checkForChanges();
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
    state = state.copyWith(startTime: time);
    _checkForChanges();
  }

  setTime(DateTime time) {
    state = state.copyWith(time: time);
    _checkForChanges();
  }

  updateIntervalDays(List<int> interval) {
    state = state.copyWith(intervalDays: interval);
    _checkForChanges();
  }

  setPalette(int pallete) {
    state = state.copyWith(pallete: pallete);
    _checkForChanges();
  }

  void _checkForChanges() {
    state = state.copyWith(hasChanges: state.title != '');
  }
}
