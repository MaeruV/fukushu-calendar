import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/calendar_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/calendar_list_tile.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/event_labels.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/table_calendar_page_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarCustomScreen extends HookConsumerWidget {
  const CalendarCustomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarTask = ref.watch(tasksCalendarProvider);
    final collapsed = ref.read(collapsedProvider.notifier);

    final topContainerHeightFactor = useState(0.7);
    final height = MediaQuery.of(context).size.height;
    const maxHeightFactor = 0.7;
    const minHeight = 400;
    final minHeightFactor = minHeight / height;

    void onVerticalDragUpdate(DragUpdateDetails details) {
      final newHeightFactor =
          (topContainerHeightFactor.value + details.primaryDelta! / height)
              .clamp(minHeightFactor, maxHeightFactor);
      topContainerHeightFactor.value = newHeightFactor;
    }

    void onVerticalDragEnd(DragEndDetails details) {
      if (topContainerHeightFactor.value < 0.6) {
        topContainerHeightFactor.value = minHeightFactor;
        collapsed.state = true;
      } else {
        topContainerHeightFactor.value = maxHeightFactor;
        collapsed.state = false;
      }
    }

    int compareDateToCurrentMonth(DateTime date, DateTime visibleMonth) {
      if (date.year < visibleMonth.year ||
          (date.year == visibleMonth.year && date.month < visibleMonth.month)) {
        return -1;
      } else if (date.year > visibleMonth.year ||
          (date.year == visibleMonth.year && date.month > visibleMonth.month)) {
        return 1;
      }
      return 0;
    }

    DateTime getVisibleMonth(DateTime baseDate) {
      final pageIndex = ref.watch(currentPageProvider);
      DateTime visibleMonth =
          DateTime(baseDate.year, baseDate.month + pageIndex - 1200, 1);
      return visibleMonth;
    }

    void onCellTapped(
        DateTime date, int index, Map<DateTime, List<CalendarEvent>> value) {
      final notifier = ref.read(calenderViewModelProvider.notifier);
      notifier.tappedCell(date);
      DateTime now = DateTime.now().toZeroHour();
      final visibleMonth = getVisibleMonth(now);
      final monthComparison = compareDateToCurrentMonth(date, visibleMonth);
      if (monthComparison != 0) {
        int currentPage = ref.read(currentPageProvider);
        int newPage = currentPage + monthComparison;
        ref.read(currentPageProvider.notifier).state = newPage;
      }
    }

    switch (calendarTask) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CalendarAppBar(
            value: value,
            onTap: () {
              final now = DateTime.now().toZeroHour();
              final notifier = ref.read(calenderViewModelProvider.notifier);
              notifier.tappedCell(now);
              final events = value[now];
              if (events != null) {
                notifier.getCalendarEvent(events);
              } else {
                notifier.getCalendarEvent([]);
              }
              ref.read(currentPageProvider.notifier).state = 1200;
            },
          ),
          body: Column(
            children: <Widget>[
              GestureDetector(
                onVerticalDragUpdate: onVerticalDragUpdate,
                onVerticalDragEnd: onVerticalDragEnd,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: height * topContainerHeightFactor.value,
                  child: TopContainerWidget(
                    value: value,
                    onCellTapped: (time, index) =>
                        onCellTapped(time, index, value),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    child: CalendarList(mapEvents: value),
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

class TopContainerWidget extends ConsumerWidget {
  const TopContainerWidget(
      {super.key, required this.value, required this.onCellTapped});

  final Map<DateTime, List<CalendarEvent>> value;
  final Function(DateTime, int)? onCellTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.canvasColor,
        // color: Colors.amber,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            CalenderPageView(
              events: value.values.expand((events) => events).toList(),
              onCellTapped: onCellTapped,
            ),
            Container(
              height: 25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.canvasColor,
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 5,
                      width: 60,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final tableHeightProvider = StateProvider<double>((ref) => 0.0);

class CalenderPageView extends HookConsumerWidget {
  const CalenderPageView({
    super.key,
    required this.events,
    required this.onCellTapped,
  });

  final List<CalendarEvent> events;
  final void Function(DateTime, int)? onCellTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(initialPage: 1200);

    ref.listen(currentPageProvider, (oldIndex, newIndex) {
      if (pageController.page?.round() != newIndex) {
        pageController.animateToPage(newIndex,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    });

    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(tableHeightProvider.notifier).state = constraints.maxHeight;
        });
        return PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) {
              print('index: $index');
              return TableCalendarPage(
                tableHeight: constraints.maxHeight,
                visiblePageDate: index.visibleDateTime,
                events: events,
                onCellTapped: onCellTapped,
              );
            },
            onPageChanged: (index) {
              if (ref.read(currentPageProvider) != index) {
                ref.read(currentPageProvider.notifier).state = index;
              }
            });
      }),
    );
  }
}

class CalendarList extends ConsumerWidget {
  const CalendarList({super.key, required this.mapEvents});

  final Map<DateTime, List<CalendarEvent>> mapEvents;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calenderViewModelProvider);
    final events = mapEvents[state.cellDateTime] ?? [];
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  state.cellDateTime != null
                      ? state.cellDateTime!
                          .toSimpleFormat(appLocalizations.date)
                      : "",
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.primaryColorLight)),
              RichText(
                text: TextSpan(
                    text: events.length.toString(),
                    style: theme.textTheme.titleSmall!
                        .copyWith(color: theme.primaryColorLight),
                    children: [
                      TextSpan(
                        text: " ${appLocalizations.task}",
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: theme.primaryColorLight),
                      )
                    ]),
              ),
            ],
          ),
          const SizedBox(height: 5),
          CalendarListTile(events: events),
        ],
      ),
    );
  }
}
