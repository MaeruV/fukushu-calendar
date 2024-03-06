// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:flutter/foundation.dart';
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
    @Default(false) bool hasChanges,
  }) = _EditState;
}
