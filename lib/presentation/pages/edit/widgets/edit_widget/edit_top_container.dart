import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditTopContainer extends ConsumerWidget {
  const EditTopContainer({super.key});

  String getTotalTaskCount(Map<DateTime, List<Task>> allTasks) {
    int totalTaskCount =
        allTasks.values.fold(0, (sum, list) => sum + list.length);
    return totalTaskCount.toString();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalTask = ref.watch(tasksProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'スケジュール',
            style: BrandText.titleLM.copyWith(color: BrandColor.grey),
          ),
          const SizedBox(height: 10),
          Row(
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
        ],
      ),
    );
  }
}
