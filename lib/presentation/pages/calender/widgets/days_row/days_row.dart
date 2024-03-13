import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/event_labels.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/measure_size.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cellHeightProvider = StateProvider<double?>((ref) => null);

class DaysRow extends StatelessWidget {
  const DaysRow({
    Key? key,
    required this.visiblePageDate,
    required this.dates,
    required this.onCellTapped,
    required this.events,
  }) : super(key: key);

  final List<DateTime> dates;
  final DateTime visiblePageDate;
  final void Function(DateTime)? onCellTapped;
  final List<CalendarEvent> events;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
          children: List.generate(dates.length, (index) {
        return _DayCell(
          cellIndex: index,
          date: dates[index],
          visiblePageDate: visiblePageDate,
          onCellTapped: () {
            onCellTapped?.call(dates[index]);
          },
          events: events,
        );
      })),
    );
  }
}

/// Its height is circulated by [MeasureSize] and notified by [CellHeightController]
class _DayCell extends HookConsumerWidget {
  const _DayCell({
    required this.cellIndex,
    required this.date,
    required this.visiblePageDate,
    required this.onCellTapped,
    required this.events,
  });

  final int cellIndex;
  final DateTime date;
  final DateTime visiblePageDate;
  final void Function()? onCellTapped;
  final List<CalendarEvent> events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCurrentMonth = visiblePageDate.month == date.month;
    final notifier = ref.read(calenderViewModelProvider.notifier);

    final double opacityValue = isCurrentMonth ? 1.0 : 0.4;

    final today = DateTime.now();
    final isToday = date.year == today.year &&
        date.month == today.month &&
        date.day == today.day;
    return Expanded(
      child: GestureDetector(
        onTap: () => notifier.tappedCell(date, cellIndex),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Theme.of(context).dividerColor, width: 1),
              right:
                  BorderSide(color: Theme.of(context).dividerColor, width: 1),
            ),
          ),
          child: MeasureSize(
            onChange: (size) {
              final notifier = ref.read(cellHeightProvider.notifier);
              notifier.state = size!.height;
            },
            child: Opacity(
              opacity: opacityValue,
              child: Column(
                children: [
                  DayLabel(
                    date: date,
                    isToday: isToday,
                  ),
                  Expanded(
                    child: EventLabels(
                      date: date,
                      events: events,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DayLabel extends ConsumerWidget {
  const DayLabel({
    Key? key,
    required this.date,
    required this.isToday,
  }) : super(key: key);

  final DateTime date;
  final bool isToday;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSelected =
        ref.watch(calenderViewModelProvider).cellDateTime == date;
    final isSunday = date.weekday == DateTime.sunday;
    final isSaturday = date.weekday == DateTime.saturday;

    // 選択された日、今日、土曜日、日曜日に基づいて色を決定
    final containerColor = isSelected
        ? (isToday ? BrandColor.deleteRed : BrandColor.black)
        : Colors.transparent;

    final textColor = isSelected
        ? Colors.white
        : (isToday
            ? BrandColor.deleteRed
            : (isSunday || isSaturday)
                ? BrandColor.darkGrey
                : BrandColor.black);

    final caption = Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(fontWeight: FontWeight.w500);
    final textStyle = caption.merge(BrandText.bodyS).copyWith(color: textColor);

    return Container(
      margin: EdgeInsets.symmetric(vertical: dayLabelVerticalMargin.toDouble()),
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          date.day.toString(),
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }
}
