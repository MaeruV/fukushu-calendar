import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompEventListView extends ConsumerWidget {
  const CompEventListView(
      {super.key, required this.dateTime, required this.tasks});

  final DateTime dateTime;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        children: tasks.map((task) {
      return CompEventListWidget(task: task);
    }).toList());
  }
}

class CompEventListWidget extends ConsumerWidget {
  const CompEventListWidget({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final formattedIntervals =
        task.dates.map((interval) => '${interval.daysInterval}').join(', ');

    String selectionText = task.rangeType
        .stringToReviewRange()
        .updateSelectionText(appLocalizations);
    final formatRange =
        "${task.firstRange} ${task.secoundRange != null ? "- ${task.secoundRange}" : ""} $selectionText";

    return GestureDetector(
      onTap: () => context.push('/comp_event_check_task', extra: task.id),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
        child: IntrinsicHeight(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              children: [
                Container(
                  width: 8,
                  decoration: BoxDecoration(
                      color: Color(task.pallete),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: theme.textTheme.titleSmall!
                              .copyWith(color: theme.primaryColorLight),
                        ),
                        task.memo.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 5.0, top: 5.0),
                                child: Text(
                                  task.memo,
                                  style: theme.textTheme.labelMedium!
                                      .copyWith(color: theme.primaryColorLight),
                                ),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(height: 5),
                        Text(
                          "${appLocalizations.review_range} $formatRange",
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: theme.primaryColorLight),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${appLocalizations.interval} $formattedIntervals ${appLocalizations.days_after}",
                          style: theme.textTheme.labelMedium!
                              .copyWith(color: theme.primaryColorLight),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
