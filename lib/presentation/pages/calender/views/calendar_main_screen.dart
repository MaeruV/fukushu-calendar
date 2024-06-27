// import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
// import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
// import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/views/calendar_custom_screen.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/calendar_app_bar.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_of_the_week.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/event_labels.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class CalendarMainScrenn extends HookConsumerWidget {
//   const CalendarMainScrenn({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final calendarTask = ref.watch(tasksCalendarProvider);
//     final notifier = ref.read(calenderViewModelProvider.notifier);
//     final collapsed = ref.read(collapsedProvider.notifier);

//     final height = MediaQuery.of(context).size.height;
//     final topContainerHeightFactor = useState(0.7);
//     const maxHeightFactor = 0.7;
//     const minHeight = 400;
//     final minHeightFactor = minHeight / height;

//     void onVerticalDragUpdate(DragUpdateDetails details) {
//       final newHeightFactor =
//           (topContainerHeightFactor.value + details.primaryDelta! / height)
//               .clamp(minHeightFactor, maxHeightFactor);
//       topContainerHeightFactor.value = newHeightFactor;
//     }

//     void onVerticalDragEnd(DragEndDetails details) {
//       if (topContainerHeightFactor.value < 0.6) {
//         topContainerHeightFactor.value = minHeightFactor;
//         collapsed.state = true;
//       } else {
//         topContainerHeightFactor.value = maxHeightFactor;
//         collapsed.state = false;
//       }
//     }

//     int compareDateToCurrentMonth(DateTime date, DateTime visibleMonth) {
//       if (date.year < visibleMonth.year ||
//           (date.year == visibleMonth.year && date.month < visibleMonth.month)) {
//         return -1;
//       } else if (date.year > visibleMonth.year ||
//           (date.year == visibleMonth.year && date.month > visibleMonth.month)) {
//         return 1;
//       }
//       return 0;
//     }

//     DateTime getVisibleMonth(DateTime baseDate) {
//       final pageIndex = ref.watch(currentPageProvider);
//       DateTime visibleMonth =
//           DateTime(baseDate.year, baseDate.month + pageIndex - 1200, 1);
//       return visibleMonth;
//     }

//     void onCellTapped(
//         DateTime date, int index, Map<DateTime, List<CalendarEvent>> value) {
//       final notifier = ref.read(calenderViewModelProvider.notifier);
//       notifier.tappedCell(date);
//       DateTime now = DateTime.now().toZeroHour();
//       final visibleMonth = getVisibleMonth(now);
//       final monthComparison = compareDateToCurrentMonth(date, visibleMonth);
//       if (monthComparison != 0) {
//         int currentPage = ref.read(currentPageProvider);
//         int newPage = currentPage + monthComparison;
//         ref.read(currentPageProvider.notifier).state = newPage;
//       }
//     }

//     switch (calendarTask) {
//       case AsyncError(:final error):
//         return Text('Error: $error');

//       case AsyncLoading():
//         return const CircularProgressIndicator();
//       case AsyncData(:final value):
//         return Scaffold(
//           resizeToAvoidBottomInset: false,
//           appBar: CalendarAppBar(
//             value: value,
//             onTap: () {
//               final now = DateTime.now().toZeroHour();
//               notifier.tappedCell(now);
//               final events = value[now];
//               if (events != null) {
//                 notifier.getCalendarEvent(events);
//               } else {
//                 notifier.getCalendarEvent([]);
//               }
//               ref.read(currentPageProvider.notifier).state = 1200;
//             },
//           ),
//           body: Column(
//             children: <Widget>[
//               const DaysOfTheWeek(),
//               GestureDetector(
//                 onVerticalDragUpdate: onVerticalDragUpdate,
//                 onVerticalDragEnd: onVerticalDragEnd,
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 100),
//                   height: height * topContainerHeightFactor.value,
//                   child: TopContainerWidget(
//                     value: value,
//                     onCellTapped: (time, index) =>
//                         onCellTapped(time, index, value),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 100),
//                     child: CalendarList(mapEvents: value),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       default:
//         return const CircularProgressIndicator();
//     }
//   }
// }
