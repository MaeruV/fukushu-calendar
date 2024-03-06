import 'package:ebbinghaus_forgetting_curve/application/state/edit/edit_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/dialog_manager.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/app_constants.dart';

part 'interval_view_model.g.dart';

@riverpod
class IntervalViewModel extends _$IntervalViewModel {
  @override
  List<int> build() {
    final editState = ref.watch(editViewModelProvider);
    return editState.intervalDays;
  }

  void setNumber(int num, BuildContext context) {
    if (state.contains(num)) {
      showDialog(
        context: context,
        builder: (context) => const DialogManager(content: sameNumContent),
      );
    } else if (state.length > 9) {
      showDialog(
        context: context,
        builder: (context) => const DialogManager(content: maxLengthContent),
      );
    } else {
      List<int> currentList = List<int>.from(state);
      currentList.add(num);
      currentList.sort();
      currentList.toSet().toList();
      state = currentList;
    }
  }

  void deleteNumber(int index) {
    List<int> currentList = List<int>.from(state);
    currentList.removeAt(index);
    state = currentList;
  }
}
