// import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/pages/completed/views/completed_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class CompAppBar extends ConsumerWidget implements PreferredSizeWidget {
//   const CompAppBar({super.key, required this.mapEvents});

//   final Map<DateTime, List<TaskDate>> mapEvents;

//   String getTotalTaskCount(Map<DateTime, List<TaskDate>> allTasks) {
//     int totalTaskCount =
//         allTasks.values.fold(0, (sum, list) => sum + list.length);
//     return totalTaskCount.toString();
//   }

//   void todayTaskIndex(WidgetRef ref) async {
//     final now = DateTime.now();
//     final todayTaskExists = mapEvents.entries.any((entry) =>
//         entry.key.year == now.year &&
//         entry.key.month == now.month &&
//         entry.key.day == now.day);

//     if (todayTaskExists) {
//       final context = ref.watch(compTodayKeyProvider).currentContext;
//       if (context != null) {
//         await Scrollable.ensureVisible(context,
//             duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final theme = Theme.of(context);
//     final appLocalizations = AppLocalizations.of(context)!;

//     return AppBar(
//       elevation: 1.5,
//       backgroundColor: theme.scaffoldBackgroundColor,
//       centerTitle: false,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(15),
//           bottomRight: Radius.circular(15),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 10.0),
//           child: GestureDetector(
//             onTap: () => todayTaskIndex(ref),
//             child: Center(
//               child: Text(
//                 appLocalizations.today,
//                 style: theme.textTheme.titleSmall!.copyWith(color: Colors.blue),
//               ),
//             ),
//           ),
//         ),
//       ],
//       bottom: PreferredSize(
//           preferredSize: Size.zero,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
//             child: Row(
//               children: [
//                 Text(
//                   '${appLocalizations.number_of_completed_events} ${getTotalTaskCount(mapEvents)}',
//                   style:
//                       theme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
//                 ),
//               ],
//             ),
//           )),
//       title: Text(
//         appLocalizations.completed,
//         style: theme.textTheme.titleLarge!
//             .copyWith(color: theme.primaryColorLight),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
// }
