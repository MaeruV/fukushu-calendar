import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/pages/calendar_page.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/widgets/calendar_list.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calendar/widgets/calendar_pageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarBody extends ConsumerWidget {
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    //Provider
    final topContainerHeightFactor =
        ref.watch(topContainerHeightFactorProvider);

    final calendarEvents = ref.watch(setCalendarEventsProvider);

    switch (calendarEvents) {
      case AsyncError(:final error):
        return Text('Error: $error');
      case AsyncLoading():
        return const CircularProgressIndicator();
      case AsyncData(:final value):
        return Expanded(
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: height * topContainerHeightFactor,
                child: CalendarPageView(events: value),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    child: CalendarList(events: value),
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return const CircularProgressIndicator();
    }
  }
}
