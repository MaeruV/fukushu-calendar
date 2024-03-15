import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:flutter/material.dart';
// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_event.freezed.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent({
    required String eventName,
    required DateTime eventDate,
    required int eventID,
    required Color eventBackgroundColor,
    required TaskDate taskDate,
  }) = _CalendarEvent;
}
