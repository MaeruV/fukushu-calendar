import 'package:ebbinghaus_forgetting_curve/application/usecases/task/task_usecase.dart';
import 'package:ebbinghaus_forgetting_curve/domain/entities/task.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/common/date_time_extension.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/presentation_mixin.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

enum SlidableActionPropaties {
  edit,
  delete,
}

class EditListView extends ConsumerWidget {
  const EditListView({super.key, required this.dateTime, required this.tasks});

  final DateTime dateTime;
  final List<Task> tasks;

  Color todayColor() {
    final now = DateTime.now();
    final taskDate = dateTime;

    if (taskDate.year == now.year &&
        taskDate.month == now.month &&
        taskDate.day == now.day) {
      return BrandColor.deleteRed;
    } else {
      return BrandColor.grey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${dateTime.toRelativeJapaneseFormat()}から',
            style: BrandText.titleM.copyWith(color: todayColor()),
          ),
        ),
        EditSlidableAction(tasks: tasks),
      ],
    );
  }
}

class EditSlidableAction extends ConsumerWidget with PresentationMixin {
  const EditSlidableAction({super.key, required this.tasks});
  final List<Task> tasks;

  void onPressed(
    WidgetRef ref,
    BuildContext context,
    SlidableActionPropaties action,
    Task task,
  ) async {
    switch (action) {
      case SlidableActionPropaties.edit:
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The edit button was tapped!!')));
        break;
      case SlidableActionPropaties.delete:
        final controller = Slidable.of(context);
        controller!.dismiss(
          ResizeRequest(const Duration(milliseconds: 300), () async {
            await ref.read(taskUsecaseProvider).deleteTaskEvent(task);
          }),
          duration: const Duration(milliseconds: 300),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: tasks
          .map(
            (task) => Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(
                extentRatio: 0.5,
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                dragDismissible: false,
                children: [
                  SlidableAction(
                    onPressed: (context) => onPressed(
                        ref, context, SlidableActionPropaties.edit, task),
                    backgroundColor: BrandColor.moreGrey,
                    foregroundColor: BrandColor.white,
                    icon: Icons.more_horiz,
                    label: '編集',
                  ),
                  SlidableAction(
                    autoClose: false,
                    onPressed: (context) => onPressed(
                        ref, context, SlidableActionPropaties.delete, task),
                    backgroundColor: BrandColor.deleteRed,
                    foregroundColor: BrandColor.white,
                    icon: Icons.delete_forever,
                    label: '削除',
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () async {
                  context.push('/check_task', extra: task.id);
                },
                child: MainTaskWidget(task: task),
              ),
            ),
          )
          .toList(),
    );
  }
}

class MainTaskWidget extends ConsumerWidget {
  const MainTaskWidget({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formattedIntervals =
        task.dates.map((interval) => '${interval.daysInterval}').join(', ');

    final int totalTasks = task.dates.length;
    final int completedTasks =
        task.dates.where((date) => date.checkFlag).length;
    final double completionPercentage =
        totalTasks > 0 ? (completedTasks / totalTasks) : 0.0;
    final String completionMessage =
        "${(completionPercentage * 100).toStringAsFixed(0)}%";

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
              color:
                  TaskColorPalette.lightPalette[task.pallete]!.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              Container(
                width: 8,
                decoration: BoxDecoration(
                    color: TaskColorPalette.normalPalette[task.pallete],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 15.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: BrandText.bodyLM,
                      ),
                      task.memo.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, bottom: 5.0, top: 5.0),
                              child: Text(
                                task.memo,
                                style: BrandText.bodyS
                                    .copyWith(color: BrandColor.grey),
                              ),
                            )
                          : const SizedBox.shrink(),
                      Row(
                        children: [
                          const Text(
                            '復習間隔',
                            style: BrandText.bodyS,
                          ),
                          const SizedBox(width: 20),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              formattedIntervals,
                              style: BrandText.bodyS,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Text(
                            "日後",
                            style: BrandText.bodyS,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularPercentIndicator(
                  radius: 35.0,
                  lineWidth: 5.0,
                  percent: completionPercentage,
                  center: Text(completionMessage),
                  backgroundColor: BrandColor.white,
                  progressColor: TaskColorPalette.normalPalette[task.pallete],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
