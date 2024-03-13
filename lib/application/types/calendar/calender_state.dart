// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calender_state.freezed.dart';

@freezed
class CalenderState with _$CalenderState {
  const factory CalenderState({
    required PageController pageController,
    required int currentIndex,
    required DateTime? cellDateTime,
    required int? cellIndex,
  }) = _CalenderState;
}
