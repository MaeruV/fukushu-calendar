import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_list.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_memo.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_start_day.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_title.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
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
      backgroundColor: BrandColor.background,
      appBar: const CheckTaskAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              decoration: BoxDecoration(
                color: BrandColor.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CheckTaskTitle(title: task.title),
                  const Divider(
                      color: BrandColor.black, height: 26.0, thickness: 0.1),
                  CheckTaskMemo(memo: task.memo),
                  const Divider(
                      color: BrandColor.black, height: 26.0, thickness: 0.1),
                  CheckTaskStartDay(date: task.dateTime),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                '復習日程',
                style: BrandText.bodyM,
              ),
            ),
            const SizedBox(height: 10),
            CheckTaskList(dates: task.dates),
          ],
        ),
      ),
    );
  }
}
