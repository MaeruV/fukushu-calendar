// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'others_state.freezed.dart';

@freezed
class OthersState with _$OthersState {
  const factory OthersState({
    required bool darkMode,
    required bool notification,
  }) = _OthersState;
}
