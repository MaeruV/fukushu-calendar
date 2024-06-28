import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/pages/calendar_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarList extends ConsumerWidget {
  final List<CalendarEvent> events;
  const CalendarList({
    super.key,
    required this.events,
  });

  List<CalendarEvent> _eventsOnTheDay(
      DateTime date, List<CalendarEvent> events) {
    final res = events
        .where((event) =>
            event.eventDate.year == date.year &&
            event.eventDate.month == date.month &&
            event.eventDate.day == date.day)
        .toList();
    return res;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tappedCell = ref.watch(tappedCellProvider);
    final eventsOnTheDay = tappedCell.isNotEmpty
        ? _eventsOnTheDay(tappedCell.values.first, events)
        : null;

    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  tappedCell.isNotEmpty
                      ? tappedCell.values.first
                          .toSimpleFormat(appLocalizations.date)
                      : "",
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.primaryColorLight)),
              RichText(
                text: TextSpan(
                    text: eventsOnTheDay?.length.toString() ?? "0",
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: theme.primaryColorLight),
                    children: [
                      TextSpan(
                        text: " ${appLocalizations.task}",
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: theme.primaryColorLight),
                      )
                    ]),
              ),
            ],
          ),
          const SizedBox(height: 5),
          CalendarListTile(events: eventsOnTheDay),
        ],
      ),
    );
  }
}

class CalendarListTile extends HookConsumerWidget with PresentationMixin {
  const CalendarListTile({super.key, required this.events});

  final List<CalendarEvent>? events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;
    final state = ref.watch(analysisViewModelProvider);

    return events != null
        ? Column(
            children: events!.map(
              (event) {
                final formatRange =
                    "${event.firstRange} ${event.secoundRange != null ? "- ${event.secoundRange}" : ""} ${event.rangeType.updateSelectionText(appLocalizations)}";
                return switch (
                    ref.watch(tempTaskDateProvider(taskDate: event.taskDate))) {
                  AsyncError(:final error) => Text('Error: $error'),
                  AsyncData(:final value) => Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      elevation: Theme.of(context).brightness == Brightness.dark
                          ? 8.0
                          : 1.0,
                      color: theme.cardColor,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 70,
                              child: Center(
                                child: Text(
                                  value != null
                                      ? value.daysInterval
                                          .toformatDay(appLocalizations.date)
                                      : appLocalizations.start_date,
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
                                color: event.eventBackgroundColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      event.eventName,
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    Text(
                                      formatRange,
                                      style: theme.textTheme.bodySmall,
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
                                                weeks: state.range,
                                              );
                                        }
                                      },
                                          failureMessage: '',
                                          scaffoldMessenger:
                                              ScaffoldMessenger.of(context));
                                    },
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  _ => const CircularProgressIndicator()
                };
              },
            ).toList(),
          )
        : const SizedBox.shrink();
  }
}
