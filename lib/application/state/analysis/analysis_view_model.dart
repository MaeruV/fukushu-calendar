import 'package:ebbinghaus_forgetting_curve/application/types/analysis/analysis_state.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'analysis_view_model.g.dart';

// analysis_state.dart
enum DisplayMode { week, month, year }

@riverpod
class AnalysisViewModel extends _$AnalysisViewModel {
  @override
  AnalysisState build() {
    return AnalysisState(
      range: initializeWeeks(),
      indexTapped: null,
      dateTimeTapped: [],
      displayMode: DisplayMode.week,
    );
  }

  List<DateTime> initializeWeeks() {
    final now = DateTime.now().toZeroHour();
    var startweek = now.subtract(Duration(days: now.weekday - 1));
    var endweek = startweek.add(const Duration(days: 6));
    return [startweek, endweek];
  }

  void goToPrevious() {
    DateTime startDate = state.range[0];
    DateTime newStartDate;

    switch (state.displayMode) {
      case DisplayMode.week:
        newStartDate = startDate.subtract(const Duration(days: 7));
        break;
      case DisplayMode.month:
        newStartDate = DateTime(startDate.year, startDate.month - 1, 1);
        break;
      case DisplayMode.year:
        newStartDate = DateTime(startDate.year - 1, 1, 1);
        break;
    }

    _updateRange(newStartDate);
  }

  void goToNext() {
    DateTime endDate = state.range[1];
    DateTime newStartDate;

    switch (state.displayMode) {
      case DisplayMode.week:
        newStartDate = endDate.add(const Duration(days: 1));
        break;
      case DisplayMode.month:
        newStartDate = DateTime(endDate.year, endDate.month + 1, 1);
        break;
      case DisplayMode.year:
        newStartDate = DateTime(endDate.year + 1, 1, 1);
        break;
    }

    _updateRange(newStartDate);
  }

  void _updateRange(DateTime startDate) {
    List<DateTime> newRange;

    switch (state.displayMode) {
      case DisplayMode.week:
        final startWeek = startDate;
        final endWeek = startWeek.add(const Duration(days: 6));
        newRange = [startWeek, endWeek];
        break;
      case DisplayMode.month:
        final startMonth = DateTime(startDate.year, startDate.month, 1);
        final endMonth = DateTime(startDate.year, startDate.month + 1, 0);
        newRange = [startMonth, endMonth];
        break;
      case DisplayMode.year:
        final startYear = DateTime(startDate.year, 1, 1);
        final endYear = DateTime(startDate.year + 1, 1, 0);
        newRange = [startYear, endYear];
        break;
    }

    state = state.copyWith(
      range: newRange,
      indexTapped: null,
      dateTimeTapped: [],
    );
  }

  void barIndexTapped(int index) {
    DateTime startDate;
    DateTime endDate;

    switch (state.displayMode) {
      case DisplayMode.week:
        startDate = state.range[0].add(Duration(days: index));
        endDate = startDate.add(const Duration(days: 1));
        break;
      case DisplayMode.month:
        // 月モードの場合、タップされた週の開始日と終了日を計算
        startDate = state.range[0].add(Duration(days: index * 7));
        endDate = startDate.add(const Duration(days: 6));
        break;
      case DisplayMode.year:
        // 年モードの場合、タップされた月の開始日と終了日を計算
        startDate = DateTime(state.range[0].year, index + 1, 1);
        endDate = DateTime(state.range[0].year, index + 2, 0);
        break;
    }

    state = state
        .copyWith(indexTapped: index, dateTimeTapped: [startDate, endDate]);
  }

  void setDisplayMode(DisplayMode mode) {
    List<DateTime> newRange;
    final now = DateTime.now().toZeroHour();
    switch (mode) {
      case DisplayMode.week:
        var startWeek = now.subtract(Duration(days: now.weekday - 1));
        var endWeek = startWeek.add(const Duration(days: 6));
        newRange = [startWeek, endWeek];
        break;
      case DisplayMode.month:
        var startMonth = DateTime(now.year, now.month, 1);
        var endMonth = DateTime(now.year, now.month + 1, 0);
        newRange = [startMonth, endMonth];
        break;
      case DisplayMode.year:
        var startYear = DateTime(now.year, 1, 1);
        var endYear = DateTime(now.year, 12, 31);
        newRange = [startYear, endYear];
        break;
    }
    state = state.copyWith(
      displayMode: mode,
      range: newRange,
      indexTapped: null,
      dateTimeTapped: [],
    );
  }
}
