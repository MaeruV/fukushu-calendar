import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/pages/calendar_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/widgets/calendar_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeeksPageViewWidget extends ConsumerStatefulWidget {
  final DateTime visiblePageDate;
  final List<List<DateTime>> weeks;
  final PageController pageController;
  final ScrollDirection direction;
  final double minHeightFactor;
  final int currentRow;
  final List<CalendarEvent> events;
  final double height;

  const WeeksPageViewWidget({
    super.key,
    required this.visiblePageDate,
    required this.weeks,
    required this.pageController,
    required this.direction,
    required this.minHeightFactor,
    required this.currentRow,
    required this.events,
    required this.height,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeeksPageViewWidgetState();
}

class _WeeksPageViewWidgetState extends ConsumerState<WeeksPageViewWidget> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(topContainerHeightFactorProvider.notifier).state =
          widget.minHeightFactor;
    });
    controller = PageController(
      initialPage: widget.direction == ScrollDirection.left
          ? widget.weeks.length - 1
          : widget.direction == ScrollDirection.right
              ? 0
              : widget.currentRow,
    );
    controller.addListener(pageListener);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void pageListener() {
    final currentPage = ref.read(currentPageProvider);
    if (controller.offset < 0) {
      widget.pageController.jumpToPage(currentPage - 1);
      ref.read(scrollDirectionProvider.notifier).state = ScrollDirection.left;
    } else if (controller.offset > controller.position.maxScrollExtent) {
      widget.pageController.jumpToPage(currentPage + 1);
      ref.read(scrollDirectionProvider.notifier).state = ScrollDirection.right;
    }
  }

  void onDateTap({
    required int index,
    required DateTime date,
    required WidgetRef ref,
  }) {
    ref.read(tappedCellProvider.notifier).state = {index: date};
  }

  @override
  Widget build(BuildContext context) {
    final stackHeight = widget.height / 5;

    ref.listen(sameMonthIndexProvider, (pre, next) {
      if (next != null) {
        controller.animateToPage(
          next,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeIn,
        );
      }
      ref.read(sameMonthIndexProvider.notifier).state = null;
    });

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: stackHeight,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child: PageView.builder(
              controller: controller,
              itemCount: widget.weeks.length,
              itemBuilder: (context, rowIndex) {
                List<DateTime> week = widget.weeks[rowIndex];
                return Row(
                  children: week.asMap().entries.map((entry) {
                    int index = entry.key;
                    final date = entry.value;
                    return DayContainerWidget(
                      date: date,
                      index: index,
                      visiblePageDate: widget.visiblePageDate,
                      onDateTap: () => onDateTap(
                        index: index,
                        date: date,
                        ref: ref,
                      ),
                      events: widget.events,
                    );
                  }).toList(),
                );
              },
              onPageChanged: (index) {},
            ),
          ),
        ),
      ],
    );
  }
}
