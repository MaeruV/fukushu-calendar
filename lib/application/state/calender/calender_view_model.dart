import 'package:ebbinghaus_forgetting_curve/application/types/calendar/calender_state.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'calender_view_model.g.dart';

@riverpod
class CalenderViewModel extends _$CalenderViewModel {
  @override
  CalenderState build() {
    final dateTime = DateTime.now().toZeroHour();
    return CalenderState(
      pageController: PageController(initialPage: 1200),
      currentIndex: 1200,
      cellDateTime: dateTime,
      dayEvents: [],
    );
  }

  void changeCurrentIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void tappedCell(DateTime time) {
    state = state.copyWith(cellDateTime: time);
  }

  void getCalendarEvent(
    List<CalendarEvent> events,
  ) {
    state = state.copyWith(dayEvents: events);
  }
}
