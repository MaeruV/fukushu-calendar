import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/completed/widgets/comp_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnalysisBottomContainer extends ConsumerWidget {
  const AnalysisBottomContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analysisViewModelProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    DateTime? time;
    state.indexTapped != null
        ? time = state.oneWeek[0].add(Duration(days: state.indexTapped!))
        : time = null;

    final config = ref.watch(compDayDataProvider(time: time));

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        Widget widget;
        time != null
            ? widget = SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(time.toSimpleFormat(appLocalizations.date),
                            style: theme.textTheme.titleSmall!),
                        RichText(
                          text: TextSpan(
                              text: value.length.toString(),
                              style: theme.textTheme.titleSmall!
                                  .copyWith(color: theme.primaryColorLight),
                              children: [
                                TextSpan(
                                  text: " ${appLocalizations.task}",
                                  style: theme.textTheme.bodySmall!,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                  CompListView(dateTime: time, taskDates: value),
                ],
              ))
            : widget = const SizedBox.shrink();
        return widget;

      default:
        return const CircularProgressIndicator();
    }
  }
}
