import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/completed/views/completed_screen.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CompAppBar({super.key, required this.mapEvents});

  final Map<DateTime, List<TaskDate>> mapEvents;

  String getTotalTaskCount(Map<DateTime, List<TaskDate>> allTasks) {
    int totalTaskCount =
        allTasks.values.fold(0, (sum, list) => sum + list.length);
    return totalTaskCount.toString();
  }

  void todayTaskIndex(WidgetRef ref) async {
    final now = DateTime.now();
    final todayTaskExists = mapEvents.entries.any((entry) =>
        entry.key.year == now.year &&
        entry.key.month == now.month &&
        entry.key.day == now.day);

    if (todayTaskExists) {
      final context = ref.watch(compTodayKeyProvider).currentContext;
      if (context != null) {
        await Scrollable.ensureVisible(context,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () => todayTaskIndex(ref),
            child: Text(
              '今日',
              style: BrandText.titleS.copyWith(color: BrandColor.blue),
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text(
                  '完了済みタスク数: ${getTotalTaskCount(mapEvents)}',
                  style: BrandText.bodyM.copyWith(color: BrandColor.grey),
                ),
              ],
            ),
          )),
      title: Text(
        '完了済み',
        style: BrandText.titleLM.copyWith(color: BrandColor.grey),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
