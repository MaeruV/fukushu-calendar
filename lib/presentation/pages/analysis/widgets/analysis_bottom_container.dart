import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/app%20bar/analysis_select_data.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/completed/comp_event_list_view.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/analysis/widgets/completed/comp_task_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AnalysisBottomContainer extends ConsumerWidget {
  const AnalysisBottomContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analysisViewModelProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final dataState = ref.watch(dataModeProvider);
    AsyncValue<List<dynamic>> config;
    String modeText;

    switch (dataState) {
      case DataMode.tasks:
        config =
            ref.watch(fetchDataForTappedProvider(times: state.dateTimeTapped));
        modeText = appLocalizations.lowercase_task;

      default:
        config = ref.watch(
            fetchCompEventForTappedProvider(times: state.dateTimeTapped));
        modeText = appLocalizations.lowercase_event;
    }

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const Center(
            child: SizedBox(
                height: 50, width: 50, child: CircularProgressIndicator()));

      case AsyncData(:final value):
        Widget widget;
        if (state.dateTimeTapped.isNotEmpty) {
          widget = SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnalysisBottomTitleWidget(times: state.dateTimeTapped),
                      RichText(
                        text: TextSpan(
                            text: value.length.toString(),
                            style: theme.textTheme.titleSmall!
                                .copyWith(color: theme.primaryColorLight),
                            children: [
                              TextSpan(
                                text: " $modeText",
                                style: theme.textTheme.bodySmall!,
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                dataState == DataMode.tasks
                    ? CompListView(
                        dateTime: state.dateTimeTapped[0],
                        taskDates: value as List<TaskDate>)
                    : CompEventListView(
                        dateTime: state.dateTimeTapped[0],
                        tasks: value as List<Task>)
              ],
            ),
          );
        } else {
          widget = Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AnalysisBottomTitleWidget(times: state.range),
            ),
          );
        }
        return widget;
      default:
        return const Center(
            child: SizedBox(
                height: 50, width: 50, child: CircularProgressIndicator()));
    }
  }
}

class AnalysisBottomTitleWidget extends ConsumerWidget {
  const AnalysisBottomTitleWidget({super.key, required this.times});
  final List<DateTime> times;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analysisViewModelProvider);
    final theme = Theme.of(context);
    final style = theme.textTheme.titleSmall;
    final appLocalizations = AppLocalizations.of(context)!;

    // 日付範囲をフォーマットする共通関数
    Widget formatDateRange(DateTime start, DateTime end) {
      switch (appLocalizations.date) {
        case "en_US":
          final startFormat = DateFormat("MMMM d", "en_US").format(start);
          final endFormat = DateFormat("d, yyyy", "en_US").format(end);
          return Row(
            children: [
              Text(startFormat, style: style),
              const Text(" - "),
              Text(endFormat, style: style),
            ],
          );
        default:
          final startFormat =
              DateFormat("yyyy年MMMMd", appLocalizations.localeName)
                  .format(start);
          final endFormat =
              DateFormat("MMMMd", appLocalizations.localeName).format(end);
          return Row(
            children: [
              Text(startFormat, style: style),
              const Text(" - "),
              Text(endFormat, style: style),
            ],
          );
      }
    }

    // DisplayMode.weekの場合のフォーマット
    Widget formatWeek(DateTime date) {
      DateFormat dateFormat;
      switch (appLocalizations.date) {
        case "en_US":
          dateFormat = DateFormat("MMMM d, yyyy", appLocalizations.localeName);
        default:
          dateFormat = DateFormat("yyyy年MMMMd日", appLocalizations.localeName);
      }

      return Align(
          alignment: Alignment.topLeft,
          child: Text(dateFormat.format(date), style: style));
    }

    // DisplayModeに基づいて表示を切り替え
    switch (state.displayMode) {
      case DisplayMode.week:
        if (state.dateTimeTapped.isNotEmpty) {
          return formatWeek(times[0]);
        } else {
          return formatDateRange(times[0], times[1]);
        }
      case DisplayMode.year:
        return formatDateRange(times[0], times[1]);
      default:
        return Container();
    }
  }
}
