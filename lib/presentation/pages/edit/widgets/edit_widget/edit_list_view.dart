import 'package:ebbinghaus_forgetting_curve/application/state/analysis/analysis_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/state/edit/task_selection_view_model.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/state/tasks_provider.dart';
import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/review_range_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/component/modal_manager.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SlidableActionPropaties {
  edit,
  delete,
}

class EditListView extends ConsumerWidget {
  const EditListView({
    super.key,
    required this.dateTime,
    required this.tasks,
  });

  final DateTime dateTime;
  final List<Task> tasks;

  Color todayColor(ThemeData theme) {
    final now = DateTime.now();
    final taskDate = dateTime;

    if (taskDate.year == now.year &&
        taskDate.month == now.month &&
        taskDate.day == now.day) {
      return BrandColor.deleteRed;
    } else {
      return theme.primaryColorLight;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context)!;

    // completedTaskがfalseのTaskのみを含むリストを作成
    final incompleteTasks =
        tasks.where((task) => !task.completedEvent).toList();

    // 全てのTaskがcompletedTaskでtrueの場合、何も表示しない
    if (incompleteTasks.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dateTime.toRelativeJapaneseFormat(appLocalizations.date),
              style: theme.textTheme.titleMedium!
                  .copyWith(color: todayColor(theme))),
        ),
        EditSlidableAction(tasks: incompleteTasks),
      ],
    );
  }
}

class EditSlidableAction extends ConsumerWidget {
  const EditSlidableAction({super.key, required this.tasks});
  final List<Task> tasks;

  void onPressed(
    WidgetRef ref,
    BuildContext context,
    SlidableActionPropaties action,
    Task task,
  ) async {
    final state = ref.watch(analysisViewModelProvider);
    switch (action) {
      case SlidableActionPropaties.edit:
        ref.read(temporaryTaskProvider.notifier).state = task;
        ModalManager().customShowModalSheet(context);
        break;
      case SlidableActionPropaties.delete:
        await ref.read(taskUsecaseProvider).deleteTaskEvent(
              task,
              state.dateTimeTapped,
              state.range,
            );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(editTaskAllProvider);
    return SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      child: Column(
        children: tasks
            .map(
              (task) => Slidable(
                enabled: !isEnabled,
                key: UniqueKey(),
                endActionPane: ActionPane(
                  extentRatio: 0.5,
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {}),
                  dragDismissible: false,
                  children: [
                    SlidableAction(
                      autoClose: true,
                      onPressed: (context) => onPressed(
                          ref, context, SlidableActionPropaties.edit, task),
                      backgroundColor: BrandColor.moreGrey,
                      foregroundColor: BrandColor.white,
                      icon: Icons.more_horiz,
                      label: '編集',
                      borderRadius: BorderRadius.circular(15),
                    ),
                    const SizedBox(width: 5),
                    SlidableAction(
                      autoClose: false,
                      onPressed: (context) => onPressed(
                          ref, context, SlidableActionPropaties.delete, task),
                      backgroundColor: BrandColor.deleteRed,
                      foregroundColor: BrandColor.white,
                      icon: Icons.delete_forever,
                      label: '削除',
                      borderRadius: BorderRadius.circular(15),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
                child: MainTaskWidget(task: task),
              ),
            )
            .toList(),
      ),
    );
  }
}

class MainTaskWidget extends HookConsumerWidget {
  const MainTaskWidget({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final int totalTasks = task.dates.length;
    final int completedTasks =
        task.dates.where((date) => date.checkFlag).length;
    final double completionPercentage =
        totalTasks > 0 ? (completedTasks / totalTasks) : 0.0;
    final String completionMessage =
        "${(completionPercentage * 100).toStringAsFixed(0)}%";
    final notifier = ref.read(taskSelectionViewModelProvider.notifier);

    return GestureDetector(
      onTap: () => ref.watch(editTaskAllProvider)
          ? notifier.toggleTask(task)
          : context.push('/check_task', extra: task.id),
      child: Card(
        color: theme.cardColor,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
        child: Row(
          children: [
            CheckBoxContainer(
              color: Color(task.pallete),
              task: task,
              onChanged: (flag) => notifier.toggleTask(task),
            ),
            TitleContainerWidget(task: task),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularPercentIndicator(
                radius: 35.0,
                lineWidth: 5.0,
                percent: completionPercentage,
                center: Text(completionMessage),
                progressColor: Color(task.pallete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleContainerWidget extends ConsumerWidget {
  const TitleContainerWidget({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final formattedIntervals =
        task.dates.map((interval) => '${interval.daysInterval}').join(', ');
    final appLocalizations = AppLocalizations.of(context)!;

    String selectionText = task.rangeType
        .stringToReviewRange()
        .updateSelectionText(appLocalizations);
    final formatRange =
        "${task.firstRange} ${task.secoundRange != null ? "- ${task.secoundRange}" : ""} $selectionText";

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(task.title,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall!
                    .copyWith(color: theme.primaryColorLight)),
            task.memo.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      task.memo,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelMedium!
                          .copyWith(color: theme.primaryColorLight),
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              "${appLocalizations.review_range} $formatRange",
              style: theme.textTheme.labelMedium!
                  .copyWith(color: theme.primaryColorLight),
            ),
            const SizedBox(width: 10),
            Text(
              "${appLocalizations.interval} $formattedIntervals ${appLocalizations.days_after}",
              style: theme.textTheme.labelMedium!
                  .copyWith(color: theme.primaryColorLight),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxContainer extends HookConsumerWidget {
  const CheckBoxContainer({
    super.key,
    required this.color,
    required this.task,
    required this.onChanged,
  });

  final Color color;
  final Task task;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(taskSelectionViewModelProvider)[task] ?? false;
    final isEnabled = ref.watch(editTaskAllProvider);

    return SizedBox(
      width: isEnabled ? 50 : 10,
      child: isEnabled
          ? Checkbox(value: isSelected, onChanged: onChanged)
          : const SizedBox(width: 10),
    );
  }
}
