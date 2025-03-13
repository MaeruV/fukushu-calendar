import 'package:ebbinghaus_forgetting_curve/application/types/edit/edit_state.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/intervals/state/intervals_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/history.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_view_model.g.dart';

@riverpod
class EditViewModel extends _$EditViewModel {
  late Task? task;

  @override
  EditState build() {
    task = ref.watch(temporaryTaskProvider);
    _initializeEdit();
    return _buildInitialState();
  }

  EditState _buildInitialState() {
    final now = DateTime.now();
    final startTime = task?.startTime ?? DateTime(now.year, now.month, now.day);
    final titleText = task?.title ?? '';
    final memoText = task?.memo ?? '';
    final pallete = task?.pallete ?? 0xFF388E3C;
    final hasTime = task?.time.isNotEmpty ?? false;
    final checkDateTime =
        hasTime ? task!.time.first.dateTime : now.toZeroHour();
    final flagNotification = hasTime;
    final hasTask = task != null;
    final rangeType = task?.rangeType ?? "page";
    final firstRange = task?.firstRange;
    final secoundRange = task?.secoundRange;

    return EditState(
      title: titleText,
      reviewRange: rangeType.stringToReviewRange(),
      firstRange: firstRange,
      secoundRange: secoundRange,
      memo: memoText,
      startTime: startTime,
      intervalDays: const [], // 後で初期化される
      hasTask: hasTask,
      pallete: pallete,
      time: checkDateTime,
      flagNotification: flagNotification,
    );
  }

  void _initializeEdit() async {
    final inteval = await ref.read(fetchDefaultIntervalProvider.future);

    List<int> intervalDays = [1, 3, 7, 14, 30];

    intervalDays =
        task?.dates.map((date) => date.daysInterval).toList() ?? inteval!.nums;

    state = state.copyWith(intervalDays: intervalDays);
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

  setMaterialHistory(MaterialsHistory history) {
    state = state.copyWith(
      title: history.teachingMaterials,
      reviewRange: history.rangeType.stringToReviewRange(),
      firstRange: history.firstRange,
      secoundRange: history.secoundRange,
      intervalDays: history.intervalDays,
      pallete: history.pallete,
      time: history.notificationTime,
      flagNotification: history.flagNotification,
    );
    _checkForChanges();
  }

  setReviewRange(ReviewRange? reviewRange) {
    state = state.copyWith(reviewRange: reviewRange ?? ReviewRange.page);
  }

  setFirstRange(String range) {
    final formatRange = int.tryParse(range);
    if (formatRange != null) {
      state = state.copyWith(firstRange: formatRange);
      _checkForChanges();
    } else {
      state = state.copyWith(firstRange: 0);
    }
  }

  setSecoundRange(String range) {
    final formatRange = int.tryParse(range);
    if (formatRange != null) {
      state = state.copyWith(secoundRange: formatRange);
      _checkForChanges();
    } else {
      state = state.copyWith(secoundRange: 0);
    }
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
