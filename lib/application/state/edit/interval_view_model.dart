import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'interval_view_model.g.dart';

@Riverpod(keepAlive: false)
class IntervalViewModel extends _$IntervalViewModel {
  late DialogManager dialogManager;
  @override
  List<int> build() {
    final editState = ref.watch(editViewModelProvider);
    dialogManager = DialogManager();
    return editState.intervalDays;
  }

  void setNumber({
    required int num,
    required BuildContext context,
    required String sameNumContent,
    required String maxLengthContent,
  }) {
    if (state.contains(num)) {
      showDialog(
        context: context,
        builder: (context) => dialogManager.setIntervalDialog(
            content: sameNumContent, context: context),
      );
    } else if (state.length > 9) {
      showDialog(
        context: context,
        builder: (context) => dialogManager.setIntervalDialog(
            content: maxLengthContent, context: context),
      );
    } else {
      List<int> currentList = List<int>.from(state);
      currentList.add(num);
      currentList.sort();
      currentList = currentList.toSet().toList();
      state = currentList;
    }
  }

  void deleteNumber(int index) {
    List<int> currentList = List<int>.from(state);
    currentList.removeAt(index);
    state = currentList;
  }
}
