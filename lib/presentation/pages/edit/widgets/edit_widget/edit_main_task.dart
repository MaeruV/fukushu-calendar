// import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
// import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

// enum SlidableActionPropaties {
//   edit,
//   delete,
// }

// class MainTaskEvent extends StatefulWidget {
//   const MainTaskEvent({super.key});

//   @override
//   State<MainTaskEvent> createState() => _MainTaskEventState();
// }

// class _MainTaskEventState extends State<MainTaskEvent> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 height: 1,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: BrandColor.grey,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20.0),
//                     topRight: Radius.circular(20.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 '今日から',
//                 style: BrandText.titleM,
//               ),
//             ],
//           ),
//         ),
//         const MainTask()
//       ],
//     );
//   }
// }

// class MainTask extends ConsumerWidget {
//   const MainTask({
//     super.key,
//     // required this.items,
//   });
//   // final List<String> items;

//   void onPressed(
//     WidgetRef ref,
//     BuildContext context,
//     SlidableActionPropaties action,
//     String item,
//   ) {
//     switch (action) {
//       case SlidableActionPropaties.edit:
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('The edit button was tapped!!')));
//         break;
//       case SlidableActionPropaties.delete:
//         final controller = Slidable.of(context);
//         controller!.dismiss(
//           ResizeRequest(const Duration(milliseconds: 300), () {
//             ref.read(mainTaskViewModelProvider.notifier).removeValue(item);
//           }),
//           duration: const Duration(milliseconds: 300),
//         );
//         break;
//       default:
//     }
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(mainTaskViewModelProvider);
//     return Column(
//       children: state
//           .map(
//             (item) => Slidable(
//               key: UniqueKey(),
//               endActionPane: ActionPane(
//                 extentRatio: 0.5,
//                 motion: const ScrollMotion(),
//                 dismissible: DismissiblePane(onDismissed: () {}),
//                 dragDismissible: false,
//                 children: [
//                   SlidableAction(
//                     onPressed: (context) => onPressed(
//                         ref, context, SlidableActionPropaties.edit, item),
//                     backgroundColor: BrandColor.moreGrey,
//                     foregroundColor: BrandColor.white,
//                     icon: Icons.more_horiz,
//                     label: '編集',
//                   ),
//                   SlidableAction(
//                     autoClose: false,
//                     onPressed: (context) => onPressed(
//                         ref, context, SlidableActionPropaties.delete, item),
//                     backgroundColor: BrandColor.deleteRed,
//                     foregroundColor: BrandColor.white,
//                     icon: Icons.delete_forever,
//                     label: '削除',
//                   ),
//                 ],
//               ),
//               child: MainTaskWidget(item: item),
//             ),
//           )
//           .toList(),
//     );
//   }
// }

// class MainTaskWidget extends ConsumerWidget {
//   const MainTaskWidget({super.key, required this.item});

//   final String item;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 20,
//                     height: 20,
//                     decoration: BoxDecoration(
//                       color: BrandColor.blue,
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   Text(
//                     item,
//                     style: BrandText.bodyL,
//                   )
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const Row(
//                 children: [
//                   Text(
//                     '復習間隔',
//                     style: BrandText.bodyM,
//                   ),
//                   SizedBox(width: 20),
//                   Text(
//                     '1, 3, 7, 14, 30日後',
//                     style: BrandText.bodyM,
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
