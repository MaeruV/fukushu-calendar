import 'package:ebbinghaus_forgetting_curve/application/types/calendar/calender_state.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'calender_view_model.g.dart';

final currentPageProvider = StateProvider<int>((ref) => 1200);

@Riverpod(keepAlive: true)
class CalenderViewModel extends _$CalenderViewModel {
  @override
  CalenderState build() {
    final dateTime = DateTime.now().toZeroHour();
    return CalenderState(
      cellDateTime: dateTime,
      dayEvents: [],
    );
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
