import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/modal_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_list.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_memo.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_nav.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_start_day.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_title.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CheckTaskScreen extends ConsumerWidget {
  const CheckTaskScreen({
    super.key,
    required this.taskId,
  });

  final int taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(tempTaskProvider(taskId: taskId));
    ModalManager modal = ModalManager();

    switch (config) {
      case AsyncError(:final error):
        return Text('Error: $error');

      case AsyncLoading():
        return const CircularProgressIndicator();

      case AsyncData(:final value):
        if (value == null) {
          return const CircularProgressIndicator();
        } else {
          final int totalTasks = value.dates.length;
          final int completedTasks =
              value.dates.where((date) => date.checkFlag).length;
          final double completionPercentage =
              totalTasks > 0 ? (completedTasks / totalTasks) : 0.0;
          final String completionMessage =
              "${(completionPercentage * 100).toStringAsFixed(0)}%";

          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                CheckTaskNav(
                  pallete: Color(value.pallete),
                  onTap: () {
                    ref.read(temporaryTaskProvider.notifier).state = value;
                    modal.customShowModalSheet(context);
                  },
                  backTap: () => context.pop(),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          color: Color(value.pallete).withOpacity(0.2),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    const Text('全タスク数'),
                                    const SizedBox(height: 5),
                                    RichText(
                                      text: TextSpan(
                                        text: '$totalTasks ',
                                        style: BrandText.titleM
                                            .copyWith(color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' タスク',
                                            style: BrandText.bodyS.copyWith(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text('完了タスク数'),
                                    const SizedBox(height: 5),
                                    RichText(
                                      text: TextSpan(
                                        text: '$completedTasks ',
                                        style: BrandText.titleM.copyWith(
                                          color: Color(value.pallete),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' タスク',
                                            style: BrandText.bodyS.copyWith(
                                              color: Color(value.pallete),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 20.0,
                                    percent: completionPercentage,
                                    center: Text(completionMessage),
                                    backgroundColor: BrandColor.white,
                                    progressColor: Color(value.pallete),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CheckTaskTitle(title: value.title),
                              const Divider(
                                  color: BrandColor.black,
                                  height: 26.0,
                                  thickness: 0.1),
                              CheckTaskMemo(memo: value.memo),
                              const Divider(
                                  color: BrandColor.black,
                                  height: 26.0,
                                  thickness: 0.1),
                              CheckTaskStartDay(date: value.startTime),
                              const Divider(
                                  color: BrandColor.black,
                                  height: 26.0,
                                  thickness: 0.1),
                              const Text(
                                '復習日程',
                                style: BrandText.bodyM,
                              ),
                              const SizedBox(height: 10),
                              CheckTaskList(
                                dates: value.dates
                                    .map((taskDate) => taskDate.daysInterval)
                                    .toList(),
                                startdate: value.startTime,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

      default:
        return const CircularProgressIndicator();
    }
  }
}
