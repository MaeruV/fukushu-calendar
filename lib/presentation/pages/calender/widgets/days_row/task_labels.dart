import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkboxProvider = StateProvider((ref) => false);

class TaskLabels extends ConsumerWidget {
  const TaskLabels({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkboxProvider);

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                task.title,
                style: BrandText.bodyL,
              ),
              Text(
                task.memo.toString(),
                style: BrandText.bodyM.copyWith(color: BrandColor.grey),
              ),
            ],
          ),
        ),
        Checkbox(
          activeColor: BrandColor.blue,
          value: state,
          onChanged: (value) {
            if (value != null) {
              ref.read(checkboxProvider.notifier).state = value;
            } else {
              ref.read(checkboxProvider.notifier).state = false;
            }
          },
        )
      ],
    );
  }
}
