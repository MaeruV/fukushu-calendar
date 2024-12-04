import 'package:ebbinghaus_forgetting_curve/domain/entities/intervals.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_interval_state.freezed.dart';

@freezed
class EditIntervalState with _$EditIntervalState {
  const factory EditIntervalState({
    required Intervals? selectInterval,
    required List<Intervals> intervalDays,
  }) = _EditIntervalState;
}
