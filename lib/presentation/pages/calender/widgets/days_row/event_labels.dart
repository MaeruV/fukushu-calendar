import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/table_calendar_page_.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final collapsedProvider = StateProvider<bool>((ref) => false);

/// Numbers to return accurate events in the cell.
const dayLabelContentHeight = 17;
const dayLabelVerticalMargin = 1;
const _dayLabelHeight = dayLabelContentHeight + (dayLabelVerticalMargin * 2);

const _eventLabelContentHeight = 8;
const _eventLabelBottomMargin = 3;
const _eventLabelHeight = _eventLabelContentHeight + _eventLabelBottomMargin;

/// Get events to be shown from [CalendarStateController]
///
/// Shows accurate number of [_EventLabel] by the height of the parent cell
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

  bool _hasEnoughSpace(double cellHeight, int eventsLength) {
    final eventsTotalHeight = _eventLabelHeight * eventsLength;
    final spaceForEvents = cellHeight - _dayLabelHeight;
    return spaceForEvents > eventsTotalHeight;
  }

  int _maxIndex(double cellHeight, int eventsLength) {
    final spaceForEvents = cellHeight - _dayLabelHeight;
    const indexing = 1;
    const indexForPlot = 1;
    return spaceForEvents ~/ _eventLabelHeight - (indexing + indexForPlot);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cellHeight = ref.watch(cellHeightProvider);
    final isCollapsed = ref.watch(collapsedProvider);
    final eventsOnTheDay = _eventsOnTheDay(date, events);

    if (cellHeight == null) {
      return const SizedBox.shrink();
    }

    if (isCollapsed && eventsOnTheDay.isNotEmpty) {
      return Center(
        child: Text(
          '+${eventsOnTheDay.length}',
          style: BrandText.bodySS.copyWith(color: BrandColor.grey),
        ),
      );
    }

    final hasEnoughSpace = _hasEnoughSpace(cellHeight, eventsOnTheDay.length);
    final maxIndex = _maxIndex(cellHeight, eventsOnTheDay.length);

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: eventsOnTheDay.length,
      itemBuilder: (context, index) {
        if (eventsOnTheDay.length == 1) {
          return _EventLabel(event: eventsOnTheDay[index], date: date);
        }
        if (hasEnoughSpace) {
          return _EventLabel(event: eventsOnTheDay[index], date: date);
        } else if (index < maxIndex) {
          return _EventLabel(event: eventsOnTheDay[index], date: date);
        } else if (index == maxIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _EventLabel(event: eventsOnTheDay[index], date: date),
              const Icon(
                Icons.more_horiz,
                size: 13,
              )
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _EventLabel extends ConsumerWidget {
  const _EventLabel({required this.event, required this.date});

  final CalendarEvent event;
  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final isSelected =
        date.isSameDay(ref.watch(calenderViewModelProvider).cellDateTime!);

    final textColor = isSelected
        ? theme.brightness == Brightness.dark
            ? Colors.black
            : Colors.white
        : theme.brightness == Brightness.dark
            ? Colors.white
            : Colors.black;
    return Container(
      margin: const EdgeInsets.only(right: 3),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 3,
              color: event.eventBackgroundColor,
              alignment: Alignment.center,
            ),
            const SizedBox(width: 1),
            Expanded(
              child: Text(
                event.eventName,
                style: BrandText.bodySS.copyWith(color: textColor),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
