import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_state.freezed.dart';

@freezed
class EditState with _$EditState {
  const factory EditState({
    required String title,
    required ReviewRange reviewRange,
    required int? firstRange,
    required int? secoundRange,
    required String memo,
    required DateTime startTime,
    required List<int> intervalDays,
    required bool hasTask,
    required int pallete,
    required DateTime? time,
    required bool flagNotification,
    @Default(false) bool hasChanges,
  }) = _EditState;
}
