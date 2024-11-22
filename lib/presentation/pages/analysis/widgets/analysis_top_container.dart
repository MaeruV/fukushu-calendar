import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/app%20bar/analysis_select_data.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/bar%20graph/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnalysisTopContainer extends ConsumerWidget {
  const AnalysisTopContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analysisState = ref.watch(analysisViewModelProvider);
    final dataState = ref.watch(dataModeProvider);
    AsyncValue<Map<DateTime, List<dynamic>>> config;
    if (dataState == DataMode.tasks) {
      config =
          ref.watch(compTaskDataPeriodProvider(weeks: analysisState.range));
    } else {
      config =
          ref.watch(compEventDataPeriodProvider(weeks: analysisState.range));
    }
    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        switch (analysisState.displayMode) {
          case DisplayMode.week:
            return _buildWeeklyData(context, value, analysisState.range);

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
      Map<DateTime, List<dynamic>> value, List<DateTime> range) {
    Map<DateTime, List<dynamic>> weekDates = {};
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

  Widget _buildYearlyData(BuildContext context,
      Map<DateTime, List<dynamic>> value, List<DateTime> range) {
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
