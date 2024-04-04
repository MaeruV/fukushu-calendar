import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/calendar_list_tile.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_of_the_week.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/event_labels.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/table_calendar_page_.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalendarCustomScreen extends HookConsumerWidget {
  const CalendarCustomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarTask = ref.watch(tasksCalendarProvider);
    final collapsed = ref.read(collapsedProvider.notifier);

    final topContainerHeightFactor = useState(0.8);
    final height = MediaQuery.of(context).size.height;
    final size = ref.watch(screenViewModelProvider);
    const maxHeightFactor = 0.8; // 最大高さ割合
    final minHeight = 300 + size.safeAreaTop;
    final minHeightFactor = minHeight / height;

    void _onVerticalDragUpdate(DragUpdateDetails details) {
      final newHeightFactor =
          (topContainerHeightFactor.value + details.primaryDelta! / height)
              .clamp(minHeightFactor, maxHeightFactor);
      topContainerHeightFactor.value = newHeightFactor;
    }

    void _onVerticalDragEnd(DragEndDetails details) {
      if (topContainerHeightFactor.value < 0.6) {
        topContainerHeightFactor.value = minHeightFactor;
        collapsed.state = true;
      } else {
        topContainerHeightFactor.value = maxHeightFactor;
        collapsed.state = false;
      }
    }

    void onCellTapped(
        DateTime date, int index, Map<DateTime, List<CalendarEvent>> value) {
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
          body: Column(
            children: <Widget>[
              GestureDetector(
                onVerticalDragUpdate: _onVerticalDragUpdate,
                onVerticalDragEnd: _onVerticalDragEnd,
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
    final size = ref.watch(screenViewModelProvider);
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.canvasColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          print('Top container size: ${constraints.maxHeight}');
          ref.read(tableHeightProvider.notifier).state = constraints.maxHeight;
        });
        return Column(
          children: <Widget>[
            SizedBox(height: size.safeAreaTop),
            SubjectWidget(mapEvents: value),
            const DaysOfTheWeek(),
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
        );
      }),
    );
  }
}

final tableHeightProvider = StateProvider<double>((ref) => 0.0);

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
      child: LayoutBuilder(builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          print('Talbe Size: ${constraints.maxHeight}');
          ref.read(tableHeightProvider.notifier).state = constraints.maxHeight;
        });
        return PageView.builder(
          controller: state.pageController,
          itemBuilder: (context, index) {
            return TableCalendarPage(
              tableHeight: constraints.maxHeight,
              visiblePageDate: index.visibleDateTime,
              events: events,
              onCellTapped: onCellTapped,
            );
          },
          onPageChanged: (index) => notifier.changeCurrentIndex(index),
        );
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
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.primaryColorLight)),
              Text('${events.length}イベント',
                  style: theme.textTheme.titleSmall!
                      .copyWith(color: theme.primaryColorLight))
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
    final theme = Theme.of(context);

    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    visibleYear,
                    style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "$visibleMonth月",
                    style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black),
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
                    final notifier =
                        ref.read(calenderViewModelProvider.notifier);
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
                        style:
                            BrandText.titleS.copyWith(color: BrandColor.blue),
                        textAlign: TextAlign.center,
                      )),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => state.pageController
                      .previousPage(duration: duration, curve: curve),
                  child: SizedBox(
                    width: 30,
                    child: Text(
                      "<",
                      style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () => state.pageController
                      .nextPage(duration: duration, curve: curve),
                  child: SizedBox(
                    width: 30,
                    child: Text(
                      ">",
                      style: theme.textTheme.titleLarge!.copyWith(
                          color: theme.brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
