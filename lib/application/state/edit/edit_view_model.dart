import 'package:ebbinghaus_forgetting_curve/application/types/edit/edit_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_view_model.g.dart';

@riverpod
class EditViewModel extends _$EditViewModel {
  late TextEditingController textController;

  @override
  EditState build() {
    textController = TextEditingController();

    ref.onDispose(() {
      textController.dispose();
    });

    return EditState(
      dateTime: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      notification: true,
      titleText: textController.text,
      intervalDays: [1, 3, 7, 14, 30],
    );
  }

  init({
    required DateTime datetime,
    required bool notification,
    required String text,
    required List<int> intervalDays,
  }) {
    // state = EditState(
    //   dateTime: datetime,
    //   notification: notification,
    //   titleText: text,
    //   intervalDays: intervalDays,
    // );
    state = state.copyWith(
      titleText: text,
      dateTime: datetime,
      intervalDays: intervalDays,
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
