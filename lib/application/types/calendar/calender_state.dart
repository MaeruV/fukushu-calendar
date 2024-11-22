// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calender_state.freezed.dart';

@freezed
class CalenderState with _$CalenderState {
  const factory CalenderState({
    required DateTime? cellDateTime,
    required List<CalendarEvent> dayEvents,
  }) = _CalenderState;
}
