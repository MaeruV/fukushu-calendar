import 'package:ebbinghaus_forgetting_curve/application/types/calendar/calender_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'calender_view_model.g.dart';

@riverpod
class CalenderViewModel extends _$CalenderViewModel {
  @override
  CalenderState build() {
    return CalenderState(
      pageController: PageController(initialPage: 1200),
      currentIndex: 1200,
      cellDateTime: null,
      cellIndex: null,
    );
  }

  void changeCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void tappedCell(DateTime time, int index) {
    state = state.copyWith(cellDateTime: time, cellIndex: index);
  }
}
