// import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
// import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
// import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/common/custom_hook_draggable.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/component/draggable_sheet.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_of_the_week.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/days_row.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final GlobalKey columnKey = GlobalKey();

// class CalendarScreen extends HookConsumerWidget {
//   const CalendarScreen({super.key});

//   void adjustScrollPosition(BuildContext context, int tappedIndex,
//       double cellHeight, DraggableScrollableController controller) {
//     final RenderBox? columnBox =
//         columnKey.currentContext?.findRenderObject() as RenderBox?;
//     if (columnBox != null) {
//       final double columnHeight = columnBox.size.height;
//       final double bottomHeight =
//           columnHeight - (cellHeight * (tappedIndex + 1));
//       final double targetHeightRatio = bottomHeight / columnHeight;

//       controller.animateTo(
//         targetHeightRatio,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final calendarTask = ref.watch(tasksCalendarProvider);
//     final double parentHeight = MediaQuery.of(context).size.height;

//     final controller = useDraggableController();

//     return Scaffold(
//         backgroundColor: BrandColor.background,
//         body: SafeArea(
//             child: Column(children: <Widget>[
//           SizedBox(
//             height: parentHeight * 0.06,
//             child: const SubjectWidget(),
//           ),
//           Expanded(child: LayoutBuilder(builder: (context, constraints) {
//             final double bottomPadding = constraints.maxHeight * 0.1;

//             return switch (calendarTask) {
//               AsyncError(:final error) => Text('Error: $error'),
//               AsyncData(:final value) => Stack(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(bottom: bottomPadding),
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: BrandColor.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10.0),
//                             topRight: Radius.circular(10.0),
//                           ),
//                         ),
//                         child: CalenderPageView(
//                           events: value,
//                           onCellTapped: (date, index) {
//                             adjustScrollPosition(
//                               context,
//                               index,
//                               ref.watch(cellHeightProvider) ?? 0,
//                               controller,
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     DraggableSheet(
//                       controller: controller,
//                       child: Container(
//                         color: BrandColor.blue,
//                         height: 100,
//                       ),
//                     ),
//                   ],
//                 ),
//               _ => const CircularProgressIndicator(),
//             };
//           }))
//         ])));
//   }
// }

// class SubjectWidget extends ConsumerWidget {
//   const SubjectWidget({super.key});

//   get curve => null;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(calenderViewModelProvider);
//     final visibleMonth = state.currentIndex.visibleDateTime.month.toString();
//     final visibleYear = state.currentIndex.visibleDateTime.year.toString();
//     const duration = Duration(milliseconds: 300);
//     const curve = Curves.easeIn;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Text(
//                   visibleYear,
//                   style: BrandText.titleLM,
//                 ),
//                 const SizedBox(width: 15),
//                 Text(
//                   "$visibleMonth月",
//                   style: BrandText.titleLM,
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () => state.pageController
//                     .animateToPage(1200, duration: duration, curve: curve),
//                 child: SizedBox(
//                     width: 40,
//                     child: Text(
//                       '今日',
//                       style: BrandText.titleS.copyWith(color: BrandColor.blue),
//                       textAlign: TextAlign.center,
//                     )),
//               ),
//               const SizedBox(width: 10),
//               GestureDetector(
//                 onTap: () => state.pageController
//                     .previousPage(duration: duration, curve: curve),
//                 child: const SizedBox(
//                   width: 40,
//                   child: Text(
//                     "<",
//                     style: BrandText.titleLM,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 20),
//               GestureDetector(
//                 onTap: () => state.pageController
//                     .nextPage(duration: duration, curve: curve),
//                 child: const SizedBox(
//                   width: 40,
//                   child: Text(
//                     ">",
//                     style: BrandText.titleLM,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class CalenderPageView extends ConsumerWidget {
//   const CalenderPageView({
//     super.key,
//     required this.events,
//     required this.onCellTapped,
//   });

//   final List<CalendarEvent> events;
//   final void Function(DateTime, int)? onCellTapped;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(calenderViewModelProvider);
//     final notifier = ref.read(calenderViewModelProvider.notifier);

//     return Column(
//       key: columnKey,
//       children: [
//         const DaysOfTheWeek(),
//         Expanded(
//           child: PageView.builder(
//             controller: state.pageController,
//             itemBuilder: (context, index) {
//               return CalenderPage(
//                 visiblePageDate: index.visibleDateTime,
//                 events: events,
//                 onCellTapped: onCellTapped,
//               );
//             },
//             onPageChanged: (index) => notifier.changeCurrentIndex(index),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CalenderPage extends ConsumerWidget {
//   const CalenderPage({
//     super.key,
//     required this.visiblePageDate,
//     required this.events,
//     required this.onCellTapped,
//   });

//   final DateTime visiblePageDate;
//   final List<CalendarEvent> events;
//   final void Function(DateTime, int)? onCellTapped;

//   List<DateTime> _getCurrentDates(DateTime dateTime) {
//     final List<DateTime> result = [];
//     final firstDay = _getFirstDate(dateTime);
//     result.add(firstDay);
//     for (int i = 0; i + 1 < 42; i++) {
//       result.add(firstDay.add(Duration(days: i + 1)));
//     }
//     return result;
//   }

//   DateTime _getFirstDate(DateTime dateTime) {
//     final firstDayOfTheMonth = DateTime(dateTime.year, dateTime.month, 1);
//     return firstDayOfTheMonth.add(firstDayOfTheMonth.weekday.daysDuration);
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final days = _getCurrentDates(visiblePageDate);

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(
//         6,
//         (index) {
//           return DaysRow(
//             visiblePageDate: visiblePageDate,
//             dates: days.getRange(index * 7, (index + 1) * 7).toList(),
//             dateTextStyle: BrandText.bodyS,
//             onCellTapped: (DateTime date) {
//               onCellTapped!.call(date, index);
//             },
//             todayMarkColor: BrandColor.blue,
//             todayTextColor: BrandColor.white,
//             events: events,
//           );
//         },
//       ),
//     );
//   }
// }
