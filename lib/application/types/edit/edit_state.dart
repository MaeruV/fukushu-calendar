import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_state.freezed.dart';

@freezed
class EditState with _$EditState {
  const factory EditState({
    required String title,
    required String memo,
    required DateTime dateTime,
    required List<int> intervalDays,
    required bool hasTask,
    required int pallete,
    required DateTime time,
    @Default(false) bool hasChanges,
  }) = _EditState;
}
