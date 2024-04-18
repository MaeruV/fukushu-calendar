import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/modal_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_list.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_memo.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_notification.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_start_day.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/check_task/check_task_title.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

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
            appBar: CheckTaskAppbar(
              onTap: () {
                ref.read(temporaryTaskProvider.notifier).state = value;
                modal.customShowModalSheet(context);
              },
              backTap: () => context.pop(),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(appLocalizations.all_events,
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              color: theme.primaryColorLight)),
                                  const SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                      text: '$totalTasks ',
                                      style: BrandText.titleM.copyWith(
                                          color: theme.primaryColorLight),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: appLocalizations.event,
                                          style: BrandText.bodyS.copyWith(
                                            color: theme.primaryColorLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(appLocalizations.completed_events,
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              color: theme.primaryColorLight)),
                                  const SizedBox(height: 5),
                                  RichText(
                                    text: TextSpan(
                                      text: '$completedTasks ',
                                      style: BrandText.titleM.copyWith(
                                        color: theme.primaryColorLight,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: appLocalizations.event,
                                          style: BrandText.bodyS.copyWith(
                                            color: theme.primaryColorLight,
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
                                  progressColor: Color(value.pallete),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                            color: theme.dividerColor,
                            height: 26.0,
                            thickness: 0.1),
                        CheckTaskTitle(title: value.title),
                        Divider(
                            color: theme.dividerColor,
                            height: 26.0,
                            thickness: 0.1),
                        CheckTaskMemo(memo: value.memo),
                        Divider(
                            color: theme.dividerColor,
                            height: 26.0,
                            thickness: 0.1),
                        CheckTaskStartDay(date: value.startTime),
                        Divider(
                            color: theme.dividerColor,
                            height: 26.0,
                            thickness: 0.1),
                        Text(
                          appLocalizations.review_period,
                          style: BrandText.bodyM.copyWith(
                            color: theme.primaryColorLight,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CheckTaskList(
                          dates:
                              value.dates.map((taskDate) => taskDate).toList(),
                          startdate: value.startTime,
                        ),
                        Divider(
                            color: theme.dividerColor,
                            height: 26.0,
                            thickness: 0.1),
                        CheckTaskNotification(
                            notificationTasks: value.time.toList()),
                        Divider(
                            color: theme.dividerColor,
                            height: 26.0,
                            thickness: 0.1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

      default:
        return const CircularProgressIndicator();
    }
  }
}
