import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/theme/custom_theme.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/table_calendar_page_.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final collapsedProvider = StateProvider<bool>((ref) => false);

class EventLabels extends HookConsumerWidget {
  const EventLabels({
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

  bool _hasEnoughSpace(
      double cellHeight, int eventsLength, int eventLabelHeight) {
    final eventsTotalHeight = eventLabelHeight * eventsLength;
    return cellHeight > eventsTotalHeight;
  }

  int _maxIndex(double cellHeight, int eventsLength, int eventLabelHeight) {
    const indexing = 1;
    const indexForPlot = 1;
    return cellHeight ~/ eventLabelHeight - (indexing + indexForPlot);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventLabelContentHeight = ref.watch(customThemeProvider).textHeight;

    final cellHeight = ref.watch(cellHeightProvider);
    final isCollapsed = ref.watch(collapsedProvider);
    final eventsOnTheDay = _eventsOnTheDay(date, events);
    final theme = Theme.of(context);

    if (cellHeight == null) {
      return const SizedBox.shrink();
    }

    if (isCollapsed && eventsOnTheDay.isNotEmpty) {
      final items = List.generate(
          eventsOnTheDay.length,
          (index) => Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(left: 17.0 * index),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: eventsOnTheDay[index].taskDate != null
                      ? Colors.transparent
                      : eventsOnTheDay[index].eventBackgroundColor,
                  border: Border.all(
                    color: eventsOnTheDay[index].taskDate != null
                        ? eventsOnTheDay[index].eventBackgroundColor
                        : Colors.transparent,
                    width: 4.0, // 外枠の太さ
                  ),
                ),
              ));

      return ClipRect(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: items,
        ),
      );
    }

    final hasEnoughSpace = _hasEnoughSpace(
        cellHeight, eventsOnTheDay.length, eventLabelContentHeight);
    final maxIndex =
        _maxIndex(cellHeight, eventsOnTheDay.length, eventLabelContentHeight);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: eventsOnTheDay.length,
      itemBuilder: (context, index) {
        if (eventsOnTheDay.length == 1) {
          return EventLabel(event: eventsOnTheDay[index], date: date);
        }
        if (hasEnoughSpace) {
          return EventLabel(event: eventsOnTheDay[index], date: date);
        } else if (index <= maxIndex) {
          return EventLabel(event: eventsOnTheDay[index], date: date);
        } else if (index == maxIndex + 1) {
          int remainingEvents = eventsOnTheDay.length - maxIndex - 1;
          return Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Text(
              '+$remainingEvents',
              style:
                  theme.textTheme.labelSmall!.copyWith(color: BrandColor.grey),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class EventLabel extends ConsumerWidget {
  const EventLabel({super.key, required this.event, required this.date});

  final CalendarEvent event;
  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final eventLabelContentHeight = ref.watch(customThemeProvider).textHeight;

    final isSelected =
        date.isSameDay(ref.watch(calenderViewModelProvider).cellDateTime!);

    final textColor = isSelected
        ? theme.brightness == Brightness.dark
            ? Colors.black
            : Colors.white
        : theme.brightness == Brightness.dark
            ? Colors.white
            : Colors.black;
    if (event.completedFlag) {
      return const SizedBox.shrink();
    }
    return Container(
      height: eventLabelContentHeight.toDouble(),
      margin: const EdgeInsets.only(right: 3),
      color: event.taskDate != null
          ? Colors.transparent
          : event.eventBackgroundColor.withOpacity(0.4),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            width: 3,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: event.eventBackgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(1.0))),
          ),
          const SizedBox(width: 1),
          Expanded(
            child: Text(
              event.eventName,
              softWrap: false,
              overflow: TextOverflow.clip,
              style: theme.textTheme.labelSmall!.copyWith(
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
