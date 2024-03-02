import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckTaskScreen extends ConsumerWidget {
  const CheckTaskScreen({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CheckTaskAppBar(),
      body: Container(
        color: BrandColor.deleteRed,
        child: Center(
          child: Text(task.title),
        ),
      ),
    );
  }
}
