import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar_test/widgets/days_row/event_labels.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appearamceCollapsedProvider = StateProvider<bool>((ref) => false);

class AppearanceEventLabels extends HookConsumerWidget {
  const AppearanceEventLabels({
    super.key,
    required this.date,
    required this.events,
  });

  final DateTime date;
  final List<CalendarEvent> events;

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

  bool hasEnoughSpace(
      double cellHeight, int eventsLength, int eventLabelHeight) {
    final eventsTotalHeight = eventLabelHeight * eventsLength;
    final spaceForEvents = cellHeight;
    return spaceForEvents > eventsTotalHeight;
  }

  int maxIndex(double cellHeight, int eventsLength, int eventLabelHeight) {
    final spaceForEvents = cellHeight;
    const indexing = 1;
    const indexForPlot = 1;
    return spaceForEvents ~/ eventLabelHeight - (indexing + indexForPlot);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsOnTheDay = _eventsOnTheDay(date, events);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: eventsOnTheDay.length,
      itemBuilder: (context, index) {
        return EventLabel(event: eventsOnTheDay[index], date: date);
      },
    );
  }
}
