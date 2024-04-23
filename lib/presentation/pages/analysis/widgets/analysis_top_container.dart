import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/bar%20graph/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnalysisTopContainer extends ConsumerWidget {
  const AnalysisTopContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analysisState = ref.watch(analysisViewModelProvider);

    final config = ref.watch(compWeekDataProvider(weeks: analysisState.range));

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        switch (analysisState.displayMode) {
          case DisplayMode.week:
            return _buildWeeklyData(context, value, analysisState.range);
          case DisplayMode.month:
            return _buildMonthlyData(context, value, analysisState.range);
          case DisplayMode.year:
            return _buildYearlyData(context, value, analysisState.range);
          default:
            return const CircularProgressIndicator();
        }

      default:
        return const CircularProgressIndicator();
    }
  }

  Widget _buildWeeklyData(BuildContext context,
      Map<DateTime, List<TaskDate>> value, List<DateTime> range) {
    Map<DateTime, List<TaskDate>> weekDates = {};
    for (int i = 0; i < 7; i++) {
      final date = range[0].add(Duration(days: i));
      weekDates[date] = [];
    }

    value.forEach((key, value) {
      weekDates[key] = value;
    });

    List<DateTime> sortedKeys = weekDates.keys.toList()
      ..sort((a, b) => a.compareTo(b));

    List<double> weeklyTaskCounts = sortedKeys
        .map((date) => weekDates[date]?.length.toDouble() ?? 0.0)
        .toList();

    return MyBarGraph(summary: weeklyTaskCounts, mode: DisplayMode.week);
  }

  Widget _buildMonthlyData(BuildContext context,
      Map<DateTime, List<TaskDate>> value, List<DateTime> range) {
    Map<DateTime, int> weekCounts = {};

    value.forEach((date, tasks) {
      DateTime weekStart = date.subtract(Duration(days: date.weekday - 1));
      weekCounts.update(weekStart, (count) => count + tasks.length,
          ifAbsent: () => tasks.length);
    });

    List<DateTime> weeks = [];
    DateTime firstDayOfMonth = DateTime(range.first.year, range.first.month);
    DateTime lastDayOfMonth =
        DateTime(range.first.year, range.first.month + 1, 0);
    for (DateTime weekStart = firstDayOfMonth;
        weekStart.isBefore(lastDayOfMonth);
        weekStart = weekStart.add(const Duration(days: 7))) {
      weeks.add(weekStart);
    }

    List<double> weeklyTaskCounts = weeks
        .map((weekStart) => weekCounts[weekStart]?.toDouble() ?? 0.0)
        .toList();

    return MyBarGraph(summary: weeklyTaskCounts, mode: DisplayMode.month);
  }

  Widget _buildYearlyData(BuildContext context,
      Map<DateTime, List<TaskDate>> value, List<DateTime> range) {
    Map<int, int> monthCounts = {};

    value.forEach((date, tasks) {
      int month = date.month;
      monthCounts.update(month, (count) => count + tasks.length,
          ifAbsent: () => tasks.length);
    });

    List<double> monthlyTaskCounts = List.generate(12, (index) {
      return monthCounts[index + 1]?.toDouble() ?? 0.0;
    });

    return MyBarGraph(summary: monthlyTaskCounts, mode: DisplayMode.year);
  }
}
