import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompListView extends ConsumerWidget {
  const CompListView(
      {super.key, required this.dateTime, required this.taskDates});

  final DateTime dateTime;
  final List<TaskDate> taskDates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CompListWidget(taskDates: taskDates, dateTime: dateTime);
  }
}

class CompListWidget extends ConsumerWidget with PresentationMixin {
  const CompListWidget(
      {super.key, required this.taskDates, required this.dateTime});

  final List<TaskDate> taskDates;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final analysisState = ref.watch(analysisViewModelProvider);

    return Column(
      children: taskDates.map((taskDate) {
        final task = taskDate.task.value;
        if (task == null) {
          return const SizedBox.shrink();
        }
        final formatRange =
            "${task.firstRange} ${task.secoundRange != null ? "- ${task.secoundRange}" : ""} ${task.rangeType.stringToReviewRange().updateSelectionText(appLocalizations)}";
        return Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          elevation:
              Theme.of(context).brightness == Brightness.dark ? 8.0 : 1.0,
          color: theme.cardColor,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
          child: IntrinsicHeight(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Center(
                      child: Text(
                        taskDate.daysInterval
                            .toformatDay(appLocalizations.date),
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: theme.primaryColorLight),
                      ),
                    ),
                  ),
                  Container(
                    width: 8,
                    margin: const EdgeInsets.symmetric(vertical: 3.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(task.pallete),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: theme.primaryColorLight),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            formatRange,
                            style: BrandText.bodyS
                                .copyWith(color: BrandColor.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Checkbox(
                    activeColor: theme.primaryColorLight,
                    value: taskDate.checkFlag,
                    onChanged: (flag) {
                      execute(context, action: () async {
                        if (flag != null) {
                          ref.read(taskUsecaseProvider).saveTaskDate(
                                taskDate: taskDate,
                                flag: flag,
                                time: analysisState.dateTimeTapped,
                                weeks: analysisState.range,
                              );
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
