import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarListTile extends HookConsumerWidget with PresentationMixin {
  const CalendarListTile({super.key, required this.events});

  final List<CalendarEvent> events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final state = ref.watch(analysisViewModelProvider);

    return Column(
      children: events
          .map(
            (event) => switch (
                ref.watch(tempTaskDateProvider(taskDate: event.taskDate))) {
              AsyncError(:final error) => Text('Error: $error'),
              AsyncData(:final value) => Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  elevation: Theme.of(context).brightness == Brightness.dark
                      ? 8.0
                      : 1.0,
                  color: theme.cardColor,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        value != null
                            ? Container(
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8)),
                                  color: event.eventBackgroundColor,
                                ),
                              )
                            : Center(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: event.eventBackgroundColor,
                                  ),
                                ),
                              ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  event.eventName,
                                  style: theme.textTheme.bodyMedium,
                                ),
                                Text(
                                  value != null
                                      ? value.daysInterval
                                          .toformatDay(appLocalizations.date)
                                      : appLocalizations.start_date,
                                  style: theme.textTheme.bodySmall!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        value != null
                            ? Checkbox(
                                value: value.checkFlag,
                                onChanged: (flag) {
                                  execute(context, action: () async {
                                    if (flag != null) {
                                      ref
                                          .read(taskUsecaseProvider)
                                          .saveTaskDate(
                                            taskDate: value,
                                            flag: flag,
                                            time: state.dateTimeTapped,
                                            weeks: state.oneWeek,
                                          );
                                    }
                                  });
                                },
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              _ => const CircularProgressIndicator()
            },
          )
          .toList(),
    );
  }
}
