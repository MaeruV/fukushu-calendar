import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_of_the_week.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/days_row.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/task_labels.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CalenderScreen extends ConsumerWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double parentHeight = MediaQuery.of(context).size.height;

    void showModal(DateTime date, BuildContext context) {
      final formatDate =
          '${DateFormat.MMMd('ja').format(date)}(${DateFormat.E('ja').format(date)})';

      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
                height: parentHeight * 0.85,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: BrandColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 4,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 109, 107, 107),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.0),
                            topRight: Radius.circular(2.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDate,
                            style: BrandText.titleLM,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            child: Text(
                              '戻る',
                              style: BrandText.bodyM
                                  .copyWith(color: BrandColor.deleteRed),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TaskLabels(
                        task: Task(),
                      ),
                    ],
                  ),
                ));
          });
    }

    return Scaffold(
      backgroundColor: BrandColor.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: parentHeight * 0.10,
              child: const SubjectWidget(),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: BrandColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: CalenderPageView(
                    events: [
                      // CalendarEvent(
                      //     eventName: "Event 2",
                      //     eventDate: DateTime.now(),
                      //     eventTextStyle: BrandText.bodyS,
                      //     eventBackgroundColor: BrandColor.blue,
                      //     eventID: ''),
                      // CalendarEvent(
                      //     eventName: "Event 3",
                      //     eventDate: DateTime.now(),
                      //     eventTextStyle: BrandText.bodyS,
                      //     eventBackgroundColor: BrandColor.deleteRed,
                      //     eventID: ''),
                    ],
                    onCellTapped: (date) {
                      showModal(date, context);
                    }),
              ),
            ),
            Container(
              color: BrandColor.grey,
              height: 1,
            )
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
    const duration = Duration(milliseconds: 500); //アニメーションする時間
    const curve = Curves.easeIn; //アニメーションの動き

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
                  style: BrandText.titleL,
                ),
                const SizedBox(width: 15),
                Text(
                  "$visibleMonth月",
                  style: BrandText.titleL,
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => state.pageController
                    .previousPage(duration: duration, curve: curve),
                child: const SizedBox(
                  width: 40,
                  child: Text(
                    "<",
                    style: BrandText.titleL,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: () => state.pageController
                    .nextPage(duration: duration, curve: curve),
                child: const SizedBox(
                  width: 40,
                  child: Text(
                    ">",
                    style: BrandText.titleL,
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
  final void Function(DateTime)? onCellTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(calenderViewModelProvider);
    final notifier = ref.read(calenderViewModelProvider.notifier);

    return PageView.builder(
      controller: state.pageController,
      itemBuilder: (context, index) {
        return CalenderPage(
          visiblePageDate: index.visibleDateTime,
          events: events,
          onCellTapped: onCellTapped,
        );
      },
      onPageChanged: (index) => notifier.changeCurrentIndex(index),
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
  final void Function(DateTime)? onCellTapped;

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
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          const DaysOfTheWeek(),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                6,
                (index) {
                  return DaysRow(
                    visiblePageDate: visiblePageDate,
                    dates: days.getRange(index * 7, (index + 1) * 7).toList(),
                    dateTextStyle: BrandText.bodyM,
                    onCellTapped: onCellTapped,
                    todayMarkColor: BrandColor.blue,
                    todayTextColor: BrandColor.white,
                    events: events,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
