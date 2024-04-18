import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_state.freezed.dart';

@freezed
class AnalysisState with _$AnalysisState {
  const factory AnalysisState({
    required List<DateTime> oneWeek,
    required int? indexTapped,
    required DateTime? dateTimeTapped,
  }) = _AnalysisState;
}
