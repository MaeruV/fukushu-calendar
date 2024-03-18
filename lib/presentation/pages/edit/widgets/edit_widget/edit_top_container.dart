import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditTopContainer extends ConsumerWidget implements PreferredSizeWidget {
  const EditTopContainer({super.key});

  String getTotalTaskCount(Map<DateTime, List<Task>> allTasks) {
    int totalTaskCount =
        allTasks.values.fold(0, (sum, list) => sum + list.length);
    return totalTaskCount.toString();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalTask = ref.watch(tasksProvider);

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
                switch (totalTask) {
                  AsyncError(:final error) => Text('Error: $error'),
                  AsyncData(:final value) => Text(
                      'タスク数:  ${getTotalTaskCount(value)}',
                      style: BrandText.bodyM.copyWith(color: BrandColor.grey),
                    ),
                  _ => const CircularProgressIndicator(),
                },
              ],
            ),
          )),
      title: Text(
        'スケジュール',
        style: BrandText.titleLM.copyWith(color: BrandColor.grey),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 40);
}
