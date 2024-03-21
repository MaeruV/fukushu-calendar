import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/event_labels.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/measure_size.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cellHeightProvider = StateProvider<double?>((ref) => null);

class TableCalendarPage extends ConsumerWidget {
  const TableCalendarPage({
    super.key,
    required this.tableHeight,
    required this.visiblePageDate,
    required this.events,
    required this.onCellTapped,
  });
  final double tableHeight;
  final DateTime visiblePageDate;
  final List<CalendarEvent> events;
  final void Function(DateTime, int)? onCellTapped;

  List<DateTime> _getCurrentDates(DateTime dateTime) {
    final List<DateTime> result = [];
    final firstDay = _getFirstDate(dateTime);
    result.add(firstDay);
    for (int i = 0; i + 1 < 42; i++) {
      result.add(firstDay.add(Duration(days: i + 1)));
    }
    return result;
  }

  DateTime _getFirstDate(DateTime dateTime) {
    final firstDayOfTheMonth = DateTime(dateTime.year, dateTime.month, 1);
    return firstDayOfTheMonth.add(firstDayOfTheMonth.weekday.daysDuration);
  }

  List<List<DateTime>> _getWeeks(DateTime dateTime) {
    final List<DateTime> dates = _getCurrentDates(dateTime);
    List<List<DateTime>> weeks = [];
    for (int i = 0; i < dates.length; i += 7) {
      weeks.add(dates.sublist(i, i + 7));
    }
    return weeks;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final weeks = _getWeeks(visiblePageDate);
    return Table(
      border: TableBorder.symmetric(
        inside: const BorderSide(color: Colors.grey, width: 0.5),
        outside: const BorderSide(color: Colors.grey, width: 0.3),
      ),
      children: weeks.map((week) {
        return TableRow(
          children: week.map((date) {
            final isCurrentMonth = visiblePageDate.month == date.month;
            final double opacityValue = isCurrentMonth ? 1.0 : 0.4;
            final isToday = date.isSameDay(DateTime.now());
            final isSelected = date
                .isSameDay(ref.watch(calenderViewModelProvider).cellDateTime!);
            final cellHeight = tableHeight / weeks.length;
            final containerColor =
                isSelected ? theme.primaryColor : Colors.transparent;
            final textColor = isSelected
                ? (isToday ? Colors.blue : theme.primaryColorDark)
                : (isToday ? Colors.blue : theme.primaryColorLight);

            return TableCell(
              child: GestureDetector(
                onTap: () => onCellTapped?.call(date, week.indexOf(date)),
                child: Opacity(
                  opacity: opacityValue,
                  child: Container(
                    height: cellHeight,
                    decoration: BoxDecoration(
                      color: containerColor,
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: dayLabelVerticalMargin.toDouble()),
                          height: dayLabelContentHeight.toDouble(),
                          child: Text(date.day.toString(),
                              style: theme.textTheme.bodySmall!
                                  .copyWith(color: textColor)),
                        ),
                        Expanded(
                          child: MeasureSize(
                              onChange: (Size? size) {
                                final notifier =
                                    ref.read(cellHeightProvider.notifier);
                                notifier.state = size!.height;
                              },
                              child: EventLabels(
                                date: date,
                                events: events,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
