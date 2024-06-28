import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/models/calendar_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/pages/calendar_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/widgets/calendar_month_pageview.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/widgets/calendar_weeks_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarTable extends ConsumerStatefulWidget {
  final DateTime visiblePageDate;
  final PageController pageController;
  final List<CalendarEvent> events;

  const CalendarTable({
    super.key,
    required this.visiblePageDate,
    required this.pageController,
    required this.events,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarTableState();
}

class _CalendarTableState extends ConsumerState<CalendarTable> {
  late List<List<DateTime>> weeks;

  @override
  void initState() {
    super.initState();
    weeks = CalendarViewModel().getMonths(widget.visiblePageDate);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final collapsed = ref.watch(collapsedProvider);
    final direction = ref.watch(scrollDirectionProvider);
    final currentRow = ref.watch(currentRowIndexProvider);
    final height = MediaQuery.of(context).size.height;
    final minHeight = (height * 0.7) / 5;
    final minHeightFactor = minHeight / height;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: collapsed
          ? WeeksPageViewWidget(
              key: const ValueKey('week'),
              visiblePageDate: widget.visiblePageDate,
              weeks: weeks,
              pageController: widget.pageController,
              direction: direction,
              minHeightFactor: minHeightFactor,
              currentRow: currentRow,
              events: widget.events,
            )
          : MonthPageViewWidget(
              key: const ValueKey('month'),
              visiblePageDate: widget.visiblePageDate,
              weeks: weeks,
              events: widget.events,
            ),
    );
  }
}
