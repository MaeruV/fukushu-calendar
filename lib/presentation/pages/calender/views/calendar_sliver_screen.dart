import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/calendar_list_tile.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_of_the_week.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/days_row.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/event_labels.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalendarSliverScreen extends ConsumerWidget {
  const CalendarSliverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();
    final notifier = ref.read(collapsedProvider.notifier);
    final size = ref.watch(screenViewModelProvider);
    final calendarTask = ref.watch(tasksCalendarProvider);

    void onCellTapped(
        DateTime date, int index, Map<DateTime, List<CalendarEvent>> value) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

      final notifier = ref.read(calenderViewModelProvider.notifier);
      notifier.tappedCell(date);
      final events = value[date];
      if (events != null) {
        notifier.getCalendarEvent(events);
      } else {
        notifier.getCalendarEvent([]);
      }
    }

    switch (calendarTask) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        return Scaffold(
          backgroundColor: BrandColor.background,
          body: NotificationListener(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                notifier.state =
                    scrollController.offset >= size.mediaHeight * 0.2;
              }
              return false;
            },
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  expandedHeight: size.mediaHeight * 0.7,
                  pinned: true,
                  floating: false,
                  snap: false,
                  toolbarHeight: size.mediaHeight * 0.4,
                  flexibleSpace: FlexibleSpaceBar(
                    expandedTitleScale: 1.0,
                    centerTitle: true,
                    titlePadding: EdgeInsets.zero,
                    title: LayoutBuilder(builder: (context, constraints) {
                      return LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: BrandColor.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: size.safeAreaTop),
                                SubjectWidget(mapEvents: value),
                                const DaysOfTheWeek(),
                                CalenderPageView(
                                  events: value.values
                                      .expand((events) => events)
                                      .toList(),
                                  onCellTapped: (date, index) =>
                                      onCellTapped.call(date, index, value),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context).dividerColor,
                                      width: 1),
                                ))),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [CalendarSliverList(mapEvents: value)],
                  ),
                ),
              ],
            ),
          ),
        );
      default:
        return const CircularProgressIndicator();
    }
  }
}

class CalendarSliverList extends ConsumerWidget {
  const CalendarSliverList({super.key, required this.mapEvents});

  final Map<DateTime, List<CalendarEvent>> mapEvents;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calenderViewModelProvider);
    final events = mapEvents[state.cellDateTime] ?? [];

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
                      ? state.cellDateTime!.toJapaneseFormat()
                      : "",
                  style: BrandText.titleSM),
              Text('${events.length}イベント',
                  style: BrandText.titleS.copyWith(color: BrandColor.grey))
            ],
          ),
          const SizedBox(height: 5),
          CalendarListTile(events: events),
        ],
      ),
    );
  }
}

class SubjectWidget extends ConsumerWidget {
  const SubjectWidget({super.key, required this.mapEvents});

  final Map<DateTime, List<CalendarEvent>> mapEvents;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calenderViewModelProvider);
    final visibleMonth = state.currentIndex.visibleDateTime.month.toString();
    final visibleYear = state.currentIndex.visibleDateTime.year.toString();
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeIn;

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Text(
                  visibleYear,
                  style: BrandText.titleLM.copyWith(color: BrandColor.black),
                ),
                const SizedBox(width: 15),
                Text(
                  "$visibleMonth月",
                  style: BrandText.titleLM.copyWith(color: BrandColor.black),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  final now = DateTime.now().toZeroHour();
                  final notifier = ref.read(calenderViewModelProvider.notifier);
                  notifier.tappedCell(now);
                  final events = mapEvents[now];
                  if (events != null) {
                    notifier.getCalendarEvent(events);
                  } else {
                    notifier.getCalendarEvent([]);
                  }
                  state.pageController
                      .animateToPage(1200, duration: duration, curve: curve);
                },
                child: SizedBox(
                    width: 40,
                    child: Text(
                      '今日',
                      style: BrandText.titleS.copyWith(color: BrandColor.blue),
                      textAlign: TextAlign.center,
                    )),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => state.pageController
                    .previousPage(duration: duration, curve: curve),
                child: SizedBox(
                  width: 30,
                  child: Text(
                    "<",
                    style: BrandText.titleLM.copyWith(color: BrandColor.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => state.pageController
                    .nextPage(duration: duration, curve: curve),
                child: SizedBox(
                  width: 30,
                  child: Text(
                    ">",
                    style: BrandText.titleLM.copyWith(color: BrandColor.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CalenderPageView extends ConsumerWidget {
  const CalenderPageView({
    super.key,
    required this.events,
    required this.onCellTapped,
  });

  final List<CalendarEvent> events;
  final void Function(DateTime, int)? onCellTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calenderViewModelProvider);
    final notifier = ref.read(calenderViewModelProvider.notifier);

    return Expanded(
      child: PageView.builder(
        controller: state.pageController,
        itemBuilder: (context, index) {
          return CalenderPage(
            visiblePageDate: index.visibleDateTime,
            events: events,
            onCellTapped: onCellTapped,
          );
        },
        onPageChanged: (index) => notifier.changeCurrentIndex(index),
      ),
    );
  }
}

class CalenderPage extends ConsumerWidget {
  const CalenderPage({
    super.key,
    required this.visiblePageDate,
    required this.events,
    required this.onCellTapped,
  });

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final days = _getCurrentDates(visiblePageDate);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        6,
        (index) {
          return DaysRow(
            visiblePageDate: visiblePageDate,
            dates: days.getRange(index * 7, (index + 1) * 7).toList(),
            onCellTapped: onCellTapped,
            events: events,
          );
        },
      ),
    );
  }
}
