import 'package:ebbinghaus_forgetting_curve/application/state/theme/custom_theme.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar_test/pages/calendar_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar_test/widgets/days_row/event_labels.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar_test/widgets/days_row/measure_size.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class DayContainerWidget extends HookConsumerWidget {
  final DateTime date;
  final int index;
  final DateTime visiblePageDate;
  final Function()? onDateTap;
  final List<CalendarEvent> events;

  const DayContainerWidget({
    super.key,
    required this.date,
    required this.index,
    required this.visiblePageDate,
    required this.onDateTap,
    required this.events,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tappedCell = ref.watch(tappedCellProvider);
    final textHeight = ref.watch(customThemeProvider).textHeight;
    final theme = Theme.of(context);

    final bool isCurrentMonth = date.month == visiblePageDate.month;
    final ValueNotifier<double?> cellHeight = useState(null);
    final isToday = date.isSameDay(DateTime.now());
    final textColor = isToday ? Colors.blue : theme.primaryColorLight;

    return Expanded(
      child: GestureDetector(
        onTap: onDateTap,
        child: Container(
          decoration: BoxDecoration(
            color: BrandColor.transparentColor,
            border: Border(
              right: tappedCell[index] == date
                  ? const BorderSide(width: 3.0, color: BrandColor.blue)
                  : const BorderSide(width: 0.5, color: BrandColor.grey),
              top: tappedCell[index] == date
                  ? const BorderSide(width: 3.0, color: BrandColor.blue)
                  : BorderSide.none,
              bottom: tappedCell[index] == date
                  ? const BorderSide(width: 3.0, color: BrandColor.blue)
                  : BorderSide.none,
              left: tappedCell[index] == date
                  ? const BorderSide(width: 3.0, color: BrandColor.blue)
                  : BorderSide.none,
            ),
          ),
          child: Opacity(
            opacity: isCurrentMonth ? 1.0 : .5,
            child: Column(
              children: [
                Container(
                  height: textHeight.toDouble(),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(date.day.toString(),
                      style: theme.textTheme.labelSmall!
                          .copyWith(color: textColor)),
                ),
                Expanded(
                  child: MeasureSize(
                    onChange: (Size? size) => cellHeight.value = size?.height,
                    child: EventLabels(
                      date: date,
                      events: events,
                      cellHeight: cellHeight.value,
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
