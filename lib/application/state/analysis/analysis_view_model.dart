import 'package:ebbinghaus_forgetting_curve/application/types/analysis/analysis_state.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'analysis_view_model.g.dart';

@riverpod
class AnalysisViewModel extends _$AnalysisViewModel {
  @override
  AnalysisState build() {
    return AnalysisState(
      oneWeek: initializeWeeks(),
      indexTapped: null,
      dateTimeTapped: null,
    );
  }

  List<DateTime> initializeWeeks() {
    final now = DateTime.now().toZeroHour();
    var startweek = now.subtract(Duration(days: now.weekday - 1));
    var endweek = startweek.add(const Duration(days: 6));
    return [startweek, endweek];
  }

  void _updateWeekRange(DateTime date) {
    final startweek =
        date.subtract(Duration(days: date.weekday - 1)).toZeroHour();
    final endweek = startweek.add(const Duration(days: 6)).toZeroHour();
    state = state.copyWith(oneWeek: [startweek, endweek], indexTapped: null);
  }

  void goToPreviousWeek() {
    _updateWeekRange(state.oneWeek[0].subtract(const Duration(days: 7)));
  }

  void goToNextWeek() {
    _updateWeekRange(state.oneWeek[1].add(const Duration(days: 1)));
  }

  void barIndexTapped(int index) {
    final time = state.oneWeek[0].add(Duration(days: index));
    state = state.copyWith(indexTapped: index, dateTimeTapped: time);
  }
}
