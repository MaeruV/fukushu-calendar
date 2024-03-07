import 'package:ebbinghaus_forgetting_curve/application/state/home/screen_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_calendar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_color.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_interval.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_memo.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_nav.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_title.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskModalScreen extends HookConsumerWidget {
  const AddTaskModalScreen({super.key, required this.parentContext});

  final BuildContext parentContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final safeArea = ref.watch(screenViewModelProvider);
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
          color: BrandColor.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      height: safeArea.mediaHeight - safeArea.safeAreaTop,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AddTaskNav(),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: keyboardHeight),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AddTaskTitle(),
                    AddTaskMemo(),
                    AddTaskCalendar(),
                    SizedBox(height: 20),
                    AddTaskInterval(),
                    SizedBox(height: 20),
                    AddTaskColor(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
