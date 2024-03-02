// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_state.freezed.dart';

@freezed
class ScreenState with _$ScreenState {
  const factory ScreenState({
    required double mediaHeight,
    required double safeAreaTop,
  }) = _ScreenState;
}
