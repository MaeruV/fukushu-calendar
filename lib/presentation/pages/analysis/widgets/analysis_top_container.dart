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
    final weeks = ref.watch(analysisViewModelProvider);
    final config = ref.watch(compWeekDataProvider(weeks: weeks.oneWeek));

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        Map<DateTime, List<TaskDate>> weekDates = {};
        for (int i = 0; i < 7; i++) {
          final date = weeks.oneWeek[0].add(Duration(days: i));
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

        return MyBarGraph(weeklySummary: weeklyTaskCounts);

      default:
        return const CircularProgressIndicator();
    }
  }
}
