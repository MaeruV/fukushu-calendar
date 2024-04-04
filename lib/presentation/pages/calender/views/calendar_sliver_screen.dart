// import 'package:ebbinghaus_forgetting_curve/application/state/calender/calender_view_model.dart';
// import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
// import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
// import 'package:ebbinghaus_forgetting_curve/domain/entities/calendar_event.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/common/date_extension.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/calendar_list_tile.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_of_the_week.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/days_row/event_labels.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/calender/widgets/table_calendar_page_.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class CalendarSliverScreen extends ConsumerWidget {
//   const CalendarSliverScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ScrollController scrollController = ScrollController();
//     final notifier = ref.read(collapsedProvider.notifier);
//     final size = ref.watch(screenViewModelProvider);
//     final calendarTask = ref.watch(tasksCalendarProvider);
//     final theme = Theme.of(context);

//     void onCellTapped(
//         DateTime date, int index, Map<DateTime, List<CalendarEvent>> value) {
//       scrollController.animateTo(
//         0,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );

//       final notifier = ref.read(calenderViewModelProvider.notifier);
//       notifier.tappedCell(date);
//       final events = value[date];
//       if (events != null) {
//         notifier.getCalendarEvent(events);
//       } else {
//         notifier.getCalendarEvent([]);
//       }
//     }

//     switch (calendarTask) {
//       case AsyncError(:final error):
//         return Text('Error: $error');

//       case AsyncLoading():
//         return const CircularProgressIndicator();

//       case AsyncData(:final value):
//         return Scaffold(
//           backgroundColor: theme.scaffoldBackgroundColor,
//           body: NotificationListener(
//             onNotification: (ScrollNotification notification) {
//               if (notification is ScrollUpdateNotification) {
//                 notifier.state =
//                     scrollController.offset >= size.mediaHeight * 0.2;
//               }
//               return false;
//             },
//             child: CustomScrollView(
//               controller: scrollController,
//               slivers: [
//                 SliverAppBar(
//                   expandedHeight: size.mediaHeight * 0.7,
//                   backgroundColor: theme.scaffoldBackgroundColor,
//                   pinned: true,
//                   floating: false,
//                   snap: false,
//                   toolbarHeight: size.mediaHeight * 0.4,
//                   flexibleSpace: FlexibleSpaceBar(
//                     expandedTitleScale: 1.0,
//                     centerTitle: true,
//                     titlePadding: EdgeInsets.zero,
//                     title: LayoutBuilder(builder: (context, constraints) {
//                       return LayoutBuilder(
//                         builder:
//                             (BuildContext context, BoxConstraints constraints) {
//                           return Column(
//                             children: [
//                               SizedBox(height: size.safeAreaTop),
//                               SubjectWidget(mapEvents: value),
//                               const DaysOfTheWeek(),
//                               CalenderPageView(
//                                 events: value.values
//                                     .expand((events) => events)
//                                     .toList(),
//                                 onCellTapped: (date, index) =>
//                                     onCellTapped.call(date, index, value),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     }),
//                   ),
//                 ),
//                 SliverList(
//                   delegate: SliverChildListDelegate(
//                     [CalendarSliverList(mapEvents: value)],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       default:
//         return const CircularProgressIndicator();
//     }
//   }
// }


