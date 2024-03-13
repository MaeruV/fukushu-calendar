import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/calendar_app_bar.dart';
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
    final calendarTask = ref.watch(tasksCalendarProvider);
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BrandColor.background,
      appBar: const CalendarAppBar(),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            notifier.state = scrollController.offset >= mediaHeight * 0.2;
          }
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: mediaHeight * 0.7,
              pinned: true,
              floating: false,
              snap: false,
              toolbarHeight: mediaHeight * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.0,
                centerTitle: true,
                titlePadding: EdgeInsets.zero,
                title: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return switch (calendarTask) {
                      AsyncError(:final error) => Text('Error: $error'),
                      AsyncData(:final value) => Container(
                          decoration: const BoxDecoration(
                            color: BrandColor.white,
                          ),
                          child: CalenderPageView(
                            events: value,
                            onCellTapped: (date, index) {},
                          ),
                        ),
                      _ => const CircularProgressIndicator(),
                    };
                  },
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: const Center(
                    child: Text("Testです"),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectWidget extends ConsumerWidget {
  const SubjectWidget({super.key});

  get curve => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calenderViewModelProvider);
    final visibleMonth = state.currentIndex.visibleDateTime.month.toString();
    final visibleYear = state.currentIndex.visibleDateTime.year.toString();
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeIn;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Text(
                  visibleYear,
                  style: BrandText.titleLM,
                ),
                const SizedBox(width: 15),
                Text(
                  "$visibleMonth月",
                  style: BrandText.titleLM,
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => state.pageController
                    .animateToPage(1200, duration: duration, curve: curve),
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
                child: const SizedBox(
                  width: 40,
                  child: Text(
                    "<",
                    style: BrandText.titleLM,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () => state.pageController
                    .nextPage(duration: duration, curve: curve),
                child: const SizedBox(
                  width: 40,
                  child: Text(
                    ">",
                    style: BrandText.titleLM,
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

    return Column(
      children: [
        const DaysOfTheWeek(),
        Expanded(
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
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Theme.of(context).dividerColor, width: 1),
            ),
          ),
        )
      ],
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
            onCellTapped: (DateTime date) {
              onCellTapped!.call(date, index);
            },
            events: events,
          );
        },
      ),
    );
  }
}
