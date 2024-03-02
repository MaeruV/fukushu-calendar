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
    required TextStyle eventTextStyle,
    required DateTime eventDate,
    required String? eventID,
    required Color eventBackgroundColor,
  }) = _CalendarEvent;
}
