import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_state.freezed.dart';

@freezed
class AnalysisState with _$AnalysisState {
  const factory AnalysisState({
    required List<DateTime> range,
    required int? indexTapped,
    required DateTime? dateTimeTapped,
    required DisplayMode displayMode,
  }) = _AnalysisState;
}
