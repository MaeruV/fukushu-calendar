import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
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
