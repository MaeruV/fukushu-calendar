import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar_test/pages/calendar_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar_test/widgets/calendar_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthPageViewWidget extends ConsumerWidget {
  final DateTime visiblePageDate;
  final List<List<DateTime>> weeks;
  final List<CalendarEvent> events;

  const MonthPageViewWidget({
    super.key,
    required this.visiblePageDate,
    required this.weeks,
    required this.events,
  });

  void onDateTap({
    required int currentPage,
    required int index,
    required int rowIndex,
    required DateTime date,
    required WidgetRef ref,
    required double minHeightFactor,
  }) {
    ref.read(currentRowIndexProvider.notifier).state = rowIndex;
    ref.read(tappedCellProvider.notifier).state = {index: date};
    ref.read(collapsedProvider.notifier).state = true;
    ref.read(topContainerHeightFactorProvider.notifier).state = minHeightFactor;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);
    final height = MediaQuery.of(context).size.height;
    final minHeight = (height * 0.7) / weeks.length;
    final minHeightFactor = minHeight / height;

    return Stack(
      children: weeks.asMap().entries.map((entry) {
        int rowIndex = entry.key;
        final week = entry.value;
        final height = MediaQuery.of(context).size.height;
        final stackHeight = (height * 0.7) / weeks.length;
        final double topHeight = rowIndex * stackHeight;

        return Positioned(
          top: topHeight,
          left: 0,
          right: 0,
          child: Container(
            height: stackHeight,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey),
              ),
            ),
            child: Row(
              children: week.asMap().entries.map((entry) {
                int index = entry.key;
                final date = entry.value;
                return DayContainerWidget(
                  date: date,
                  index: index,
                  visiblePageDate: visiblePageDate,
                  onDateTap: () => onDateTap(
                    currentPage: currentPage,
                    index: index,
                    rowIndex: rowIndex,
                    date: date,
                    ref: ref,
                    minHeightFactor: minHeightFactor,
                  ),
                  events: events,
                );
              }).toList(),
            ),
          ),
        );
      }).toList(),
    );
  }
}
