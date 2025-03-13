import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/pages/calendar_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/widgets/calendar_table.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarPageView extends ConsumerStatefulWidget {
  final List<CalendarEvent> events;
  final double height;
  const CalendarPageView({
    super.key,
    required this.events,
    required this.height,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CalendarPageViewState();
}

class _CalendarPageViewState extends ConsumerState<CalendarPageView> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 1200);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final collapsed = ref.watch(collapsedProvider);

    ref.listen(todayFlagProvider, (pre, next) {
      controller.animateToPage(
        1200,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    });

    return PageView.builder(
      physics: collapsed ? const NeverScrollableScrollPhysics() : null,
      controller: controller,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(width: 0.5, color: BrandColor.grey),
            ),
          ),
          child: CalendarTable(
            visiblePageDate: index.visibleDateTime,
            pageController: controller,
            events: widget.events,
            height: widget.height,
          ),
        );
      },
      onPageChanged: (index) {
        if (ref.read(currentPageProvider) != index) {
          ref.read(currentPageProvider.notifier).state = index;
        }
      },
    );
  }
}
